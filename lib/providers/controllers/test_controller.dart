import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/study_list.dart';
import '../../models/term.dart';
import '../study/study_list_providers.dart';
import '../study/study_options_provider.dart';

part 'test_controller.g.dart';

final _log = Logger("TestController");

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
      userAnswerText:
          clearUserAnswer ? null : (userAnswerText ?? this.userAnswerText),
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }
}

@immutable
class TestScreenState {
  const TestScreenState({
    this.questions = const [],
    this.testFormat = TestFormat.written,
    this.questionType = StudyQuestionType.definition,
    this.isLoading = true,
    this.isSubmitted = false,
    this.errorMessage,
  });

  final String? errorMessage;
  final bool isLoading;
  final bool isSubmitted;
  final StudyQuestionType questionType;
  final List<TestQuestion> questions;
  final TestFormat testFormat;

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
    bool clearError = false,
  }) {
    return TestScreenState(
      questions: questions ?? this.questions,
      testFormat: testFormat ?? this.testFormat,
      questionType: questionType ?? this.questionType,
      isLoading: isLoading ?? this.isLoading,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

@riverpod
class TestController extends _$TestController {
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

  void submitTest() {
    if (state.isLoading || state.value == null || state.value!.isSubmitted) {
      return;
    }
    final currentState = state.value!;
    if (currentState.questions.isEmpty) return;

    List<TestQuestion> gradedQuestions = [];
    for (var q in currentState.questions) {
      bool correct = false;
      if (q.userAnswerText != null) {
        correct =
            q.userAnswerText!.trim().toLowerCase() ==
            q.correctAnswerText.trim().toLowerCase();
      }
      gradedQuestions.add(q.copyWith(isCorrect: correct));
    }

    final newState = currentState.copyWith(
      questions: gradedQuestions,
      isSubmitted: true,
    );
    state = AsyncData(newState);

    _log.fine(
      "[TestController] Test submitted. Score: ${newState.score}/${newState.totalQuestions}",
    );
  }

  Future<void> restartTest() async {
    ref.invalidateSelf();
  }

  List<String> _generateMultipleChoices(
    String correctAnswer,
    List<Term> allSourceTerms,
    bool fromDefinitions,
    int count,
  ) {
    final Set<String> choices = {correctAnswer};
    final List<String> potentialDistractors =
        allSourceTerms
            .map((t) {
              final text = fromDefinitions ? t.definitionText : t.termText;
              return text;
            })
            .where((text) => text.toLowerCase() != correctAnswer.toLowerCase())
            .cast<String>()
            .toList();

    potentialDistractors.shuffle(Random());

    for (var distractor in potentialDistractors) {
      if (choices.length >= count) break;
      choices.add(distractor);
    }
    while (choices.length < count) {
      choices.add("Option ${choices.length + 1}");
    }
    final finalChoices = choices.toList();
    finalChoices.shuffle(Random());
    return finalChoices;
  }

  @override
  Future<TestScreenState> build() async {
    _log.fine("[TestController] build started");
    ref.watch(activeStudyListProvider);
    final studyLengthOption = ref.watch(studyLengthProvider);
    final testFormatOption = ref.watch(testQuestionFormatProvider);
    final questionTypeOption = ref.watch(studyAskWithProvider);

    StudyList? activeList;
    try {
      activeList = await ref.watch(activeStudyListProvider.future);
    } catch (e) {
      _log.warning("[TestController] Error fetching active list: $e");
      return TestScreenState(
        isLoading: false,
        errorMessage: "Error loading study list for test.",
        testFormat: testFormatOption,
        questionType: questionTypeOption,
      );
    }

    if (activeList == null || activeList.terms.isEmpty) {
      return TestScreenState(
        isLoading: false,
        errorMessage: "No terms available for the test.",
        testFormat: testFormatOption,
        questionType: questionTypeOption,
      );
    }

    List<Term> termsForTest = List.from(activeList.terms);
    termsForTest.shuffle(Random());

    if (studyLengthOption != null &&
        studyLengthOption > 0 &&
        studyLengthOption < termsForTest.length) {
      termsForTest = termsForTest.sublist(0, studyLengthOption);
    }

    if (termsForTest.isEmpty) {
      return TestScreenState(
        isLoading: false,
        errorMessage: "Not enough terms for the selected study length.",
        testFormat: testFormatOption,
        questionType: questionTypeOption,
      );
    }

    final List<TestQuestion> testQuestions =
        termsForTest
            .map((term) {
              final bool isQuestionDef =
                  questionTypeOption == StudyQuestionType.definition;
              List<String>? mcOptions;

              final termText = term.termText;
              final definitionText = term.definitionText;

              if (testFormatOption == TestFormat.mc) {
                mcOptions = _generateMultipleChoices(
                  isQuestionDef ? termText : definitionText,
                  activeList!.terms,
                  isQuestionDef ? false : true,
                  4,
                );
              }

              return TestQuestion(
                originalTerm: term,
                questionText:
                    (isQuestionDef ? term.definitionText : term.termText),
                correctAnswerText:
                    (isQuestionDef ? term.termText : term.definitionText),
                isQuestionDefinition: isQuestionDef,
                multipleChoiceOptions: mcOptions,
              );
            })
            .whereType<TestQuestion>()
            .toList();

    _log.fine(
      "[TestController] Test questions generated: ${testQuestions.length}",
    );
    return TestScreenState(
      questions: testQuestions,
      isLoading: false,
      testFormat: testFormatOption,
      questionType: questionTypeOption,
    );
  }
}
