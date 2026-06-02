import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/models/test_record.dart';
import 'package:quizlone/providers/core/core_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../i18n/generated/translations.g.dart';
import '../../models/enums/enums.dart';
import '../../models/study_list.dart';
import '../../models/term.dart';
import '../study/study_list_providers.dart';
import '../study/study_options_provider.dart';

part 'test_controller.g.dart';

final _log = Logger("TestController");

/// Represents a single question in the test, tracking user input and grading status.
/// Used to render both the interactive test view and the post-submission review screen.
@immutable
class TestQuestion {
  const TestQuestion({
    required this.originalTerm,
    required this.questionText,
    required this.correctAnswerText,
    required this.isQuestionDefinition,
    this.multipleChoiceOptions,
    this.userAnswerText,
    this.isCorrect,
  });

  final String correctAnswerText;
  final bool? isCorrect;
  final bool isQuestionDefinition;
  final List<String>? multipleChoiceOptions;
  final Term originalTerm;
  final String questionText;
  final String? userAnswerText;

  TestQuestion copyWith({
    String? userAnswerText,
    bool? isCorrect,
    bool clearUserAnswer = false,
  }) {
    return TestQuestion(
      originalTerm: originalTerm,
      questionText: questionText,
      correctAnswerText: correctAnswerText,
      isQuestionDefinition: isQuestionDefinition,
      multipleChoiceOptions: multipleChoiceOptions,
      userAnswerText: clearUserAnswer
          ? null
          : (userAnswerText ?? this.userAnswerText),
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

/// Encapsulates the entire state of the Test Mode screen.
/// Tracks the generated questions, user progress, and any submission errors.
@immutable
class TestScreenState {
  const TestScreenState({
    this.questions = const [],
    this.testFormat = TestFormat.written,
    this.questionType = StudyQuestionType.definition,
    this.isLoading = true,
    this.isSubmitted = false,
    this.submissionError,
    this.errorMessage,
  });

  final String? errorMessage;
  final bool isLoading;
  final bool isSubmitted;
  final StudyQuestionType questionType;
  final List<TestQuestion> questions;
  final TestFormat testFormat;

  /// Non-fatal error that occurs after grading (e.g., DB save failure).
  /// Allows the UI to show results while warning the user about sync issues.
  final String? submissionError;

  int get score => questions.where((q) => q.isCorrect == true).length;
  int get totalQuestions => questions.length;
  List<TestQuestion> get incorrectAnswers =>
      questions.where((q) => q.isCorrect == false).toList();

  TestScreenState copyWith({
    List<TestQuestion>? questions,
    TestFormat? testFormat,
    StudyQuestionType? questionType,
    bool? isLoading,
    bool? isSubmitted,
    String? errorMessage,
    String? submissionError,
    bool clearError = false,
    bool clearSubmissionError = false,
  }) {
    return TestScreenState(
      questions: questions ?? this.questions,
      testFormat: testFormat ?? this.testFormat,
      questionType: questionType ?? this.questionType,
      isLoading: isLoading ?? this.isLoading,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      submissionError: clearSubmissionError
          ? null
          : submissionError ?? this.submissionError,
    );
  }
}

@riverpod
class TestController extends _$TestController {
  /// Updates the user's typed answer for a specific written question.
  /// Ignores input if the test has already been submitted to prevent data tampering.
  void updateUserAnswer(int questionIndex, String answer) {
    if (state.isLoading || state.value == null || state.value!.isSubmitted) {
      return;
    }

    final currentState = state.value!;
    if (questionIndex < 0 || questionIndex >= currentState.questions.length) {
      return;
    }

    List<TestQuestion> updatedQuestions = List.from(currentState.questions);
    updatedQuestions[questionIndex] = updatedQuestions[questionIndex].copyWith(
      userAnswerText: answer,
    );
    state = AsyncData(currentState.copyWith(questions: updatedQuestions));
  }

  /// Grades the test, saves the record to the local DB, and transitions to the results view.
  /// Catches DB errors and exposes them via `submissionError` without blocking the UI.
  Future<void> submitTest() async {
    if (state.isLoading || state.value == null || state.value!.isSubmitted) {
      return;
    }

    final currentState = state.value!;
    if (currentState.questions.isEmpty) return;

    final activeListId = ref.read(activeStudyListIdProvider);
    if (activeListId == null) return;

    final allowSubstring = ref.read(allowAnswerSubstringProvider);
    List<TestQuestion> gradedQuestions = [];
    List<TestAnswerRecord> answerRecords = [];

    for (var q in currentState.questions) {
      bool correct = false;
      final userAnswer = q.userAnswerText?.trim() ?? "";
      final correctAnswer = q.correctAnswerText.trim();

      if (userAnswer.isNotEmpty) {
        final uaLower = userAnswer.toLowerCase();
        final caLower = correctAnswer.toLowerCase();

        // Supports comma-separated accepted answers for flexible grading.
        if (allowSubstring && caLower.contains(',')) {
          final correctParts = caLower
              .split(',')
              .map((p) => p.trim())
              .where((p) => p.isNotEmpty);
          correct = (uaLower == caLower) || correctParts.contains(uaLower);
        } else {
          correct = uaLower == caLower;
        }
      }

      gradedQuestions.add(q.copyWith(isCorrect: correct));
      answerRecords.add(
        TestAnswerRecord(
          questionText: q.questionText,
          correctAnswer: q.correctAnswerText,
          userAnswer: q.userAnswerText,
          isCorrect: correct,
        ),
      );
    }

    final gradedState = currentState.copyWith(
      questions: gradedQuestions,
      isSubmitted: true,
    );
    state = AsyncData(gradedState);

    final record = TestRecord(
      studyListId: activeListId,
      score: gradedState.score,
      totalQuestions: gradedState.totalQuestions,
      answers: answerRecords,
    );

    try {
      await ref.read(databaseServiceProvider).saveTestRecord(record);
      _log.fine("[TestController] Test record saved successfully.");
    } catch (e, s) {
      _log.severe("[TestController] Failed to save test record to DB", e, s);
      // Degrade gracefully: Show results but warn user that history wasn't saved.
      if (ref.mounted) {
        state = AsyncData(
          gradedState.copyWith(
            submissionError: t.general.genericError(error: e.toString()),
          ),
        );
      }
    }
  }

  /// Rehydrates the controller state from a historical DB record for the review screen.
  void loadHistoricalRecord(TestRecord record) {
    final questions = record.answers.map((ans) {
      final dummyTerm = Term()
        ..termText = "..."
        ..definitionText = "...";
      return TestQuestion(
        originalTerm: dummyTerm,
        questionText: ans.questionText,
        correctAnswerText: ans.correctAnswer,
        isQuestionDefinition: false,
        userAnswerText: ans.userAnswer,
        isCorrect: ans.isCorrect,
      );
    }).toList();

    state = AsyncData(
      TestScreenState(
        questions: questions,
        isSubmitted: true,
        isLoading: false,
        testFormat: TestFormat.written,
        questionType: StudyQuestionType.definition,
      ),
    );
  }

  void restartTest() => ref.invalidateSelf();

  /// Generates fallback options for Multiple Choice questions when insufficient distractors exist.
  List<String> _generateMultipleChoices(
    String correctAnswer,
    List<Term> allSourceTerms,
    bool fromDefinitions,
    int count,
  ) {
    final Set<String> choices = {correctAnswer};
    final List<String> potentialDistractors = allSourceTerms
        .map((t) => fromDefinitions ? t.definitionText : t.termText)
        .where((text) => text.toLowerCase() != correctAnswer.toLowerCase())
        .toList();

    potentialDistractors.shuffle(Random());
    for (var distractor in potentialDistractors) {
      if (choices.length >= count) break;
      choices.add(distractor);
    }

    // Fallback filler options if the study list is too short to provide unique distractors.
    int fillerIndex = 1;
    while (choices.length < count) {
      String fillerOption = t.testScreen.mcFallbackOption(
        number: choices.length + fillerIndex,
      );
      while (choices.contains(fillerOption) || fillerOption == correctAnswer) {
        fillerIndex++;
        fillerOption = t.testScreen.mcFallbackOption(
          number: choices.length + fillerIndex,
        );
      }
      choices.add(fillerOption);
    }

    final finalChoices = choices.toList()..shuffle(Random());
    return finalChoices;
  }

  /// Fetches the active list and generates the initial test questions based on user settings.
  Future<TestScreenState> _generateTestState() async {
    _log.fine("[TestController] _generateTestState started");
    ref.watch(activeStudyListProvider);

    final studyLengthOption = ref.watch(studyLengthProvider);
    final testFormatOption = ref.watch(testQuestionFormatProvider);
    final questionTypeOption = ref.watch(studyAskWithProvider);

    StudyList? activeList;
    try {
      activeList = await ref.read(activeStudyListProvider.future);
      if (!ref.mounted) throw Exception("Provider disposed");
    } catch (e, s) {
      _log.warning("[TestController] Error fetching active list", e, s);
      return TestScreenState(
        isLoading: false,
        errorMessage: t.testScreen.errors.loadFailed,
        testFormat: testFormatOption,
        questionType: questionTypeOption,
      );
    }

    if (activeList == null || activeList.terms.isEmpty) {
      return TestScreenState(
        isLoading: false,
        errorMessage: t.testScreen.errors.noTerms,
        testFormat: testFormatOption,
        questionType: questionTypeOption,
      );
    }

    List<Term> termsForTest = List.from(activeList.terms)..shuffle(Random());
    if (studyLengthOption != null &&
        studyLengthOption > 0 &&
        studyLengthOption < termsForTest.length) {
      termsForTest = termsForTest.sublist(0, studyLengthOption);
    }

    if (termsForTest.isEmpty) {
      return TestScreenState(
        isLoading: false,
        errorMessage: t.testScreen.errors.notEnoughTerms,
        testFormat: testFormatOption,
        questionType: questionTypeOption,
      );
    }

    final List<TestQuestion> testQuestions = termsForTest.map((term) {
      final bool isQuestionDef =
          questionTypeOption == StudyQuestionType.definition;
      List<String>? mcOptions;

      if (testFormatOption == TestFormat.mc) {
        mcOptions = _generateMultipleChoices(
          isQuestionDef ? term.termText : term.definitionText,
          activeList!.terms,
          isQuestionDef ? false : true,
          4,
        );
      }

      return TestQuestion(
        originalTerm: term,
        questionText: (isQuestionDef ? term.definitionText : term.termText),
        correctAnswerText: (isQuestionDef
            ? term.termText
            : term.definitionText),
        isQuestionDefinition: isQuestionDef,
        multipleChoiceOptions: mcOptions,
      );
    }).toList();

    return TestScreenState(
      questions: testQuestions,
      isLoading: false,
      testFormat: testFormatOption,
      questionType: questionTypeOption,
    );
  }

  @override
  Future<TestScreenState> build() async => _generateTestState();
}
