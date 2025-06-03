import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/term.dart';
import '../study/study_list_providers.dart';
import '../study/study_options_provider.dart';

part 'flashcard_controller.g.dart';

final _log = Logger("FlashcardController");

@immutable
class FlashcardScreenState {
  const FlashcardScreenState({
    required this.originalTerms,
    required this.displayTerms,
    this.currentIndex = 0,
    this.isFlipped = false,
    this.startSide = FlashcardStartSide.term,
    this.isLoading = true,
    this.errorMessage,
  });

  final int currentIndex;
  final List<Term> displayTerms;
  final String? errorMessage;
  final bool isFlipped;
  final bool isLoading;
  final List<Term> originalTerms;
  final FlashcardStartSide startSide;

  Term? get currentCard =>
      displayTerms.isNotEmpty && currentIndex < displayTerms.length
          ? displayTerms[currentIndex]
          : null;

  String get currentProgress =>
      displayTerms.isEmpty
          ? "0/0"
          : "${currentIndex + 1}/${displayTerms.length}";

  FlashcardScreenState copyWith({
    List<Term>? originalTerms,
    List<Term>? displayTerms,
    int? currentIndex,
    bool? isFlipped,
    FlashcardStartSide? startSide,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return FlashcardScreenState(
      originalTerms: originalTerms ?? this.originalTerms,
      displayTerms: displayTerms ?? this.displayTerms,
      currentIndex: currentIndex ?? this.currentIndex,
      isFlipped: isFlipped ?? this.isFlipped,
      startSide: startSide ?? this.startSide,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

@riverpod
class FlashcardController extends _$FlashcardController {
  void flipCard() {
    if (state.isLoading || state.value == null) return;
    final currentState = state.value!;
    state = AsyncData(
      currentState.copyWith(isFlipped: !currentState.isFlipped),
    );
  }

  void nextCard() {
    if (state.isLoading || state.value == null) return;
    final currentState = state.value!;
    if (currentState.currentIndex < currentState.displayTerms.length - 1) {
      state = AsyncData(
        currentState.copyWith(
          currentIndex: currentState.currentIndex + 1,
          isFlipped: false,
        ),
      );
    }
  }

  void previousCard() {
    if (state.isLoading || state.value == null) return;
    final currentState = state.value!;
    if (currentState.currentIndex > 0) {
      state = AsyncData(
        currentState.copyWith(
          currentIndex: currentState.currentIndex - 1,
          isFlipped: false,
        ),
      );
    }
  }

  void shuffleCards() {
    if (state.isLoading || state.value == null) return;
    final currentState = state.value!;
    if (currentState.originalTerms.isEmpty) return;

    final shuffled = List<Term>.from(currentState.originalTerms);
    shuffled.shuffle(Random());
    state = AsyncData(
      currentState.copyWith(
        displayTerms: shuffled,
        currentIndex: 0,
        isFlipped: false,
      ),
    );
    _log.fine(
      "[FlashcardController] Cards shuffled. New first term: ${shuffled.first.termText}",
    );
  }

  void restart() {
    if (state.isLoading || state.value == null) return;
    final currentState = state.value!;
    state = AsyncData(currentState.copyWith(currentIndex: 0, isFlipped: false));
    _log.fine("[FlashcardController] Flashcards restarted.");
  }

  Future<void> refreshWithOptions() async {
    state = const AsyncLoading();
    final activeList = await ref.read(activeStudyListProvider.future);
    final startSideOption = ref.read(flashcardStartWithProvider);

    if (activeList == null || activeList.terms.isEmpty) {
      state = AsyncData(
        FlashcardScreenState(
          originalTerms: [],
          displayTerms: [],
          isLoading: false,
          errorMessage: "No terms available to study.",
          startSide: startSideOption,
        ),
      );
      return;
    }
    state = AsyncData(
      FlashcardScreenState(
        originalTerms: List.from(activeList.terms),
        displayTerms: List.from(activeList.terms),
        isLoading: false,
        startSide: startSideOption,
      ),
    );
  }

  @override
  Future<FlashcardScreenState> build() async {
    _log.fine("[FlashcardController] build started");
    final activeList = await ref.watch(activeStudyListProvider.future);
    final startSideOption = ref.watch(flashcardStartWithProvider);

    if (activeList == null || activeList.terms.isEmpty) {
      _log.warning("[FlashcardController] No active list or terms empty");
      return FlashcardScreenState(
        originalTerms: [],
        displayTerms: [],
        isLoading: false,
        errorMessage: "No terms available to study.",
        startSide: startSideOption,
      );
    }

    _log.fine(
      "[FlashcardController] Active list loaded: ${activeList.name}, Terms: ${activeList.terms.length}",
    );
    return FlashcardScreenState(
      originalTerms: List.from(activeList.terms),
      displayTerms: List.from(activeList.terms),
      isLoading: false,
      startSide: startSideOption,
    );
  }
}
