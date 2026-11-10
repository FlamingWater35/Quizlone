import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:window_manager/window_manager.dart';

/// Last colour pushed to the native window, so the property is only written
/// when the theme actually changes instead of on every rebuild.
Color? _appliedWindowBackground;

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

/// Paints the native window's own background with [color].
///
/// The Flutter surface does not cover every pixel of every frame: route
/// transitions scale and slide the pages, and [AppScaler] letterboxes the app
/// when the UI scale is not 100%. Whatever the window paints in those gaps is
/// what the user sees. It defaults to white, which is invisible against a light
/// theme but reads as a white flash on a dark one.
///
/// Setting the window background to the active theme's surface colour makes
/// those uncovered pixels blend in on both themes.
void syncWindowBackground(Color color) {
  if (!_isDesktop) return;
  if (_appliedWindowBackground == color) return;

  // Claim the colour now so repeated builds in the same frame stay no-ops, but
  // apply it after the frame: setting a native window property is a side effect
  // and must not run in the middle of a build.
  _appliedWindowBackground = color;
  WidgetsBinding.instance.addPostFrameCallback((_) {
    try {
      final window = WindowManager.instance.getCurrent();
      if (window == null) {
        _appliedWindowBackground = null;
        return;
      }
      window.backgroundColor = color.toNative();
    } on ArgumentError {
      // No native library available (widget tests); nothing to configure.
      _appliedWindowBackground = null;
    }
  });
}
