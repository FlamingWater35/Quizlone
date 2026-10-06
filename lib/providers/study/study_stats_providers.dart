import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/match_record.dart';
import '../../models/test_record.dart';
import '../core/core_providers.dart';

/// Match completion records for one study list, sorted fastest-first.
/// Lives here (not on the leaderboard screen) so the mode-selection screen
/// can surface best times without importing a screen.
final matchRecordsProvider = FutureProvider.family<List<MatchRecord>, String>((
  ref,
  studyListId,
) {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.getRecordsForList(studyListId);
});

/// Most recent test record for one study list, or null if never tested.
final latestTestRecordProvider = FutureProvider.family<TestRecord?, String>((
  ref,
  studyListId,
) {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.getLatestTestRecord(studyListId);
});

/// The five study modes offered on the mode-selection screen, in display order.
enum StudyMode { flashcards, learn, multipleChoice, test, match }

/// Why a mode cannot start. Each mode maps this onto its existing i18n error
/// key (e.g. multipleChoice -> multipleChoiceScreen.errors.notEnoughTerms),
/// reusing the same strings the controllers show after a failed navigation.
enum ModeDisabledReason { noTerms, notEnoughTerms }

class ModeStatus {
  const ModeStatus({
    required this.enabled,
    required this.previewCount,
    this.disabledReason,
  });

  final bool enabled;

  /// Session size the mode would use: questions for learn/test,
  /// terms for flashcards/multiple choice, pairs for match.
  final int previewCount;

  final ModeDisabledReason? disabledReason;
}

class ModeAvailability {
  const ModeAvailability(this.statuses);

  final Map<StudyMode, ModeStatus> statuses;

  ModeStatus operator [](StudyMode mode) => statuses[mode]!;
}

/// Bounds mirrored from match_controller: `matchPairs.clamp(4, maxMatchPairs)`.
const int _minMatchPairs = 4;
const int _maxMatchPairs = 10;

/// Pure computation of which modes can start and how big each session would be.
///
/// Eligibility mirrors the controller guards:
/// - flashcards/learn/test/match need at least one term
/// - multiple choice needs at least 4 terms (distractor generation)
/// Previews mirror how controllers actually slice the term list:
/// - learn/test honor the per-list study length, capped at the term count
/// - match uses the global pair count, clamped to [4, 10] and capped at the
///   term count
ModeAvailability computeModeAvailability({
  required int termCount,
  required int? studyLength,
  required int matchPairs,
}) {
  final int questionCount = studyLength != null && studyLength > 0
      ? min(studyLength, termCount)
      : termCount;
  final int clampedPairs = matchPairs < _minMatchPairs
      ? _minMatchPairs
      : (matchPairs > _maxMatchPairs ? _maxMatchPairs : matchPairs);
  final int pairCount = min(clampedPairs, termCount);

  ModeStatus enabled(int preview) =>
      ModeStatus(enabled: true, previewCount: preview);
  ModeStatus disabled(ModeDisabledReason reason) =>
      ModeStatus(enabled: false, previewCount: 0, disabledReason: reason);

  return ModeAvailability({
    StudyMode.flashcards: termCount > 0
        ? enabled(termCount)
        : disabled(ModeDisabledReason.noTerms),
    StudyMode.learn: termCount > 0
        ? enabled(questionCount)
        : disabled(ModeDisabledReason.noTerms),
    StudyMode.multipleChoice: termCount >= 4
        ? enabled(termCount)
        : disabled(ModeDisabledReason.notEnoughTerms),
    StudyMode.test: termCount > 0
        ? enabled(questionCount)
        : disabled(ModeDisabledReason.noTerms),
    StudyMode.match: termCount > 0
        ? enabled(pairCount)
        : disabled(ModeDisabledReason.notEnoughTerms),
  });
}
