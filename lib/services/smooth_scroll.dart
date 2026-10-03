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

  /// Scroll offset to apply to the next newly created [ScrollPosition].
  ///
  /// Toggling smooth scrolling swaps the underlying scrollable widget type
  /// (stock ↔ silky), which destroys the current position. The wrapper
  /// widgets stash the old offset here right before the swap so the
  /// replacement position is created at the right offset — in the same
  /// frame, before anything is painted — instead of snapping to the top.
  double? pendingRestoreOffset;

  /// Static accessor kept so that [SmoothScrollNotifier] and [main] can
  /// continue to read/write the flag without importing the top-level
  /// variable directly.
  static bool get enabledGlobally => smoothScrollEnabledGlobally;
  static set enabledGlobally(bool value) => smoothScrollEnabledGlobally = value;

  @override
  ScrollPosition createScrollPosition(
    ScrollPhysics physics,
    ScrollContext context,
    ScrollPosition? oldPosition,
  ) {
    // Only consume the pending offset for a brand-new position. When
    // [oldPosition] is present, the position keeps its existing pixels.
    final restoreOffset = oldPosition == null ? pendingRestoreOffset : null;
    pendingRestoreOffset = null;
    return ScrollPositionWithSingleContext(
      physics: physics,
      context: context,
      initialPixels: restoreOffset ?? initialScrollOffset,
      keepScrollOffset: keepScrollOffset,
      oldPosition: oldPosition,
      debugLabel: debugLabel,
    );
  }
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
  }) : _enabled = enabled,
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

  /// Nearest scope data, or null when no scope is present (e.g. the fatal
  /// startup-error UI, which is built outside the main app tree). The
  /// wrappers then silently fall back to the stock scrollables.
  static SmoothScrollData? _maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SmoothScrollScope>()
        ?.notifier;
  }

  static bool enabled(BuildContext context) =>
      _maybeOf(context)?.enabled ?? false;
  static double speed(BuildContext context) => _maybeOf(context)?.speed ?? 1.1;
  static Duration duration(BuildContext context) =>
      _maybeOf(context)?.duration ?? const Duration(milliseconds: 1400);
}

// ---------------------------------------------------------------------------
// Scroll-offset preservation across smooth-scroll toggles
// ---------------------------------------------------------------------------

/// Toggling smooth scrolling swaps the underlying scrollable widget type
/// (stock ↔ silky). That destroys the current [ScrollPosition], which would
/// normally snap the view back to the top of the page.
///
/// This helper captures the offset right before the swap (in
/// `didChangeDependencies`, while the old scrollable is still attached) and
/// stashes it on the controller, where it is consumed during the creation of
/// the replacement position — i.e. before the first frame paints, so there is
/// no visible jump to the top. A post-frame check remains as a safety net
/// (it's a no-op when the primary path already worked).
class _ScrollOffsetPreserver {
  bool? _lastEnabled;

  /// Must be called from the host state's `didChangeDependencies`.
  void didChangeDependencies(
    BuildContext context,
    ScrollController? controller,
  ) {
    final enabled = SmoothScrollScope.enabled(context);
    final wasToggled = _lastEnabled != null && _lastEnabled != enabled;
    _lastEnabled = enabled;
    if (!wasToggled || controller == null || !controller.hasClients) {
      return;
    }
    final pendingOffset = controller.offset;
    if (controller is SmoothScrollController) {
      // Primary path: the replacement scrollable picks this up while it
      // creates its ScrollPosition during this same frame.
      controller.pendingRestoreOffset = pendingOffset;
    }
    // Safety net: if the new position still isn't at the expected offset
    // after layout, correct it. Skips when the primary path already worked.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!controller.hasClients) return;
      final position = controller.position;
      final target = pendingOffset
          .clamp(position.minScrollExtent, position.maxScrollExtent)
          .toDouble();
      if (position.pixels != target) {
        controller.jumpTo(target);
      }
    });
  }
}

// ---------------------------------------------------------------------------
// Conditional wrapper widgets
// ---------------------------------------------------------------------------

/// A [SingleChildScrollView] that delegates to [SilkySingleChildScrollView]
/// when smooth scrolling is enabled, and falls back to the stock widget
/// otherwise.
class SmoothSingleChildScrollView extends StatefulWidget {
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
  State<SmoothSingleChildScrollView> createState() =>
      _SmoothSingleChildScrollViewState();
}

