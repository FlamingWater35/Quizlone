// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studyListsHash() => r'877d41e1c024fb1bf75c2bbe9562e3fec837f9c3';

/// See also [studyLists].
@ProviderFor(studyLists)
final studyListsProvider = AutoDisposeStreamProvider<List<StudyList>>.internal(
  studyLists,
  name: r'studyListsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$studyListsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef StudyListsRef = AutoDisposeStreamProviderRef<List<StudyList>>;
String _$activeStudyListHash() => r'3df167782cfd80839f69822a2ddc6d4b6e5392af';

/// See also [activeStudyList].
@ProviderFor(activeStudyList)
final activeStudyListProvider = AutoDisposeFutureProvider<StudyList?>.internal(
  activeStudyList,
  name: r'activeStudyListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeStudyListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActiveStudyListRef = AutoDisposeFutureProviderRef<StudyList?>;
String _$activeStudyListIdHash() => r'f3833c1ea6945c33f2319bea9f04e52090cfae14';

/// See also [ActiveStudyListId].
@ProviderFor(ActiveStudyListId)
final activeStudyListIdProvider =
    NotifierProvider<ActiveStudyListId, String?>.internal(
      ActiveStudyListId.new,
      name: r'activeStudyListIdProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$activeStudyListIdHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ActiveStudyListId = Notifier<String?>;
String _$studyListFormNotifierHash() =>
    r'b7010c252c524314b4ed722bd132e404ab1ec329';

/// See also [StudyListFormNotifier].
@ProviderFor(StudyListFormNotifier)
final studyListFormNotifierProvider = AutoDisposeNotifierProvider<
  StudyListFormNotifier,
  StudyListFormState
>.internal(
  StudyListFormNotifier.new,
  name: r'studyListFormNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$studyListFormNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StudyListFormNotifier = AutoDisposeNotifier<StudyListFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
