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
  });

  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final ScrollPhysics? physics;
  final bool reverse;
  final bool? primary;
  final Widget? child;
  final Axis scrollDirection;

  @override
  Widget build(BuildContext context) {
    if (smoothScrollEnabledGlobally) {
      return SilkySingleChildScrollView(
        controller: controller,
        padding: padding,
        physics: physics ?? const ScrollPhysics(),
        reverse: reverse,
        scrollDirection: scrollDirection,
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

  @override
  Widget build(BuildContext context) {
    if (smoothScrollEnabledGlobally) {
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
