import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:window_manager/window_manager.dart';

bool get _isDesktop {
  if (kIsWeb) return false;
  return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
}

/// Applies the desktop window's initial title, size and position.
///
/// Uses window_manager's native API (0.6.x), which drives Windows, Linux and
/// macOS from one C++ core and needs no plugin initialisation of its own.
void setupWindow() {
  if (!_isDesktop) return;

  // Widget tests run in a Dart VM without the nativeapi library, where looking
  // up a symbol throws ArgumentError. Degrade to a no-op there, matching how
  // 0.5.x behaved when its method channel had no implementation.
  try {
    final window = WindowManager.instance.getCurrent();
    if (window == null) return;

    window.title = t.appName;
    window.minimumSize = const Size(700, 500).toNative();

    // GTK ignores geometry changes requested before the window is mapped, and
    // the native API is synchronous (0.5.x's method-channel calls were queued,
    // so they landed after the window existed). Apply the size and centring
    // once the first frame has been laid out and the surface is realised.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      try {
        window.contentSize = const Size(1000, 700).toNative();
        window.center();
        window.show();
        window.focus();
      } on ArgumentError {
        // No native library available; nothing to configure.
      }
    });
  } on ArgumentError {
    // No native library available; nothing to configure.
  }
}
