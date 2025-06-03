import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/term.dart';
import '../study/study_list_providers.dart';
import '../study/study_options_provider.dart';

part 'learn_controller.g.dart';

enum LearnFeedbackType { none, correct, incorrect, hint, skipped }

final _log = Logger("LearnController");

@immutable
class LearnQuestionState {
  const LearnQuestionState({
    required this.term,
    required this.questionText,
    required this.questionLabel,
    required this.expectedAnswer,
    this.userAnswer = "",
    this.feedbackType = LearnFeedbackType.none,
    this.feedbackMessage = "",
    this.answerSubmitted = false,
  });

  final bool answerSubmitted;
  final String expectedAnswer;
  final String feedbackMessage;
  final LearnFeedbackType feedbackType;
  final String questionLabel;
  final String questionText;
  final Term term;
  final String userAnswer;

  LearnQuestionState copyWith({
    String? userAnswer,
    LearnFeedbackType? feedbackType,
    String? feedbackMessage,
    bool? answerSubmitted,
  }) {
    return LearnQuestionState(
      term: term,
      questionText: questionText,
      questionLabel: questionLabel,
      expectedAnswer: expectedAnswer,
      userAnswer: userAnswer ?? this.userAnswer,
      feedbackType: feedbackType ?? this.feedbackType,
      feedbackMessage: feedbackMessage ?? this.feedbackMessage,
      answerSubmitted: answerSubmitted ?? this.answerSubmitted,
    );
  }
}

@immutable
class LearnModeScreenState {
  const LearnModeScreenState({
    this.allTermsInSet = const [],
    this.termsToLearnThisCycle = const [],
    this.termsIncorrectThisCycle = const [],
    this.currentTermIndexInCycle = 0,
    this.currentQuestion,
    this.cycleCount = 1,
    this.progressMessage = "",
    this.isLoading = true,
    this.isSessionComplete = false,
    this.errorMessage,
  });

  final List<Term> allTermsInSet;
  final LearnQuestionState? currentQuestion;
  final int currentTermIndexInCycle;
  final int cycleCount;
  final String? errorMessage;
  final bool isLoading;
  final bool isSessionComplete;
  final String progressMessage;
  final List<Term> termsIncorrectThisCycle;
  final List<Term> termsToLearnThisCycle;