class _SmoothSingleChildScrollViewState
    extends State<SmoothSingleChildScrollView> {
  final _ScrollOffsetPreserver _offsetPreserver = _ScrollOffsetPreserver();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preserves the scroll offset across the stock ↔ silky widget swap.
    _offsetPreserver.didChangeDependencies(context, widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    if (SmoothScrollScope.enabled(context)) {
      return SilkySingleChildScrollView(
        controller: widget.controller,
        padding: widget.padding,
        physics: widget.physics ?? const ScrollPhysics(),
        reverse: widget.reverse,
        scrollDirection: widget.scrollDirection,
        scrollSpeed: SmoothScrollScope.speed(context),
        silkyScrollDuration: SmoothScrollScope.duration(context),
        animationCurve: widget.silkyCurve,
        child: widget.child,
      );
    }
    return SingleChildScrollView(
      controller: widget.controller,
      padding: widget.padding,
      physics: widget.physics,
      reverse: widget.reverse,
      primary: widget.primary,
      scrollDirection: widget.scrollDirection,
      child: widget.child,
    );
  }
}

/// A [ListView.builder] / [ListView.separated] that delegates to the
/// silky_scroll equivalents when smooth scrolling is enabled.
class SmoothListView extends StatefulWidget {
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
  }) : separatorBuilder = null,
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
  }) : addAutomaticKeepAlives = true,
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
  State<SmoothListView> createState() => _SmoothListViewState();
}

class _SmoothListViewState extends State<SmoothListView> {
  final _ScrollOffsetPreserver _offsetPreserver = _ScrollOffsetPreserver();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Preserves the scroll offset across the stock ↔ silky widget swap.
    _offsetPreserver.didChangeDependencies(context, widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    if (SmoothScrollScope.enabled(context)) {
      if (widget.separatorBuilder != null) {
        return SilkyListView.separated(
          controller: widget.controller,
          padding: widget.padding,
          physics: widget.physics ?? const ScrollPhysics(),
          reverse: widget.reverse,
          shrinkWrap: widget.shrinkWrap,
          itemCount: widget.itemCount,
          separatorBuilder: widget.separatorBuilder!,
          itemBuilder: widget.itemBuilder,
          addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
          addRepaintBoundaries: widget.addRepaintBoundaries,
          addSemanticIndexes: widget.addSemanticIndexes,
          scrollSpeed: SmoothScrollScope.speed(context),
          silkyScrollDuration: SmoothScrollScope.duration(context),
          animationCurve: widget.silkyCurve,
        );
      }
      return SilkyListView.builder(
        controller: widget.controller,
        padding: widget.padding,
        physics: widget.physics ?? const ScrollPhysics(),
        reverse: widget.reverse,
        shrinkWrap: widget.shrinkWrap,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder,
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
        addRepaintBoundaries: widget.addRepaintBoundaries,
        addSemanticIndexes: widget.addSemanticIndexes,
        cacheExtent: widget.cacheExtent,
        scrollSpeed: SmoothScrollScope.speed(context),
        silkyScrollDuration: SmoothScrollScope.duration(context),
        animationCurve: widget.silkyCurve,
      );
    }
    if (widget.separatorBuilder != null) {
      return ListView.separated(
        controller: widget.controller,
        padding: widget.padding,
        physics: widget.physics,
        reverse: widget.reverse,
        shrinkWrap: widget.shrinkWrap,
        itemCount: widget.itemCount,
        separatorBuilder: widget.separatorBuilder!,
        itemBuilder: widget.itemBuilder,
        addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
        addRepaintBoundaries: widget.addRepaintBoundaries,
        addSemanticIndexes: widget.addSemanticIndexes,
        scrollCacheExtent: widget.cacheExtent != null
            ? ScrollCacheExtent.pixels(widget.cacheExtent!)
            : null,
      );
    }
    return ListView.builder(
      controller: widget.controller,
      padding: widget.padding,
      physics: widget.physics,
      reverse: widget.reverse,
      shrinkWrap: widget.shrinkWrap,
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      scrollCacheExtent: widget.cacheExtent != null
          ? ScrollCacheExtent.pixels(widget.cacheExtent!)
          : null,
    );
  }
}
