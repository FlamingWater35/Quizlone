import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:window_manager/window_manager.dart';

bool get _isWindows {
  if (kIsWeb) return false;
  return Platform.isWindows;
}

void setupWindow() async {
  if (_isWindows) {
    await windowManager.ensureInitialized();

    WindowOptions windowOptions = WindowOptions(center: true, title: t.appName);
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
