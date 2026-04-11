import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../i18n/generated/translations.g.dart';
import '../../models/enums/enums.dart';
import '../../models/term.dart';
import '../study/study_list_providers.dart';
import '../study/study_options_provider.dart';

part 'multiple_choice_controller.g.dart';

final _log = Logger("MultipleChoiceController");

@immutable
class MCQuestion {
  const MCQuestion({
    required this.term,
    required this.questionText,
    required this.correctAnswer,
    required this.options,
  });

  final String correctAnswer;
  final List<String> options;
  final String questionText;
  final Term term;
}

@immutable
class MultipleChoiceState {
  const MultipleChoiceState({
    this.questions = const [],
    this.currentIndex = 0,
    this.correctCount = 0,
    this.isSessionComplete = false,
    this.isLoading = true,
    this.selectedAnswer,
    this.isAnswerProcessed = false,
    this.errorMessage,
  });

  final int correctCount;
  final int currentIndex;
  final String? errorMessage;
  final bool isAnswerProcessed;
  final bool isLoading;
  final bool isSessionComplete;
  final List<MCQuestion> questions;
  final String? selectedAnswer;

  MCQuestion? get currentQuestion =>
      (questions.isNotEmpty && currentIndex < questions.length)
      ? questions[currentIndex]
      : null;

  int get totalQuestions => questions.length;

  MultipleChoiceState copyWith({
    List<MCQuestion>? questions,
    int? currentIndex,
    int? correctCount,
    bool? isSessionComplete,
    bool? isLoading,
    String? selectedAnswer,
    bool? isAnswerProcessed,
    String? errorMessage,
    bool clearSelected = false,
  }) {
    return MultipleChoiceState(
      questions: questions ?? this.questions,
      currentIndex: currentIndex ?? this.currentIndex,
      correctCount: correctCount ?? this.correctCount,
      isSessionComplete: isSessionComplete ?? this.isSessionComplete,
      isLoading: isLoading ?? this.isLoading,
      selectedAnswer: clearSelected
          ? null
          : (selectedAnswer ?? this.selectedAnswer),
      isAnswerProcessed: isAnswerProcessed ?? this.isAnswerProcessed,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

@riverpod
class MultipleChoiceController extends _$MultipleChoiceController {
  Future<void> submitAnswer(String answer) async {
    final currentState = state.value;
    if (currentState == null ||
        currentState.isAnswerProcessed ||
        currentState.isSessionComplete) {
      return;
    }

    final currentQ = currentState.currentQuestion;
    if (currentQ == null) return;

    final isCorrect = answer == currentQ.correctAnswer;
    final newScore = isCorrect
        ? currentState.correctCount + 1
        : currentState.correctCount;

    state = AsyncData(
      currentState.copyWith(
        selectedAnswer: answer,
        isAnswerProcessed: true,
        correctCount: newScore,
      ),
    );

    await Future.delayed(const Duration(seconds: 1, milliseconds: 500));
    if (!ref.mounted) return;

    _nextQuestion();
  }

  void restart() {
    ref.invalidateSelf();
  }

  void _nextQuestion() {
    final currentState = state.value;
    if (currentState == null) return;

    if (currentState.currentIndex < currentState.questions.length - 1) {
      state = AsyncData(
        currentState.copyWith(
          currentIndex: currentState.currentIndex + 1,
          isAnswerProcessed: false,
          clearSelected: true,
        ),
      );
    } else {
      state = AsyncData(currentState.copyWith(isSessionComplete: true));
    }
  }

  @override
  Future<MultipleChoiceState> build() async {
    _log.fine("[MultipleChoiceController] build started");
    final activeList = await ref.watch(activeStudyListProvider.future);
    if (!ref.mounted) throw Exception("Provider disposed");
    final questionType = ref.watch(studyAskWithProvider);

    if (activeList == null || activeList.terms.length < 4) {
      return MultipleChoiceState(
        isLoading: false,
        errorMessage: t.multipleChoiceScreen.errors.notEnoughTerms,
      );
    }

    final List<Term> terms = List.from(activeList.terms)..shuffle(Random());
    final List<MCQuestion> questions = [];

    final bool askDefinition = questionType == StudyQuestionType.term;

    final random = Random();
    for (int i = 0; i < terms.length; i++) {
      final currentTerm = terms[i];
      final correctAnswer = askDefinition
          ? currentTerm.definitionText
          : currentTerm.termText;
      final questionText = askDefinition
          ? currentTerm.termText
          : currentTerm.definitionText;

      final distractorTexts = <String>{};
      int attempts = 0;
      while (distractorTexts.length < 3 && attempts < 100) {
        attempts++;
        final randomIndex = random.nextInt(terms.length);
        if (randomIndex == i) continue;

        final distractor = askDefinition
            ? terms[randomIndex].definitionText
            : terms[randomIndex].termText;

        if (distractor.toLowerCase() != correctAnswer.toLowerCase()) {
          distractorTexts.add(distractor);
        }
      }

      final options = [...distractorTexts, correctAnswer]..shuffle(random);

      questions.add(
        MCQuestion(
          term: currentTerm,
          questionText: questionText,
          correctAnswer: correctAnswer,
          options: options,
        ),
      );
    }

    return MultipleChoiceState(questions: questions, isLoading: false);
  }
}
