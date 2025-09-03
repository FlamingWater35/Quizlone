import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  const UpdateAvailable(this.info);

  final UpdateInfo info;
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
  Future<void> checkForUpdate() async {
    state = const UpdateChecking();
    final service = ref.read(updaterServiceProvider);
    try {
      final updateInfo = await service.checkForUpdate();
      if (updateInfo != null) {
        state = UpdateAvailable(updateInfo);
      } else {
        state = const UpdateNotAvailable();
      }
    } catch (e) {
      state = UpdateError(e.toString());
    }
  }

  Future<void> downloadUpdate() async {
    final currentState = state;
    if (currentState is! UpdateAvailable) return;

    state = const UpdateDownloading(0);
    final service = ref.read(updaterServiceProvider);
    try {
      final downloadedPath = await service.downloadAndInstallUpdate(
        currentState.info,
        (received, total) {
          if (total != -1 && state is UpdateDownloading) {
            state = UpdateDownloading(received / total);
          }
        },
      );
      if (downloadedPath != null) {
        await ref
            .read(databaseServiceProvider)
            .setApkPathForCleanup(downloadedPath);
      }
      state = currentState;
    } catch (e) {
      state = UpdateError(e.toString());
    }
  }

  @override
  UpdateState build() {
    if (Platform.isAndroid) {
      Future.delayed(const Duration(seconds: 3), () {
        if (state is UpdateInitial) {
          checkForUpdate();
        }
      });
    }
    return const UpdateInitial();
  }
}
