import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:window_manager/window_manager.dart';

bool get _isDesktop {
  if (kIsWeb) return false;
  return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
}

void setupWindow() async {
  if (_isDesktop) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(
      center: true,
      title: t.appName,
      size: const Size(1000, 700),
      minimumSize: const Size(700, 500),
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
