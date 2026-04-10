import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';
import 'package:open_filex/open_filex.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pub_semver/pub_semver.dart';

import '../models/update_info.dart';

final _log = Logger('UpdaterService');

const _githubOwner = 'FlamingWater35';
const _githubRepo = 'Quizlone';
const _githubApiUrl =
    'https://api.github.com/repos/$_githubOwner/$_githubRepo/releases/latest';

class UpdaterService {
  final Dio _dio = Dio();

  Future<UpdateInfo?> checkForUpdate() async {
    if (kIsWeb) return null;

    final bool isDesktop =
        Platform.isWindows || Platform.isMacOS || Platform.isLinux;
    if (!Platform.isAndroid && !isDesktop) return null;

    try {
      final info = await PackageInfo.fromPlatform();
      final currentVersion = Version.parse(info.version);
      _log.fine('Current app version: $currentVersion');

      final response = await http.get(Uri.parse(_githubApiUrl));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final latestVersionStr = (json['tag_name'] as String).replaceAll(
          'v',
          '',
        );
        final latestVersion = Version.parse(latestVersionStr);

        _log.fine('Latest GitHub release version: $latestVersion');

        if (latestVersion > currentVersion) {
          final assets = json['assets'] as List;
          dynamic targetAsset;

          if (Platform.isAndroid) {
            targetAsset = assets.firstWhere(
              (a) => (a['name'] as String).contains('arm64-v8a.apk'),
              orElse: () => assets.firstWhere(
                (a) => (a['name'] as String).endsWith('.apk'),
                orElse: () => null,
              ),
            );
          } else if (Platform.isWindows) {
            targetAsset = assets.firstWhere(
              (a) => (a['name'] as String).contains('Setup.exe'),
              orElse: () => assets.firstWhere(
                (a) => (a['name'] as String).contains('Windows-portable.7z'),
                orElse: () => null,
              ),
            );
          } else if (Platform.isLinux) {
            targetAsset = assets.firstWhere(
              (a) => (a['name'] as String).endsWith('.AppImage'),
              orElse: () => assets.firstWhere(
                (a) => (a['name'] as String).endsWith('.tar.gz'),
                orElse: () => null,
              ),
            );
          } else if (Platform.isMacOS) {
            targetAsset = assets.firstWhere(
              (a) => (a['name'] as String).toLowerCase().endsWith('.dmg'),
              orElse: () => null,
            );
          }

          if (targetAsset != null) {
            return UpdateInfo(
              version: latestVersionStr,
              releaseNotes: json['body'],
              releaseDate: DateTime.parse(json['published_at']),
              apkUrl: targetAsset['browser_download_url'],
              apkAssetName: targetAsset['name'],
            );
          }
        }
      } else {
        _log.warning(
          'Failed to check for updates. Status: ${response.statusCode}',
        );
      }
    } catch (e, s) {
      _log.severe('Error checking for updates', e, s);
    }
    return null;
  }

  Future<String?> downloadAndInstallUpdate(
    UpdateInfo updateInfo,
    void Function(int, int) onReceiveProgress,
  ) async {
    if (!Platform.isAndroid) return null;

    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/${updateInfo.apkAssetName}';

      _log.fine('Downloading update: ${updateInfo.apkUrl}');

      await _dio.download(
        updateInfo.apkUrl,
        filePath,
        onReceiveProgress: onReceiveProgress,
      );

      _log.fine('Download complete. Opening APK...');
      final result = await OpenFilex.open(filePath);

      if (result.type != ResultType.done) {
        throw Exception('Could not open APK: ${result.message}');
      }
      return filePath;
    } catch (e, s) {
      _log.severe('Error during install', e, s);
      rethrow;
    }
  }
}
