import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../i18n/generated/translations.g.dart';
import '../../models/match_record.dart';
import '../../models/term.dart';
import '../../services/database_service.dart';
import '../core/core_providers.dart';
import '../study/study_list_providers.dart';

part 'match_controller.g.dart';

final _log = Logger("MatchController");

/// Global timer string provider to allow external widgets (like AppBar) to display time.
@Riverpod(keepAlive: true)
class MatchTimer extends _$MatchTimer {
  void set(String value) => state = value;
  @override
  String build() => "0.0";
}

/// Represents a single draggable/clickable card in the Match grid.
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

/// Encapsulates the grid state, selection logic, and completion status for Match mode.
@immutable
class MatchScreenState {
  const MatchScreenState({
    this.items = const [],
    this.selectedItem,
    this.matchedPairIds = const {},
    this.incorrectPair = const {},
    this.isComplete = false,
    this.finalRecord,
    this.isLoading = true,
    this.errorMessage,
  });

  final String? errorMessage;
  final MatchRecord? finalRecord;
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
    MatchRecord? finalRecord,
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
      finalRecord: finalRecord ?? this.finalRecord,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}

const int maxMatchPairs = 10;

@riverpod
class MatchController extends _$MatchController {
  static const int _mismatchPenaltyMs = 1000;

  /// Accumulated time penalty (in ms) for clicked wrong pairs.
  int _penaltyMs = 0;

  final Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  /// Handles card selection logic, checking for matches, incorrect pairs, and game completion.
  ///
  /// **Fix:** State is now updated *immediately* on the final match so the UI
  /// stays responsive. The database write (which triggers a cloud sync) is
  /// fired in the background and never blocks the widget tree.
  Future<void> selectItem(MatchItem item) async {
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

        MatchRecord? newRecord;
        if (isNowComplete) {
          _stopwatch.stop();
          _timer?.cancel();
          final listId = ref.read(activeStudyListIdProvider);
          if (listId != null) {
            newRecord = MatchRecord(
              studyListId: listId,
              timeInTenths:
                  (_stopwatch.elapsedMilliseconds + _penaltyMs) ~/ 100,
              createdAt: DateTime.now(),
            );
          }
        }

        // ---- Update state IMMEDIATELY so the UI never freezes ----
        state = AsyncData(
          currentState.copyWith(
            selectedItem: () => null,
            matchedPairIds: newMatched,
            isComplete: isNowComplete,
            finalRecord: newRecord,
          ),
        );

        // ---- Persist in the background (fire-and-forget) ----
        if (isNowComplete && newRecord != null) {
          final listId = ref.read(activeStudyListIdProvider);
          if (listId != null) {
            final db = ref.read(databaseServiceProvider);
            _persistMatchRecord(db, newRecord, listId);
          }
        }
      } else {
        // Briefly highlight incorrect pair before resetting selection,
        // and apply a +1 second time penalty for the mistake.
        _penaltyMs += _mismatchPenaltyMs;
        final incorrectIds = {currentSelection.uniqueId, item.uniqueId};
        state = AsyncData(
          currentState.copyWith(
            selectedItem: () => null,
            incorrectPair: incorrectIds,
          ),
        );
        Future.delayed(const Duration(milliseconds: 500), () {
          if (!ref.mounted || !state.hasValue) return;
          final current = state.value!;
          // Only clear if the same pair is still highlighted
          if (current.incorrectPair.containsAll(incorrectIds)) {
            state = AsyncData(current.copyWith(incorrectPair: {}));
          }
        });
      }
    }
  }

  /// Fire-and-forget helper that saves a match record and prunes old entries
  /// without blocking the UI thread.
  Future<void> _persistMatchRecord(
    DatabaseService db,
    MatchRecord record,
    String listId,
  ) async {
    try {
      await db.saveMatchRecord(record);
      await db.pruneMatchRecords(listId);
    } catch (e, s) {
      _log.severe("Error saving or pruning match records", e, s);
      // Fallback: Game completes successfully for the user, but record is lost locally.
    }
  }

  void restart() {
    _timer?.cancel();
    _stopwatch.stop();
    ref.invalidateSelf();
  }

  /// Starts the internal stopwatch and syncs the global timer provider every 100ms.
  void _initializeAndStartTimer() {
    final timerNotifier = ref.read(matchTimerProvider.notifier);
    timerNotifier.set("0.0");
    _penaltyMs = 0;
    _stopwatch
      ..reset()
      ..start();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (ref.mounted && state.value?.isComplete == false) {
        final timeString =
            ((_stopwatch.elapsedMilliseconds + _penaltyMs) / 1000)
                .toStringAsFixed(1);
        ref.read(matchTimerProvider.notifier).set(timeString);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Future<MatchScreenState> build() async {
    _log.fine("[MatchController] build started");

    ref.onDispose(() {
      _log.fine("[MatchController] disposed, cancelling timer.");
      _timer?.cancel();
      _stopwatch.stop();
    });

    final activeList = await ref.watch(activeStudyListProvider.future);
    if (!ref.mounted) throw Exception("Provider disposed");

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

    Future.microtask(_initializeAndStartTimer);
    return MatchScreenState(items: items, isLoading: false);
  }
}
