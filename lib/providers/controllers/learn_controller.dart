import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../i18n/generated/translations.g.dart';
import '../../models/enums/enums.dart';
import '../../models/term.dart';
import '../study/study_list_providers.dart';
import '../study/study_options_provider.dart';

part 'learn_controller.g.dart';

enum LearnFeedbackType { none, correct, incorrect, hint, skipped }

final _log = Logger("LearnController");

/// Tracks the user's interaction state for a single learn question.
/// Encapsulates the question text, expected answer, and feedback status.
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

/// Encapsulates the entire spaced-repetition learning session state.
/// Tracks current cycle, incorrect terms to retry, and overall session progress.
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
      currentQuestion: setNullCurrentQuestion
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
  /// Updates the typed answer for the current question in real-time.
  /// Ignores input if the session is loading or the answer was already submitted.
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

  /// Evaluates the user's answer, provides feedback, and queues the next step.
  /// Uses a delay to let the user read the feedback before advancing.
  Future<void> submitAnswer() async {
    final currentVal = state.value;
    if (currentVal == null ||
        currentVal.isLoading ||
        currentVal.currentQuestion == null ||
        currentVal.currentQuestion!.answerSubmitted) {
      return;
    }

    final questionState = currentVal.currentQuestion!;
    final allowSubstring = ref.read(allowAnswerSubstringProvider);
    final ignoreBrackets = ref.read(ignoreBracketsProvider);

    String processAnswer(String ans) {
      if (ignoreBrackets) {
        ans = ans.replaceAll(RegExp(r'\[[\s\S]*?\]'), '').trim();
      }
      return ans;
    }

    final userAnswer = processAnswer(questionState.userAnswer.trim().toLowerCase());
    final correctAnswer = processAnswer(questionState.expectedAnswer.trim().toLowerCase());

    bool isCorrect;
    if (allowSubstring && correctAnswer.contains(',')) {
      final correctParts = correctAnswer
          .split(',')
          .map((p) => p.trim())
          .where((p) => p.isNotEmpty);
      isCorrect =
          (userAnswer == correctAnswer) || correctParts.contains(userAnswer);
    } else {
      isCorrect = userAnswer == correctAnswer;
    }

    List<Term> updatedIncorrect = List.from(currentVal.termsIncorrectThisCycle);
    if (!isCorrect) updatedIncorrect.add(questionState.term);

    state = AsyncData(
      currentVal.copyWith(
        currentQuestion: questionState.copyWith(
          feedbackType: isCorrect
              ? LearnFeedbackType.correct
              : LearnFeedbackType.incorrect,
          feedbackMessage: isCorrect
              ? t.learnScreen.feedback.correct
              : t.learnScreen.feedback.incorrect(
                  answer: questionState.expectedAnswer,
                ),
          answerSubmitted: true,
        ),
        termsIncorrectThisCycle: updatedIncorrect,
      ),
    );

    await Future.delayed(const Duration(milliseconds: learnFeedbackDelayMS));
    // CRITICAL: Prevent state update if the user navigated away during the delay.
    if (!ref.mounted) return;
    _moveToNextStep();
  }

  /// Reveals the first character of the expected answer as a hint.
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
            feedbackMessage: t.learnScreen.feedback.hint(
              char: questionState.expectedAnswer[0],
            ),
          ),
        ),
      );
    }
  }

  /// Marks the current question as incorrect, shows the answer, and advances.
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
          feedbackMessage: t.learnScreen.feedback.skipped(
            answer: questionState.expectedAnswer,
          ),
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
    if (!ref.mounted) return;
    _moveToNextStep();
  }

  /// Completely resets the provider, forcing a rebuild and a new shuffled set.
  void refreshAndRestart() => ref.invalidateSelf();

  /// Formats a Term into a LearnQuestionState based on the active question type.
  LearnQuestionState _createLearnQuestion(
    Term term,
    StudyQuestionType questionType,
  ) {
    final bool askForTerm = questionType == StudyQuestionType.definition;
    return LearnQuestionState(
      term: term,
      questionText: askForTerm ? term.definitionText : term.termText,
      questionLabel: askForTerm
          ? t.modeSelectionScreen.askForTerm
          : t.modeSelectionScreen.askForDef,
      expectedAnswer: askForTerm ? term.termText : term.definitionText,
    );
  }

  /// Initializes a new learning cycle, shuffling incorrect terms if advancing.
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
        progressMessage: t.learnScreen.progress.allLearned,
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
      progressMessage: t.learnScreen.progress.cycleStatus(
        cycleNum: cycleNum,
        itemNum: 1,
        total: termsForThisCycle.length,
      ),
    );
  }

  /// Advances to the next question or triggers the next spaced-repetition cycle.
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
          progressMessage: t.learnScreen.progress.cycleStatus(
            cycleNum: currentVal.cycleCount,
            itemNum: nextIndex + 1,
            total: currentVal.termsToLearnThisCycle.length,
          ),
        ),
      );
    } else {
      if (currentVal.termsIncorrectThisCycle.isEmpty) {
        state = AsyncData(
          currentVal.copyWith(
            isSessionComplete: true,
            progressMessage: t.learnScreen.progress.sessionComplete,
            setNullCurrentQuestion: true,
          ),
        );
      } else if (currentVal.cycleCount >= learnMaxCycles) {
        state = AsyncData(
          currentVal.copyWith(
            isSessionComplete: true,
            progressMessage: t.learnScreen.progress.maxCyclesReached(
              count: currentVal.termsIncorrectThisCycle.length,
            ),
            setNullCurrentQuestion: true,
          ),
        );
      } else {
        final questionTypeOption = ref.read(studyAskWithProvider);
        final nextCycleNum = currentVal.cycleCount + 1;
        List<Term> termsForNextCycle = List.from(
          currentVal.termsIncorrectThisCycle,
        )..shuffle(Random());

        state = AsyncData(
          _initializeCycle(
            allTerms: currentVal.allTermsInSet,
            termsForThisCycle: termsForNextCycle,
            cycleNum: nextCycleNum,
            questionType: questionTypeOption,
          ).copyWith(
            progressMessage: t.learnScreen.progress.startingCycle(
              cycleNum: nextCycleNum,
              count: termsForNextCycle.length,
            ),
          ),
        );
      }
    }
  }

  @override
  Future<LearnModeScreenState> build() async {
    _log.fine("[LearnController] build started");
    final activeList = await ref.watch(activeStudyListProvider.future);
    if (!ref.mounted) throw Exception("Provider disposed");

    final studyLengthOption = ref.watch(studyLengthProvider);
    final questionTypeOption = ref.watch(studyAskWithProvider);

    if (activeList == null || activeList.terms.isEmpty) {
      return LearnModeScreenState(
        isLoading: false,
        errorMessage: t.learnScreen.errors.noTerms,
      );
    }

    List<Term> termsForLearnSet = List.from(activeList.terms)
      ..shuffle(Random());
    if (studyLengthOption != null &&
        studyLengthOption > 0 &&
        studyLengthOption < termsForLearnSet.length) {
      termsForLearnSet = termsForLearnSet.sublist(0, studyLengthOption);
    }

    if (termsForLearnSet.isEmpty) {
      return LearnModeScreenState(
        isLoading: false,
        errorMessage: t.learnScreen.errors.notEnoughTerms,
      );
    }

    _log.fine(
      "[LearnController] Learn set has ${termsForLearnSet.length} terms.",
    );
    return _initializeCycle(
      allTerms: termsForLearnSet,
      termsForThisCycle: termsForLearnSet,
      cycleNum: 1,
      questionType: questionTypeOption,
    );
  }
}
