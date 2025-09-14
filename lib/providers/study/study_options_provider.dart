import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/enums/enums.dart';
import '../../models/study_list.dart';
import '../../services/database_service.dart';
import '../core/core_providers.dart';
import 'study_list_providers.dart';

part 'study_options_provider.g.dart';

final _log = Logger("StudyOptionsProvider");

Future<void> _updateListOptionInHive(
  DatabaseService dbService,
  StudyList list,
) async {
  list.updateLastUsed();
  await dbService.saveStudyList(list);
}

@riverpod
class FlashcardStartWith extends _$FlashcardStartWith {
  Future<void> set(FlashcardStartSide side) async {
    final activeList = ref.read(activeStudyListProvider).asData?.value;
    final dbService = ref.read(databaseServiceProvider);

    if (activeList != null) {
      final previousState = state;
      state = side;

      activeList.flashcardShowTermFirst = (side == FlashcardStartSide.term);
      try {
        await _updateListOptionInHive(dbService, activeList);
      } catch (e, s) {
        state = previousState;
        _log.severe(
          "[FlashcardStartWith] Error during save for ${activeList.name}",
          e,
          s,
        );
        rethrow;
      }
    } else {
      state = side;
      _log.warning(
        "[FlashcardStartWith] No activeList, set to $side (session only)",
      );
    }
  }

  @override
  FlashcardStartSide build() {
    final activeListAsyncValue = ref.watch(activeStudyListProvider);

    return activeListAsyncValue.when(
      data: (activeList) {
        if (activeList != null) {
          return activeList.flashcardShowTermFirst
              ? FlashcardStartSide.term
              : FlashcardStartSide.definition;
        }
        return FlashcardStartSide.term;
      },
      loading: () => stateOrNull ?? FlashcardStartSide.term,
      error: (err, stack) {
        _log.warning(
          "[FlashcardStartWith] Error in activeStudyListProvider. Defaulting to term.",
          err,
          stack,
        );
        return FlashcardStartSide.term;
      },
    );
  }
}

@riverpod
class StudyAskWith extends _$StudyAskWith {
  Future<void> set(StudyQuestionType type) async {
    final activeList = ref.read(activeStudyListProvider).asData?.value;
    final dbService = ref.read(databaseServiceProvider);

    if (activeList != null) {
      final previousState = state;
      state = type;

      activeList.studyShowDefinitionAskTerm =
          (type == StudyQuestionType.definition);
      try {
        await _updateListOptionInHive(dbService, activeList);
      } catch (e, s) {
        state = previousState;
        _log.severe(
          "[StudyAskWith] Error during save for ${activeList.name}",
          e,
          s,
        );
        rethrow;
      }
    } else {
      state = type;
    }
  }

  @override
  StudyQuestionType build() {
    final activeListAsyncValue = ref.watch(activeStudyListProvider);

    return activeListAsyncValue.when(
      data: (activeList) {
        if (activeList != null) {
          return activeList.studyShowDefinitionAskTerm
              ? StudyQuestionType.definition
              : StudyQuestionType.term;
        }
        return StudyQuestionType.definition;
      },
      loading: () => stateOrNull ?? StudyQuestionType.definition,
      error: (err, stack) {
        _log.warning(
          "[StudyAskWith] Error in activeStudyListProvider. Defaulting to definition.",
          err,
          stack,
        );
        return StudyQuestionType.definition;
      },
    );
  }
}

@riverpod
class TestQuestionFormat extends _$TestQuestionFormat {
  Future<void> set(TestFormat format) async {
    final activeList = ref.read(activeStudyListProvider).asData?.value;
    final dbService = ref.read(databaseServiceProvider);

    if (activeList != null) {
      final previousState = state;
      state = format;

      activeList.testFormat = format;
      try {
        await _updateListOptionInHive(dbService, activeList);
      } catch (e, s) {
        state = previousState;
        _log.severe(
          "[TestQuestionFormat] Error during save for ${activeList.name}",
          e,
          s,
        );
        rethrow;
      }
    } else {
      state = format;
    }
  }

  @override
  TestFormat build() {
    final activeListAsyncValue = ref.watch(activeStudyListProvider);

    return activeListAsyncValue.when(
      data: (activeList) {
        if (activeList != null) {
          return activeList.testFormat;
        }
        return TestFormat.written;
      },
      loading: () => stateOrNull ?? TestFormat.written,
      error: (err, stack) {
        _log.warning(
          "[TestQuestionFormat] Error in activeStudyListProvider. Defaulting to written.",
          err,
          stack,
        );
        return TestFormat.written;
      },
    );
  }
}

@riverpod
class StudyLength extends _$StudyLength {
  Future<void> set(int? length) async {
    final newLength = (length != null && length <= 0) ? null : length;
    final activeList = ref.read(activeStudyListProvider).asData?.value;
    final dbService = ref.read(databaseServiceProvider);

    if (activeList != null) {
      final previousState = state;
      state = newLength;

      activeList.testStudyLength = newLength;
      try {
        await _updateListOptionInHive(dbService, activeList);
      } catch (e, s) {
        state = previousState;
        _log.severe(
          "[StudyLength] Error during save for ${activeList.name}",
          e,
          s,
        );
        rethrow;
      }
    } else {
      state = newLength;
    }
  }

  Future<void> clear() async {
    await set(null);
  }

  @override
  int? build() {
    final activeListAsyncValue = ref.watch(activeStudyListProvider);

    return activeListAsyncValue.when(
      data: (activeList) {
        if (activeList != null) {
          return activeList.testStudyLength;
        }
        return null;
      },
      loading: () => stateOrNull,
      error: (err, stack) {
        _log.warning(
          "[StudyLength] Error in activeStudyListProvider. Defaulting to null.",
          err,
          stack,
        );
        return null;
      },
    );
  }
}

@riverpod
class AllowAnswerSubstring extends _$AllowAnswerSubstring {
  Future<void> set(bool isEnabled) async {
    final activeList = ref.read(activeStudyListProvider).asData?.value;
    final dbService = ref.read(databaseServiceProvider);

    if (activeList != null) {
      final previousState = state;
      state = isEnabled;

      activeList.allowAnswerSubstring = isEnabled;
      try {
        await _updateListOptionInHive(dbService, activeList);
      } catch (e, s) {
        state = previousState;
        _log.severe(
          "[AllowAnswerSubstring] Error during save for ${activeList.name}",
          e,
          s,
        );
        rethrow;
      }
    } else {
      state = isEnabled;
    }
  }

  @override
  bool build() {
    final activeListAsyncValue = ref.watch(activeStudyListProvider);

    return activeListAsyncValue.when(
      data: (activeList) {
        if (activeList != null) {
          return activeList.allowAnswerSubstring;
        }
        return false;
      },
      loading: () => stateOrNull ?? false,
      error: (err, stack) {
        _log.warning(
          "[AllowAnswerSubstring] Error in activeStudyListProvider. Defaulting to false.",
          err,
          stack,
        );
        return false;
      },
    );
  }
}
