import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ScrollCacheExtent;
import 'package:silky_scroll/silky_scroll.dart';

/// Global flag controlling whether silky smooth scrolling is active.
/// Managed by [SmoothScrollNotifier] in the settings provider.
bool smoothScrollEnabledGlobally = false;

/// Backward-compatible controller name.
///
/// The old implementation overrode [ScrollPosition.pointerScroll] with a
/// custom [DrivenScrollActivity]. All of that is now handled by the
/// `silky_scroll` package widgets, so this is simply a [ScrollController].
class SmoothScrollController extends ScrollController {
  SmoothScrollController({
    super.initialScrollOffset,
    super.keepScrollOffset,
    super.debugLabel,
  });

  /// Static accessor kept so that [SmoothScrollNotifier] and [main] can
  /// continue to read/write the flag without importing the top-level
  /// variable directly.
  static bool get enabledGlobally => smoothScrollEnabledGlobally;
  static set enabledGlobally(bool value) => smoothScrollEnabledGlobally = value;
}

// ---------------------------------------------------------------------------
// Reactive scope – avoids full-app rebuilds on toggle
// ---------------------------------------------------------------------------

/// Holds the smooth-scroll enabled flag plus tuning parameters.
/// Widgets that call [SmoothScrollScope.of] rebuild only when these values change.
class SmoothScrollData extends ChangeNotifier {
  SmoothScrollData({
    required bool enabled,
    required double speed,
    required int durationMs,
  })  : _enabled = enabled,
        _speed = speed,
        _durationMs = durationMs;

  bool _enabled;
  double _speed;
  int _durationMs;

  bool get enabled => _enabled;
  double get speed => _speed;
  Duration get duration => Duration(milliseconds: _durationMs);

  set enabled(bool value) {
    if (_enabled != value) {
      _enabled = value;
      notifyListeners();
    }
  }

  set speed(double value) {
    if (_speed != value) {
      _speed = value;
      notifyListeners();
    }
  }

  set durationMs(int value) {
    if (_durationMs != value) {
      _durationMs = value;
      notifyListeners();
    }
  }
}

class SmoothScrollScope extends InheritedNotifier<SmoothScrollData> {
  const SmoothScrollScope({
    super.key,
    required super.notifier,
    required super.child,
  });

  static SmoothScrollData _of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SmoothScrollScope>()!
        .notifier!;
  }

  static bool enabled(BuildContext context) => _of(context).enabled;
  static double speed(BuildContext context) => _of(context).speed;
  static Duration duration(BuildContext context) => _of(context).duration;
}

// ---------------------------------------------------------------------------
// Conditional wrapper widgets
// ---------------------------------------------------------------------------

/// A [SingleChildScrollView] that delegates to [SilkySingleChildScrollView]
/// when smooth scrolling is enabled, and falls back to the stock widget
/// otherwise.
class SmoothSingleChildScrollView extends StatelessWidget {
  const SmoothSingleChildScrollView({
    super.key,
    this.controller,
    this.padding,
    this.physics,
    this.reverse = false,
    this.primary,
    this.child,
    this.scrollDirection = Axis.vertical,
    this.scrollSpeed = 1.1,
    this.silkyDuration = const Duration(milliseconds: 1400),
    this.silkyCurve = Curves.easeOutQuad,
  });

  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool reverse;
  final bool? primary;
  final Widget? child;
  final Axis scrollDirection;
  final double scrollSpeed;
  final Duration silkyDuration;
  final Curve silkyCurve;

  @override
  Widget build(BuildContext context) {
    if (SmoothScrollScope.enabled(context)) {
      return SilkySingleChildScrollView(
        controller: controller,
        padding: padding,
        physics: physics ?? const ScrollPhysics(),
        reverse: reverse,
        scrollDirection: scrollDirection,
        scrollSpeed: SmoothScrollScope.speed(context),
        silkyScrollDuration: SmoothScrollScope.duration(context),
        animationCurve: silkyCurve,
        child: child,
      );
    }
    return SingleChildScrollView(
      controller: controller,
      padding: padding,
      physics: physics,
      reverse: reverse,
      primary: primary,
      scrollDirection: scrollDirection,
      child: child,
    );
  }
}

/// A [ListView.builder] / [ListView.separated] that delegates to the
/// silky_scroll equivalents when smooth scrolling is enabled.
class SmoothListView extends StatelessWidget {
  /// Creates a builder-style list (the most common pattern in Quizlone).
  const SmoothListView.builder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.controller,
    this.padding,
    this.physics,
    this.reverse = false,
    this.shrinkWrap = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.scrollSpeed = 1.1,
    this.silkyDuration = const Duration(milliseconds: 1400),
    this.silkyCurve = Curves.easeOutQuad,
  })  : separatorBuilder = null,
        addAutomaticKeepAlives = true,
        addRepaintBoundaries = true,
        addSemanticIndexes = true;

  /// Creates a separated builder-style list.
  const SmoothListView.separated({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.controller,
    this.padding,
    this.physics,
    this.reverse = false,
    this.shrinkWrap = false,
    this.cacheExtent,
    this.semanticChildCount,
    this.scrollSpeed = 1.1,
    this.silkyDuration = const Duration(milliseconds: 1400),
    this.silkyCurve = Curves.easeOutQuad,
  })  : addAutomaticKeepAlives = true,
        addRepaintBoundaries = true,
        addSemanticIndexes = true;

  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool reverse;
  final bool shrinkWrap;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final double scrollSpeed;
  final Duration silkyDuration;
  final Curve silkyCurve;

  @override
  Widget build(BuildContext context) {
    if (SmoothScrollScope.enabled(context)) {
      if (separatorBuilder != null) {
        return SilkyListView.separated(
          controller: controller,
          padding: padding,
          physics: physics ?? const ScrollPhysics(),
          reverse: reverse,
          shrinkWrap: shrinkWrap,
          itemCount: itemCount,
          separatorBuilder: separatorBuilder!,
          itemBuilder: itemBuilder,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          scrollSpeed: SmoothScrollScope.speed(context),
          silkyScrollDuration: SmoothScrollScope.duration(context),
          animationCurve: silkyCurve,
        );
      }
      return SilkyListView.builder(
        controller: controller,
        padding: padding,
        physics: physics ?? const ScrollPhysics(),
        reverse: reverse,
        shrinkWrap: shrinkWrap,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        cacheExtent: cacheExtent,
        scrollSpeed: SmoothScrollScope.speed(context),
        silkyScrollDuration: SmoothScrollScope.duration(context),
        animationCurve: silkyCurve,
      );
    }

    if (separatorBuilder != null) {
      return ListView.separated(
        controller: controller,
        padding: padding,
        physics: physics,
        reverse: reverse,
        shrinkWrap: shrinkWrap,
        itemCount: itemCount,
        separatorBuilder: separatorBuilder!,
        itemBuilder: itemBuilder,
        addAutomaticKeepAlives: addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes,
        scrollCacheExtent: cacheExtent != null
            ? ScrollCacheExtent.pixels(cacheExtent!)
            : null,
      );
    }
    return ListView.builder(
      controller: controller,
      padding: padding,
      physics: physics,
      reverse: reverse,
      shrinkWrap: shrinkWrap,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      scrollCacheExtent: cacheExtent != null
          ? ScrollCacheExtent.pixels(cacheExtent!)
          : null,
    );
  }
}
