// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flashcard_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(FlashcardController)
const flashcardControllerProvider = FlashcardControllerProvider._();

final class FlashcardControllerProvider
    extends $AsyncNotifierProvider<FlashcardController, FlashcardScreenState> {
  const FlashcardControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'flashcardControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$flashcardControllerHash();

  @$internal
  @override
  FlashcardController create() => FlashcardController();
}

String _$flashcardControllerHash() =>
    r'df2a6ac88d92309de3ce3914533dc60dc5229b78';

abstract class _$FlashcardController
    extends $AsyncNotifier<FlashcardScreenState> {
  FutureOr<FlashcardScreenState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<FlashcardScreenState>, FlashcardScreenState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<FlashcardScreenState>,
                FlashcardScreenState
              >,
              AsyncValue<FlashcardScreenState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
