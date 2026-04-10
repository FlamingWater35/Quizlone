import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SmoothScrollGlobal {
  static bool isMouse = true;

  static bool _initialized = false;

  static void init() {
    if (_initialized) return;
    _initialized = true;
    GestureBinding.instance.pointerRouter.addGlobalRoute((PointerEvent event) {
      if (event is PointerScrollEvent) {
        isMouse = event.kind == PointerDeviceKind.mouse;
      }
    });
  }
}

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

  @override
  void pointerScroll(double delta) {
    if (delta == 0.0) return;

    if (!SmoothScrollGlobal.isMouse || delta.abs() < 15.0) {
      super.pointerScroll(delta);
      return;
    }

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
