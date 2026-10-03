import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/update_info.dart';
import '../../services/updater_service.dart';
import 'core_providers.dart';

part 'updater_provider.g.dart';

@immutable
sealed class UpdateState {
  const UpdateState();
}

class UpdateInitial extends UpdateState {
  const UpdateInitial();
}

class UpdateChecking extends UpdateState {
  const UpdateChecking();
}

class UpdateAvailable extends UpdateState {
  const UpdateAvailable(this.info, {this.isAutomatic = false});

  final UpdateInfo info;

  /// Whether this update was found by the startup auto-check rather than a
  /// user-initiated check. Drives the one-time prompt snackbar.
  final bool isAutomatic;
}

class UpdateNotAvailable extends UpdateState {
  const UpdateNotAvailable();
}

class UpdateDownloading extends UpdateState {
  const UpdateDownloading(this.progress);

  final double progress;
}

class UpdateError extends UpdateState {
  const UpdateError(this.message);

  final String message;
}

@riverpod
UpdaterService updaterService(Ref ref) {
  return UpdaterService();
}

@riverpod
class UpdaterController extends _$UpdaterController {
  Future<void> checkForUpdate({bool automatic = false}) async {
    state = const UpdateChecking();
    final service = ref.read(updaterServiceProvider);
    try {
      final updateInfo = await service.checkForUpdate();
      if (!ref.mounted) return;
      if (updateInfo != null) {
        state = UpdateAvailable(updateInfo, isAutomatic: automatic);
      } else {
        state = const UpdateNotAvailable();
      }
    } catch (e) {
      if (ref.mounted) state = UpdateError(e.toString());
    }
  }

  Future<void> downloadUpdate() async {
    final currentState = state;
    if (currentState is! UpdateAvailable) return;

    if (Platform.isAndroid) {
      state = const UpdateDownloading(0);
      final service = ref.read(updaterServiceProvider);
      try {
        final downloadedPath = await service.downloadAndInstallUpdate(
          currentState.info,
          (received, total) {
            if (total != -1 && ref.mounted && state is UpdateDownloading) {
              state = UpdateDownloading(received / total);
            }
          },
        );
        if (!ref.mounted) return;
        if (downloadedPath != null) {
          await ref
              .read(databaseServiceProvider)
              .setApkPathForCleanup(downloadedPath);
        }
        state = currentState;
      } catch (e) {
        if (ref.mounted) state = UpdateError(e.toString());
      }
    } else if (Platform.isWindows) {
      // On Windows we don't download the installer directly anymore.
      // Open the GitHub release page in the default browser instead.
      final service = ref.read(updaterServiceProvider);
      await _launchUrlWithFallback(service.releasePageUrl(currentState.info));
    } else {
      await _launchUrlWithFallback(Uri.parse(currentState.info.apkUrl));
    }
  }

  /// Opens [url] externally, falling back to the latest GitHub release page
  /// if the URL can't be handled.
  Future<void> _launchUrlWithFallback(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      await launchUrl(
        Uri.parse(UpdaterService.latestReleaseUrl),
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  UpdateState build() {
    final bool isDesktop =
        !kIsWeb && (Platform.isWindows || Platform.isMacOS || Platform.isLinux);

    if (!kIsWeb && (Platform.isAndroid || isDesktop)) {
      Future.delayed(const Duration(seconds: 3), () {
        if (ref.mounted && state is UpdateInitial) {
          checkForUpdate(automatic: true);
        }
      });
    }
    return const UpdateInitial();
  }
}