  LearnModeScreenState copyWith({
    List<Term>? allTermsInSet,
    List<Term>? termsToLearnThisCycle,
    List<Term>? termsIncorrectThisCycle,
    int? currentTermIndexInCycle,
    LearnQuestionState? currentQuestion,
    bool setNullCurrentQuestion = false,
    int? cycleCount,
    String? progressMessage,
    bool? isLoading,
    bool? isSessionComplete,
    String? errorMessage,
    bool clearError = false,
  }) {
    return LearnModeScreenState(
      allTermsInSet: allTermsInSet ?? this.allTermsInSet,
      termsToLearnThisCycle:
          termsToLearnThisCycle ?? this.termsToLearnThisCycle,
      termsIncorrectThisCycle:
          termsIncorrectThisCycle ?? this.termsIncorrectThisCycle,
      currentTermIndexInCycle:
          currentTermIndexInCycle ?? this.currentTermIndexInCycle,
      currentQuestion:
          setNullCurrentQuestion
              ? null
              : (currentQuestion ?? this.currentQuestion),
      cycleCount: cycleCount ?? this.cycleCount,
      progressMessage: progressMessage ?? this.progressMessage,
      isLoading: isLoading ?? this.isLoading,
      isSessionComplete: isSessionComplete ?? this.isSessionComplete,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

const int learnMaxCycles = 5;
const int learnFeedbackDelayMS = 1500;

@riverpod
class LearnController extends _$LearnController {
  void updateUserAnswer(String answer) {
    final currentVal = state.value;
    if (currentVal == null ||
        currentVal.isLoading ||
        currentVal.currentQuestion == null ||
        currentVal.currentQuestion!.answerSubmitted) {
      return;
    }
    state = AsyncData(
      currentVal.copyWith(
        currentQuestion: currentVal.currentQuestion!.copyWith(
          userAnswer: answer,
        ),
      ),
    );
  }

  Future<void> submitAnswer() async {
    final currentVal = state.value;
    if (currentVal == null ||
        currentVal.isLoading ||
        currentVal.currentQuestion == null ||
        currentVal.currentQuestion!.answerSubmitted) {
      return;
    }

    final questionState = currentVal.currentQuestion!;
    final userAnswer = questionState.userAnswer.trim().toLowerCase();
    final correctAnswer = questionState.expectedAnswer.trim().toLowerCase();
    final bool isCorrect = userAnswer == correctAnswer;

    List<Term> updatedIncorrect = List.from(currentVal.termsIncorrectThisCycle);
    if (!isCorrect) {
      updatedIncorrect.add(questionState.term);
    }

    state = AsyncData(
      currentVal.copyWith(
        currentQuestion: questionState.copyWith(
          feedbackType:
              isCorrect
                  ? LearnFeedbackType.correct
                  : LearnFeedbackType.incorrect,
          feedbackMessage:
              isCorrect
                  ? "Correct!"
                  : "Incorrect. Correct answer: ${questionState.expectedAnswer}",
          answerSubmitted: true,
        ),
        termsIncorrectThisCycle: updatedIncorrect,
      ),
    );

    await Future.delayed(const Duration(milliseconds: learnFeedbackDelayMS));
    _moveToNextStep();
  }

  void showHint() {
    final currentVal = state.value;
    if (currentVal == null ||
        currentVal.isLoading ||
        currentVal.currentQuestion == null ||
        currentVal.currentQuestion!.answerSubmitted) {
      return;
    }

    final questionState = currentVal.currentQuestion!;
    if (questionState.expectedAnswer.isNotEmpty) {
      state = AsyncData(
        currentVal.copyWith(
          currentQuestion: questionState.copyWith(
            feedbackType: LearnFeedbackType.hint,
            feedbackMessage:
                "Hint: Starts with \"${questionState.expectedAnswer[0]}\"",
          ),
        ),
      );
    }
  }

  Future<void> skipQuestionAndShowAnswer() async {
    final currentVal = state.value;
    if (currentVal == null ||
        currentVal.isLoading ||
        currentVal.currentQuestion == null ||
        currentVal.currentQuestion!.answerSubmitted) {
      return;
    }

    final questionState = currentVal.currentQuestion!;
    state = AsyncData(
      currentVal.copyWith(
        currentQuestion: questionState.copyWith(
          feedbackType: LearnFeedbackType.skipped,
          feedbackMessage:
              "Skipped. The answer was: ${questionState.expectedAnswer}",
          answerSubmitted: true,
        ),
        termsIncorrectThisCycle: [
          ...currentVal.termsIncorrectThisCycle,
          questionState.term,
        ],
      ),
    );

    await Future.delayed(
      const Duration(milliseconds: learnFeedbackDelayMS + 500),
    );
    _moveToNextStep();
  }

  Future<void> refreshAndRestart() async {
    ref.invalidateSelf();
  }

  LearnQuestionState _createLearnQuestion(
    Term term,
    StudyQuestionType questionType,
  ) {
    final bool askForTerm = questionType == StudyQuestionType.definition;
    return LearnQuestionState(
      term: term,
      questionText: askForTerm ? term.definitionText : term.termText,
      questionLabel: askForTerm ? "Definition:" : "Term:",
      expectedAnswer: askForTerm ? term.termText : term.definitionText,
    );
  }

  LearnModeScreenState _initializeCycle({
    required List<Term> allTerms,
    required List<Term> termsForThisCycle,
    required int cycleNum,
    required StudyQuestionType questionType,
  }) {
    if (termsForThisCycle.isEmpty) {
      return LearnModeScreenState(
        allTermsInSet: allTerms,
        isLoading: false,
        isSessionComplete: true,
        progressMessage: "All terms learned!",
        cycleCount: cycleNum,
      );
    }
    return LearnModeScreenState(
      allTermsInSet: allTerms,
      termsToLearnThisCycle: termsForThisCycle,
      termsIncorrectThisCycle: [],
      currentTermIndexInCycle: 0,
      currentQuestion: _createLearnQuestion(termsForThisCycle[0], questionType),
      cycleCount: cycleNum,
      isLoading: false,
      progressMessage:
          "Cycle $cycleNum | Item 1 of ${termsForThisCycle.length}",
    );
  }

  void _moveToNextStep() {
    final currentVal = state.value;
    if (currentVal == null || currentVal.isLoading) return;

    final nextIndex = currentVal.currentTermIndexInCycle + 1;

    if (nextIndex < currentVal.termsToLearnThisCycle.length) {
      final questionTypeOption = ref.read(studyAskWithProvider);
      state = AsyncData(
        currentVal.copyWith(
          currentTermIndexInCycle: nextIndex,
          currentQuestion: _createLearnQuestion(
            currentVal.termsToLearnThisCycle[nextIndex],
            questionTypeOption,
          ),
          progressMessage:
              "Cycle ${currentVal.cycleCount} | Item ${nextIndex + 1} of ${currentVal.termsToLearnThisCycle.length}",
        ),
      );
    } else {
      if (currentVal.termsIncorrectThisCycle.isEmpty) {
        state = AsyncData(
          currentVal.copyWith(
            isSessionComplete: true,
            progressMessage: "Learn session complete! Well done!",
            setNullCurrentQuestion: true,
          ),
        );
      } else if (currentVal.cycleCount >= learnMaxCycles) {
        state = AsyncData(
          currentVal.copyWith(
            isSessionComplete: true,
            progressMessage:
                "Max cycles reached. ${currentVal.termsIncorrectThisCycle.length} items still to review.",
            setNullCurrentQuestion: true,
          ),
        );
      } else {
        final questionTypeOption = ref.read(studyAskWithProvider);
        final nextCycleNum = currentVal.cycleCount + 1;
        List<Term> termsForNextCycle = List.from(
          currentVal.termsIncorrectThisCycle,
        );
        termsForNextCycle.shuffle(Random());

        state = AsyncData(
          _initializeCycle(
            allTerms: currentVal.allTermsInSet,
            termsForThisCycle: termsForNextCycle,
            cycleNum: nextCycleNum,
            questionType: questionTypeOption,
          ).copyWith(
            progressMessage:
                "Starting Cycle $nextCycleNum with ${termsForNextCycle.length} item(s)...",
          ),
        );
      }
    }
  }

  @override
  Future<LearnModeScreenState> build() async {
    _log.fine("[LearnController] build started");
    final activeList = await ref.watch(activeStudyListProvider.future);
    final studyLengthOption = ref.watch(studyLengthProvider);
    final questionTypeOption = ref.watch(studyAskWithProvider);

    if (activeList == null || activeList.terms.isEmpty) {
      return const LearnModeScreenState(
        isLoading: false,
        errorMessage: "No terms available for Learn mode.",
      );
    }

    List<Term> termsForLearnSet = List.from(activeList.terms);
    termsForLearnSet.shuffle(Random());

    if (studyLengthOption != null &&
        studyLengthOption > 0 &&
        studyLengthOption < termsForLearnSet.length) {
      termsForLearnSet = termsForLearnSet.sublist(0, studyLengthOption);
    }

    if (termsForLearnSet.isEmpty) {
      return const LearnModeScreenState(
        isLoading: false,
        errorMessage: "Not enough terms for selected length.",
      );
    }

    _log.fine(
      "[LearnController] Learn set has ${termsForLearnSet.length} terms. QuestionType: $questionTypeOption",
    );

    return _initializeCycle(
      allTerms: termsForLearnSet,
      termsForThisCycle: termsForLearnSet,
      cycleNum: 1,
      questionType: questionTypeOption,
    );
  }
}
