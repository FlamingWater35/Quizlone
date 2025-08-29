import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../i18n/translations.g.dart';
import '../../models/term.dart';
import '../study/study_list_providers.dart';

part 'match_controller.g.dart';

final _log = Logger("MatchController");

@immutable
class MatchItem {
  const MatchItem({
    required this.text,
    required this.pairId,
    required this.uniqueId,
  });

  final String pairId;
  final String text;
  final int uniqueId;
}

@immutable
class MatchScreenState {
  const MatchScreenState({
    this.items = const [],
    this.selectedItem,
    this.matchedPairIds = const {},
    this.incorrectPair = const {},
    this.isComplete = false,
    this.elapsedSeconds = 0,
    this.isLoading = true,
    this.errorMessage,
  });

  final int elapsedSeconds;
  final String? errorMessage;
  final Set<int> incorrectPair;
  final bool isComplete;
  final bool isLoading;
  final List<MatchItem> items;
  final Set<String> matchedPairIds;
  final MatchItem? selectedItem;

  MatchScreenState copyWith({
    List<MatchItem>? items,
    ValueGetter<MatchItem?>? selectedItem,
    Set<String>? matchedPairIds,
    Set<int>? incorrectPair,
    bool? isComplete,
    int? elapsedSeconds,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return MatchScreenState(
      items: items ?? this.items,
      selectedItem: selectedItem != null ? selectedItem() : this.selectedItem,
      matchedPairIds: matchedPairIds ?? this.matchedPairIds,
      incorrectPair: incorrectPair ?? this.incorrectPair,
      isComplete: isComplete ?? this.isComplete,
      elapsedSeconds: elapsedSeconds ?? this.elapsedSeconds,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

const int maxMatchPairs = 15;

@riverpod
class MatchController extends _$MatchController {
  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  void selectItem(MatchItem item) {
    final currentState = state.value;
    if (currentState == null ||
        currentState.isComplete ||
        currentState.matchedPairIds.contains(item.pairId)) {
      return;
    }

    final currentSelection = currentState.selectedItem;

    if (currentSelection == null) {
      state = AsyncData(
        currentState.copyWith(selectedItem: () => item, incorrectPair: {}),
      );
    } else if (currentSelection.uniqueId == item.uniqueId) {
      state = AsyncData(currentState.copyWith(selectedItem: () => null));
    } else {
      if (currentSelection.pairId == item.pairId) {
        final newMatched = {...currentState.matchedPairIds, item.pairId};
        final isNowComplete =
            newMatched.length == (currentState.items.length / 2);
        if (isNowComplete) {
          _stopwatch.stop();
          _timer?.cancel();
        }

        state = AsyncData(
          currentState.copyWith(
            selectedItem: () => null,
            matchedPairIds: newMatched,
            isComplete: isNowComplete,
            elapsedSeconds: _stopwatch.elapsed.inSeconds,
          ),
        );
      } else {
        state = AsyncData(
          currentState.copyWith(
            selectedItem: () => null,
            incorrectPair: {currentSelection.uniqueId, item.uniqueId},
          ),
        );
        Future.delayed(const Duration(milliseconds: 500), () {
          if (state.hasValue) {
            state = AsyncData(state.value!.copyWith(incorrectPair: {}));
          }
        });
      }
    }
  }

  void restart() {
    _timer?.cancel();
    _stopwatch.stop();
    ref.invalidateSelf();
  }

  @override
  Future<MatchScreenState> build() async {
    _log.fine("[MatchController] build started");
    ref.onDispose(() {
      _timer?.cancel();
      _stopwatch.stop();
    });

    final activeList = await ref.watch(activeStudyListProvider.future);
    if (activeList == null || activeList.terms.isEmpty) {
      return MatchScreenState(
        isLoading: false,
        errorMessage: t.learnScreen.errors.noTerms,
      );
    }

    List<Term> termsForMatchSet = List.from(activeList.terms);
    if (termsForMatchSet.isEmpty) {
      return MatchScreenState(
        isLoading: false,
        errorMessage: t.matchScreen.errors.notEnoughTerms,
      );
    }

    termsForMatchSet.shuffle(Random());
    if (termsForMatchSet.length > maxMatchPairs) {
      termsForMatchSet = termsForMatchSet.sublist(0, maxMatchPairs);
    }

    final List<MatchItem> items = [];
    int uniqueIdCounter = 0;
    for (final term in termsForMatchSet) {
      final pairId = term.termText;
      items.add(
        MatchItem(
          text: term.termText,
          pairId: pairId,
          uniqueId: uniqueIdCounter++,
        ),
      );
      items.add(
        MatchItem(
          text: term.definitionText,
          pairId: pairId,
          uniqueId: uniqueIdCounter++,
        ),
      );
    }
    items.shuffle(Random());

    _stopwatch
      ..reset()
      ..start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.value?.isComplete == false) {
        state = AsyncData(
          state.value!.copyWith(elapsedSeconds: _stopwatch.elapsed.inSeconds),
        );
      }
    });

    return MatchScreenState(items: items, isLoading: false);
  }
}
