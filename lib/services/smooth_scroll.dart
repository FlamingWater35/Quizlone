import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmoothScrollController extends ScrollController {
  SmoothScrollController({
    super.initialScrollOffset,
    super.keepScrollOffset,
    super.debugLabel,
  });

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    return SmoothScrollPosition(
      physics: physics,
      context: context,
      initialPixels: initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      oldPosition: oldPosition,
      debugLabel: debugLabel,
    );
  }
}

class SmoothScrollPosition extends ScrollPositionWithSingleContext {
  SmoothScrollPosition({
    required super.physics,
    required super.context,
    super.initialPixels,
    super.keepScrollOffset,
    super.oldPosition,
    super.debugLabel,
  });

  double _targetPixels = 0.0;
  DateTime? _lastScrollTime;

  static const int _trackpadDetectionThresholdMs = 80;

  @override
  void pointerScroll(double delta) {
    if (!kIsWeb && Platform.isAndroid) {
      super.pointerScroll(delta);
      return;
    }

    final now = DateTime.now();
    final lastTime = _lastScrollTime;
    _lastScrollTime = now;

    if (lastTime != null) {
      final diffMs = now.difference(lastTime).inMilliseconds;
      if (diffMs < _trackpadDetectionThresholdMs) {
        super.pointerScroll(delta);
        return;
      }
    }

    if (delta == 0.0) return;

    if (activity is! DrivenScrollActivity) {
      _targetPixels = pixels;
    }

    _targetPixels += delta * 2.0;
    _targetPixels = _targetPixels.clamp(minScrollExtent, maxScrollExtent);

    animateTo(
      _targetPixels,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
    );
  }
}
