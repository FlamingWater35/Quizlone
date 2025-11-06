import 'dart:async';

import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/providers/core/core_providers.dart';
import '../../i18n/generated/translations.g.dart';
import '../../models/study_list.dart';
import '../../models/term.dart';
import '../immutables/study_list_form_state.dart';

part 'study_list_providers.g.dart';

final _log = Logger("StudyListProviders");

@riverpod
class StudyLists extends _$StudyLists {
  StreamSubscription? _subscription;

  Future<void> reorder(int oldIndex, int newIndex) async {
    final currentLists = state.value;
    if (currentLists == null) return;

    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final dbService = ref.read(databaseServiceProvider);
    final currentOrder = dbService.getStudyListOrder();

    final movedId = currentOrder.removeAt(oldIndex);
    currentOrder.insert(newIndex, movedId);

    await dbService.saveStudyListOrder(currentOrder);
  }

  @override
  Future<List<StudyList>> build() async {
    final dbService = ref.watch(databaseServiceProvider);

    _subscription?.cancel();

    _subscription = dbService.listenToStudyLists().listen((lists) {
      state = AsyncData(lists);
    });

    ref.onDispose(() {
      _subscription?.cancel();
    });

    return dbService.getAllStudyLists();
  }
}

@Riverpod(keepAlive: true)
class ActiveStudyListId extends _$ActiveStudyListId {
  void set(String? id) {
    _log.fine("[ActiveStudyListIdProvider] set() called with id: $id.");
    ref.read(databaseServiceProvider).saveActiveListId(id);
    state = id;
    _log.fine("[ActiveStudyListIdProvider] state is now: $state.");
  }

  @override
  String? build() {
    _log.fine(
      "[ActiveStudyListIdProvider] build() called. Initializing state from DB.",
    );
    return ref.watch(databaseServiceProvider).getActiveListId();
  }
}

@riverpod
Future<StudyList?> activeStudyList(Ref ref) async {
  final activeId = ref.watch(activeStudyListIdProvider);
  _log.fine("[activeStudyListProvider] Executing. Watched activeId: $activeId");
  if (activeId == null) return null;
  final dbService = ref.watch(databaseServiceProvider);
  final list = await dbService.getStudyListById(activeId);
  _log.fine(
    "[activeStudyListProvider] Fetched list: ${list?.name ?? 'NOT FOUND'} for ID $activeId",
  );
  return list;
}

@riverpod
class StudyListFormNotifier extends _$StudyListFormNotifier {
  void setListName(String name) {
    state = state.copyWith(listNameInput: name, clearError: true);
  }

  void setRawTerms(String terms) {
    state = state.copyWith(rawTermsInput: terms, clearError: true);
  }

  Future<bool> saveListAndContinue() async {
    state = state.copyWith(isLoading: true);

    if (!_parseAndValidateTerms()) {
      state = state.copyWith(isLoading: false);
      return false;
    }

    final dbService = ref.read(databaseServiceProvider);
    final listToSave = state.studyList;

    try {
      _log.fine("Saving list (create/update): ${listToSave.name}");
      String savedKey = await dbService.saveStudyList(listToSave);
      if (!ref.mounted) return false;

      ref.read(activeStudyListIdProvider.notifier).set(savedKey);
      _log.fine(
        "StudyListFormNotifier: Set activeStudyListIdProvider to $savedKey",
      );
      state = state.copyWith(isLoading: false, clearError: true);
      return true;
    } catch (e, s) {
      state = state.copyWith(
        errorMessage: t.inputScreen.errors.saveFailed(error: e.toString()),
        isLoading: false,
      );
      _log.severe("Error saving list", e, s);
      return false;
    }
  }

  bool _parseAndValidateTerms() {
    final List<Term> parsedTerms = [];
    final lines = state.rawTermsInput
        .split('\n')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();

    if (state.listNameInput.trim().isEmpty) {
      state = state.copyWith(errorMessage: t.inputScreen.errors.listNameEmpty);
      return false;
    }

    if (lines.isEmpty) {
      state = state.copyWith(errorMessage: t.inputScreen.errors.noTerms);
      return false;
    }

    if (lines.length < 2 || lines.length % 2 != 0) {
      state = state.copyWith(errorMessage: t.inputScreen.errors.invalidFormat);
      return false;
    }

    for (int i = 0; i < lines.length; i += 2) {
      if (lines[i].isNotEmpty && lines[i + 1].isNotEmpty) {
        parsedTerms.add(
          Term()
            ..termText = lines[i]
            ..definitionText = lines[i + 1],
        );
      } else {
        state = state.copyWith(
          errorMessage: t.inputScreen.errors.emptyTerm(line: i + 1),
        );
        return false;
      }
    }

    if (parsedTerms.isEmpty) {
      state = state.copyWith(errorMessage: t.inputScreen.errors.noValidPairs);
      return false;
    }

    state = state.copyWith(
      studyList: state.studyList
        ..name = state.listNameInput.trim()
        ..terms = parsedTerms,
      clearError: true,
    );
    return true;
  }

  @override
  StudyListFormState build() {
    return StudyListFormState.initial();
  }
}
