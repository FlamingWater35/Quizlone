import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/providers/study/study_stats_providers.dart';

void main() {
  group('computeModeAvailability', () {
    ModeAvailability run(int terms, {int? length, int pairs = 10}) {
      return computeModeAvailability(
        termCount: terms,
        studyLength: length,
        matchPairs: pairs,
      );
    }

    // (label, termCount, studyLength, matchPairs) -> expected (enabled, preview)
    final table = <(String, int, int?, int), Map<StudyMode, (bool, int)>>{
      ('0 terms: everything disabled', 0, null, 10): {
        StudyMode.flashcards: (false, 0),
        StudyMode.learn: (false, 0),
        StudyMode.multipleChoice: (false, 0),
        StudyMode.test: (false, 0),
        StudyMode.match: (false, 0),
      },
      ('3 terms: only multiple choice disabled', 3, null, 10): {
        StudyMode.flashcards: (true, 3),
        StudyMode.learn: (true, 3),
        StudyMode.multipleChoice: (false, 0),
        StudyMode.test: (true, 3),
        StudyMode.match: (true, 3),
      },
      ('4 terms: all modes enabled', 4, null, 10): {
        StudyMode.flashcards: (true, 4),
        StudyMode.learn: (true, 4),
        StudyMode.multipleChoice: (true, 4),
        StudyMode.test: (true, 4),
        StudyMode.match: (true, 4),
      },
      ('length above term count caps at term count', 20, 999, 10): {
        StudyMode.flashcards: (true, 20),
        StudyMode.learn: (true, 20),
        StudyMode.multipleChoice: (true, 20),
        StudyMode.test: (true, 20),
        StudyMode.match: (true, 10),
      },
      ('length below term count is honored', 20, 5, 10): {
        StudyMode.flashcards: (true, 20),
        StudyMode.learn: (true, 5),
        StudyMode.multipleChoice: (true, 20),
        StudyMode.test: (true, 5),
        StudyMode.match: (true, 10),
      },
      ('zero length means all terms', 7, 0, 10): {
        StudyMode.flashcards: (true, 7),
        StudyMode.learn: (true, 7),
        StudyMode.multipleChoice: (true, 7),
        StudyMode.test: (true, 7),
        StudyMode.match: (true, 7),
      },
      ('matchPairs clamps up to 4', 20, null, 2): {
        StudyMode.flashcards: (true, 20),
        StudyMode.learn: (true, 20),
        StudyMode.multipleChoice: (true, 20),
        StudyMode.test: (true, 20),
        StudyMode.match: (true, 4),
      },
      ('matchPairs clamps down to 10', 20, null, 99): {
        StudyMode.flashcards: (true, 20),
        StudyMode.learn: (true, 20),
        StudyMode.multipleChoice: (true, 20),
        StudyMode.test: (true, 20),
        StudyMode.match: (true, 10),
      },
      ('matchPairs caps at the term count', 5, null, 10): {
        StudyMode.flashcards: (true, 5),
        StudyMode.learn: (true, 5),
        StudyMode.multipleChoice: (true, 5),
        StudyMode.test: (true, 5),
        StudyMode.match: (true, 5),
      },
      ('matchPairs above a tiny list still caps', 3, null, 8): {
        StudyMode.flashcards: (true, 3),
        StudyMode.learn: (true, 3),
        StudyMode.multipleChoice: (false, 0),
        StudyMode.test: (true, 3),
        StudyMode.match: (true, 3),
      },
    };

    for (final entry in table.entries) {
      test(entry.key.$1, () {
        final availability = run(
          entry.key.$2,
          length: entry.key.$3,
          pairs: entry.key.$4,
        );
        entry.value.forEach((mode, expected) {
          final status = availability[mode];
          expect(status.enabled, expected.$1, reason: '$mode enabled');
          expect(status.previewCount, expected.$2, reason: '$mode preview');
        });
      });
    }

    test('disabled modes carry a reason, enabled modes do not', () {
      final empty = run(0);
      expect(
        empty[StudyMode.flashcards].disabledReason,
        ModeDisabledReason.noTerms,
      );
      expect(empty[StudyMode.learn].disabledReason, ModeDisabledReason.noTerms);
      expect(
        empty[StudyMode.multipleChoice].disabledReason,
        ModeDisabledReason.notEnoughTerms,
      );
      expect(empty[StudyMode.test].disabledReason, ModeDisabledReason.noTerms);
      expect(
        empty[StudyMode.match].disabledReason,
        ModeDisabledReason.notEnoughTerms,
      );

      final three = run(3);
      expect(
        three[StudyMode.multipleChoice].disabledReason,
        ModeDisabledReason.notEnoughTerms,
      );
      expect(three[StudyMode.flashcards].disabledReason, isNull);
      expect(three[StudyMode.learn].disabledReason, isNull);
      expect(three[StudyMode.test].disabledReason, isNull);
      expect(three[StudyMode.match].disabledReason, isNull);
    });

    test('every mode is covered by the availability map', () {
      final availability = run(10);
      for (final mode in StudyMode.values) {
        expect(availability[mode], isNotNull);
      }
      expect(availability.statuses.length, StudyMode.values.length);
    });
  });
}
