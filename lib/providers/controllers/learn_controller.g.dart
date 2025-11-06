// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learn_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(LearnController)
const learnControllerProvider = LearnControllerProvider._();

final class LearnControllerProvider
    extends $AsyncNotifierProvider<LearnController, LearnModeScreenState> {
  const LearnControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'learnControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$learnControllerHash();

  @$internal
  @override
  LearnController create() => LearnController();
}

String _$learnControllerHash() => r'c54157646565d2ef5d8e0def1056843dd69ff146';

abstract class _$LearnController extends $AsyncNotifier<LearnModeScreenState> {
  FutureOr<LearnModeScreenState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<LearnModeScreenState>, LearnModeScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<LearnModeScreenState>,
                LearnModeScreenState
              >,
              AsyncValue<LearnModeScreenState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
