// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MatchTimer)
const matchTimerProvider = MatchTimerProvider._();

final class MatchTimerProvider extends $NotifierProvider<MatchTimer, String> {
  const MatchTimerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchTimerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchTimerHash();

  @$internal
  @override
  MatchTimer create() => MatchTimer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$matchTimerHash() => r'8294ec6124c700c6e38bb1dfa6c5303e039020b7';

abstract class _$MatchTimer extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(MatchController)
const matchControllerProvider = MatchControllerProvider._();

final class MatchControllerProvider
    extends $AsyncNotifierProvider<MatchController, MatchScreenState> {
  const MatchControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'matchControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$matchControllerHash();

  @$internal
  @override
  MatchController create() => MatchController();
}

String _$matchControllerHash() => r'169507aaef1e4f12a4c319ae3bb6f1c896191f79';

abstract class _$MatchController extends $AsyncNotifier<MatchScreenState> {
  FutureOr<MatchScreenState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<MatchScreenState>, MatchScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<MatchScreenState>, MatchScreenState>,
              AsyncValue<MatchScreenState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
