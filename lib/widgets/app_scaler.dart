import 'package:flutter/material.dart';

class AppScaler extends StatelessWidget {
  const AppScaler({
    super.key,
    required this.child,
    required this.scale,
    this.followSystemScale = true,
  });

  final Widget child;
  final double scale;

  /// When true, the OS-level text scaling is preserved inside the scaled
  /// subtree. When false, text is rendered at its natural size so the
  /// in-app UI scale is the only factor.
  final bool followSystemScale;

  @override
  Widget build(BuildContext context) {
    if (scale == 1.0) return child;

    final mediaQuery = MediaQuery.of(context);
    final physicalSize = mediaQuery.size;

    final scaledSize = physicalSize / scale;

    final adjustedPixelRatio = mediaQuery.devicePixelRatio * scale;

    return FittedBox(
      fit: BoxFit.contain,
      alignment: Alignment.center,
      child: SizedBox(
        width: scaledSize.width,
        height: scaledSize.height,
        child: MediaQuery(
          data: mediaQuery.copyWith(
            size: scaledSize,
            devicePixelRatio: adjustedPixelRatio,
            textScaler: followSystemScale
                ? mediaQuery.textScaler
                : TextScaler.noScaling,
          ),
          child: child,
        ),
      ),
    );
  }
}
