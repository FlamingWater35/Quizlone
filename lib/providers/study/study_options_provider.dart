import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/study_list.dart';
import '../../services/database_service.dart';
import '../core/core_providers.dart';
import 'study_list_providers.dart';

part 'study_options_provider.g.dart';

enum FlashcardStartSide { term, definition }

enum StudyQuestionType { term, definition }

enum TestFormat { written, mc }

final _log = Logger("StudyOptionsProvider");

Future<void> _updateListOptionInIsar(
  IsarService isarService,
  StudyList list,
) async {
  list.updateLastUsed();
  await isarService.saveStudyList(list);
}

@riverpod
class FlashcardStartWith extends _$FlashcardStartWith {
  void set(FlashcardStartSide side) {
    final activeList = ref.read(activeStudyListProvider).asData?.value;
    final isarService = ref.read(isarServiceProvider);

    if (activeList != null) {
      activeList.flashcardShowTermFirst = (side == FlashcardStartSide.term);
      _updateListOptionInIsar(isarService, activeList)
          .then((_) {
            state = side;
            _log.fine(
              "[FlashcardStartWith] Set to $side and updated Isar for ${activeList.name}",
            );
          })
          .catchError((e) {
            _log.warning("[FlashcardStartWith] Error updating Isar: $e");
            state = side;
          });
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
          _log.fine(
            "[FlashcardStartWith] Initializing from activeList data: ${activeList.flashcardShowTermFirst}",
          );
          return activeList.flashcardShowTermFirst
              ? FlashcardStartSide.term
              : FlashcardStartSide.definition;
        }
        _log.fine(
          "[FlashcardStartWith] activeList data is null, defaulting to term",
        );
        return FlashcardStartSide.term;
      },
      loading: () {
        _log.fine(
          "[FlashcardStartWith] activeStudyListProvider is loading, using previous state or default.",
        );
        return stateOrNull ?? FlashcardStartSide.term;
      },
      error: (err, stack) {
        _log.warning(
          "[FlashcardStartWith] Error in activeStudyListProvider: $err. Defaulting to term.",
        );
        return FlashcardStartSide.term;
      },
    );
  }
}

@riverpod
class StudyAskWith extends _$StudyAskWith {
  void set(StudyQuestionType type) {
    final activeList = ref.read(activeStudyListProvider).asData?.value;
    final isarService = ref.read(isarServiceProvider);

    if (activeList != null) {
      activeList.studyShowDefinitionAskTerm =
          (type == StudyQuestionType.definition);
      _updateListOptionInIsar(isarService, activeList).then((_) {
        state = type;
      });
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
          _log.fine(
            "[StudyAskWith] Initializing from activeList data: ${activeList.studyShowDefinitionAskTerm}",
          );
          return activeList.studyShowDefinitionAskTerm
              ? StudyQuestionType.definition
              : StudyQuestionType.term;
        }
        _log.fine("[StudyAskWith] activeList data is null, defaulting to term");
        return StudyQuestionType.definition;
      },
      loading: () {
        _log.fine(
          "[StudyAskWith] activeStudyListProvider is loading, using previous state or default.",
        );
        return stateOrNull ?? StudyQuestionType.definition;
      },
      error: (err, stack) {
        _log.warning(
          "[StudyAskWith] Error in activeStudyListProvider: $err. Defaulting to term.",
        );
        return StudyQuestionType.definition;
      },
    );
  }
}

@riverpod
class TestQuestionFormat extends _$TestQuestionFormat {
  void set(TestFormat format) {
    final activeList = ref.read(activeStudyListProvider).asData?.value;
    final isarService = ref.read(isarServiceProvider);

    if (activeList != null) {
      activeList.testFormat = (format == TestFormat.mc) ? 'mc' : 'written';
      _updateListOptionInIsar(isarService, activeList).then((_) {
        state = format;
      });
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
          _log.fine(
            "[TestQuestionFormat] Initializing from activeList data: ${activeList.testFormat}",
          );
          return activeList.testFormat == 'mc'
              ? TestFormat.mc
              : TestFormat.written;
        }
        _log.fine(
          "[TestQuestionFormat] activeList data is null, defaulting to written",
        );
        return TestFormat.written;
      },
      loading: () {
        _log.fine(
          "[TestQuestionFormat] activeStudyListProvider is loading, using previous state or default.",
        );
        return stateOrNull ?? TestFormat.written;
      },
      error: (err, stack) {
        _log.warning(
          "[TestQuestionFormat] Error in activeStudyListProvider: $err. Defaulting to written.",
        );
        return TestFormat.written;
      },
    );
  }
}

@riverpod
class StudyLength extends _$StudyLength {
  void set(int? length) {
    final newLength = (length != null && length <= 0) ? null : length;
    final activeList = ref.read(activeStudyListProvider).asData?.value;
    final isarService = ref.read(isarServiceProvider);

    if (activeList != null) {
      activeList.testStudyLength = newLength;
      _updateListOptionInIsar(isarService, activeList).then((_) {
        state = newLength;
      });
    } else {
      state = newLength;
    }
  }

  void clear() {
    set(null);
  }

  @override
  int? build() {
    final activeListAsyncValue = ref.watch(activeStudyListProvider);

    return activeListAsyncValue.when(
      data: (activeList) {
        if (activeList != null) {
          _log.fine(
            "[StudyLength] Initializing from activeList data: ${activeList.testStudyLength}",
          );
          return activeList.testStudyLength;
        }
        _log.fine("[StudyLength] activeList data is null");
        return null;
      },
      loading: () {
        _log.fine(
          "[StudyLength] activeStudyListProvider is loading, using previous state or default.",
        );
        return stateOrNull;
      },
      error: (err, stack) {
        _log.warning(
          "[StudyLength] Error in activeStudyListProvider: $err. Defaulting to null.",
        );
        return null;
      },
    );
  }
}
