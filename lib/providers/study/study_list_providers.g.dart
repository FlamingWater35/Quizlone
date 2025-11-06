// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StudyLists)
const studyListsProvider = StudyListsProvider._();

final class StudyListsProvider
    extends $AsyncNotifierProvider<StudyLists, List<StudyList>> {
  const StudyListsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'studyListsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$studyListsHash();

  @$internal
  @override
  StudyLists create() => StudyLists();
}

String _$studyListsHash() => r'958d2becb208c5cbe606a9f2e919ffb02958d559';

abstract class _$StudyLists extends $AsyncNotifier<List<StudyList>> {
  FutureOr<List<StudyList>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<StudyList>>, List<StudyList>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<StudyList>>, List<StudyList>>,
              AsyncValue<List<StudyList>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ActiveStudyListId)
const activeStudyListIdProvider = ActiveStudyListIdProvider._();

final class ActiveStudyListIdProvider
    extends $NotifierProvider<ActiveStudyListId, String?> {
  const ActiveStudyListIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeStudyListIdProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeStudyListIdHash();

  @$internal
  @override
  ActiveStudyListId create() => ActiveStudyListId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$activeStudyListIdHash() => r'0b75fa05f591c942362190b8472e3339b0ba5bfd';

abstract class _$ActiveStudyListId extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(activeStudyList)
const activeStudyListProvider = ActiveStudyListProvider._();

final class ActiveStudyListProvider
    extends
        $FunctionalProvider<
          AsyncValue<StudyList?>,
          StudyList?,
          FutureOr<StudyList?>
        >
    with $FutureModifier<StudyList?>, $FutureProvider<StudyList?> {
  const ActiveStudyListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeStudyListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeStudyListHash();

  @$internal
  @override
  $FutureProviderElement<StudyList?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<StudyList?> create(Ref ref) {
    return activeStudyList(ref);
  }
}

String _$activeStudyListHash() => r'3df167782cfd80839f69822a2ddc6d4b6e5392af';

@ProviderFor(StudyListFormNotifier)
const studyListFormProvider = StudyListFormNotifierProvider._();

final class StudyListFormNotifierProvider
    extends $NotifierProvider<StudyListFormNotifier, StudyListFormState> {
  const StudyListFormNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'studyListFormProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$studyListFormNotifierHash();

  @$internal
  @override
  StudyListFormNotifier create() => StudyListFormNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StudyListFormState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StudyListFormState>(value),
    );
  }
}

String _$studyListFormNotifierHash() =>
    r'a6785d0bafd028bc46f00061b5f4d24fa8858d73';

abstract class _$StudyListFormNotifier extends $Notifier<StudyListFormState> {
  StudyListFormState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StudyListFormState, StudyListFormState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StudyListFormState, StudyListFormState>,
              StudyListFormState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
