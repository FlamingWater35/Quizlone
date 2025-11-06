import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../i18n/generated/translations.g.dart';
import '../../models/enums/enums.dart';
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
      userAnswerText: clearUserAnswer
          ? null
          : (userAnswerText ?? this.userAnswerText),
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

    final allowSubstring = ref.read(allowAnswerSubstringProvider);
    List<TestQuestion> gradedQuestions = [];
    for (var q in currentState.questions) {
      bool correct = false;
      if (q.userAnswerText != null) {
        final userAnswer = q.userAnswerText!.trim().toLowerCase();
        final correctAnswer = q.correctAnswerText.trim().toLowerCase();

        if (allowSubstring && correctAnswer.contains(',')) {
          final correctParts = correctAnswer
              .split(',')
              .map((p) => p.trim())
              .where((p) => p.isNotEmpty);
          correct =
              (userAnswer == correctAnswer) ||
              correctParts.contains(userAnswer);
        } else {
          correct = userAnswer == correctAnswer;
        }
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

  void restartTest() {
    ref.invalidateSelf();
  }

  List<String> _generateMultipleChoices(
    String correctAnswer,
    List<Term> allSourceTerms,
    bool fromDefinitions,
    int count,
  ) {
    final Set<String> choices = {correctAnswer};
    final List<String> potentialDistractors = allSourceTerms
        .map((t) {
          final text = fromDefinitions ? t.definitionText : t.termText;
          return text;
        })
        .where((text) => text.toLowerCase() != correctAnswer.toLowerCase())
        .toList();

    potentialDistractors.shuffle(Random());

    for (var distractor in potentialDistractors) {
      if (choices.length >= count) break;
      choices.add(distractor);
    }
    int fillerIndex = 1;
    while (choices.length < count) {
      String fillerOption = "Option ${choices.length + fillerIndex}";
      while (choices.contains(fillerOption) || fillerOption == correctAnswer) {
        fillerIndex++;
        fillerOption = "Option ${choices.length + fillerIndex}";
      }
      choices.add(fillerOption);
    }
    final finalChoices = choices.toList();
    finalChoices.shuffle(Random());
    return finalChoices;
  }

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
        errorMessage: t.testScreen.errors.notEnoughTerms,
        testFormat: testFormatOption,
        questionType: questionTypeOption,
      );
    }

    final List<TestQuestion> testQuestions = termsForTest.map((term) {
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
        questionText: (isQuestionDef ? term.definitionText : term.termText),
        correctAnswerText: (isQuestionDef
            ? term.termText
            : term.definitionText),
        isQuestionDefinition: isQuestionDef,
        multipleChoiceOptions: mcOptions,
      );
    }).toList();

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

  @override
  Future<TestScreenState> build() async {
    return _generateTestState();
  }
}
