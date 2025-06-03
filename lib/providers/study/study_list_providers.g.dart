// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$studyListsHash() => r'c245424422e179d3b7f08a43d1fb74e60dcef76b';

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

typedef StudyListsRef = AutoDisposeStreamProviderRef<List<StudyList>>;
String _$activeStudyListHash() => r'd2215d67ff039ddc8ec75bc8f9fdcb9c5841cc13';

/// See also [activeStudyList].
@ProviderFor(activeStudyList)
final activeStudyListProvider = AutoDisposeFutureProvider<StudyList?>.internal(
  activeStudyList,
  name: r'activeStudyListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeStudyListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ActiveStudyListRef = AutoDisposeFutureProviderRef<StudyList?>;
String _$activeStudyListIdHash() => r'131d36182b513ada0fc9279d6dabda9d7b2d5978';

/// See also [ActiveStudyListId].
@ProviderFor(ActiveStudyListId)
final activeStudyListIdProvider =
    NotifierProvider<ActiveStudyListId, int?>.internal(
  ActiveStudyListId.new,
  name: r'activeStudyListIdProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$activeStudyListIdHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ActiveStudyListId = Notifier<int?>;
String _$studyListFormHash() => r'f407bc38b7b1b453783e84340152c045af87c713';

/// See also [StudyListForm].
@ProviderFor(StudyListForm)
final studyListFormProvider =
    AutoDisposeNotifierProvider<StudyListForm, StudyList>.internal(
  StudyListForm.new,
  name: r'studyListFormProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$studyListFormHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StudyListForm = AutoDisposeNotifier<StudyList>;
String _$studyListFormNotifierHash() =>
    r'27f87e996a02ec570e84254650083e0c569b5ea9';

/// See also [StudyListFormNotifier].
@ProviderFor(StudyListFormNotifier)
final studyListFormNotifierProvider = AutoDisposeNotifierProvider<
    StudyListFormNotifier, StudyListFormState>.internal(
  StudyListFormNotifier.new,
  name: r'studyListFormNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$studyListFormNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StudyListFormNotifier = AutoDisposeNotifier<StudyListFormState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
