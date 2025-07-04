import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '/providers/core/core_providers.dart';
import '../../models/study_list.dart';
import '../../models/term.dart';
import '../core/navigation_provider.dart';
import '../immutables/study_list_form_state.dart';

part 'study_list_providers.g.dart';

final _log = Logger("StudyListProviders");

@riverpod
Stream<List<StudyList>> studyLists(Ref ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.listenToStudyLists();
}

@Riverpod(keepAlive: true)
class ActiveStudyListId extends _$ActiveStudyListId {
  void set(String? id) {
    _log.fine("[ActiveStudyListIdProvider] set() called with id: $id.");
    state = id;
    _log.fine("[ActiveStudyListIdProvider] state is now: $state.");
  }

  @override
  String? build() {
    _log.fine(
      "[ActiveStudyListIdProvider] build() called. Initializing state to null.",
    );
    return null;
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

  Future<void> saveListAndContinue() async {
    state = state.copyWith(isLoading: true);

    if (!_parseAndValidateTerms()) {
      state = state.copyWith(isLoading: false);
      return;
    }

    final dbService = ref.read(databaseServiceProvider);
    final listToSave = state.studyList;

    try {
      _log.fine("Saving list (create/update): ${listToSave.name}");
      String savedKey = await dbService.saveStudyList(listToSave);

      ref.read(activeStudyListIdProvider.notifier).set(savedKey);
      _log.fine(
        "StudyListFormNotifier: Set activeStudyListIdProvider to $savedKey",
      );
      ref.read(currentScreenProvider.notifier).goTo(AppScreen.modeSelection);
      state = state.copyWith(isLoading: false, clearError: true);
    } catch (e, s) {
      state = state.copyWith(
        errorMessage: "Failed to save list: $e",
        isLoading: false,
      );
      _log.severe("Error saving list", e, s);
    }
  }

  void goBackToStart() {
    ref.invalidateSelf();
    ref.read(currentScreenProvider.notifier).goTo(AppScreen.start);
  }

  bool _parseAndValidateTerms() {
    final List<Term> parsedTerms = [];
    final lines =
        state.rawTermsInput
            .split('\n')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList();

    if (state.listNameInput.trim().isEmpty) {
      state = state.copyWith(errorMessage: "List name cannot be empty.");
      return false;
    }

    if (lines.isEmpty) {
      state = state.copyWith(errorMessage: "No terms/definitions entered.");
      return false;
    }

    if (lines.length < 2 || lines.length % 2 != 0) {
      state = state.copyWith(
        errorMessage:
            "Invalid format. Each term needs a definition on the next line.",
      );
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
          errorMessage:
              "Format error near line ${i + 1}. Empty term or definition found.",
        );
        return false;
      }
    }

    if (parsedTerms.isEmpty) {
      state = state.copyWith(
        errorMessage: "No valid term/definition pairs found.",
      );
      return false;
    }

    state = state.copyWith(
      studyList:
          StudyList()
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
