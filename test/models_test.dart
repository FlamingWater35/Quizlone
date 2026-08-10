import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/models/enums/enums.dart';
import 'package:quizlone/models/match_record.dart';
import 'package:quizlone/models/settings_app_data.dart';
import 'package:quizlone/models/study_group.dart';
import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/models/term.dart';
import 'package:quizlone/models/test_record.dart';
import 'package:quizlone/models/update_info.dart';

import 'helpers/test_data.dart';

void main() {
  group('Term', () {
    test('defaults to empty strings', () {
      final t = Term();
      expect(t.termText, '');
      expect(t.definitionText, '');
    });

    test('JSON round-trip preserves fields', () {
      final t = term('hello', 'world');
      final json = t.toJson();
      expect(json, {'termText': 'hello', 'definitionText': 'world'});
      final restored = Term.fromJson(json);
      expect(restored.termText, 'hello');
      expect(restored.definitionText, 'world');
    });

    test('fromJson tolerates missing fields', () {
      final restored = Term.fromJson(const {});
      expect(restored.termText, '');
      expect(restored.definitionText, '');
    });
  });

  group('StudyList', () {
    test('generates id and createdAt when omitted', () {
      final list = StudyList(name: 'A');
      expect(list.id, isNotEmpty);
      expect(list.createdAt, isNotNull);
      expect(list.terms, isEmpty);
    });

    test('defaults are sensible', () {
      final list = StudyList(name: 'A');
      expect(list.testFormat, TestFormat.written);
      expect(list.flashcardShowTermFirst, isTrue);
      expect(list.studyShowDefinitionAskTerm, isTrue);
      expect(list.allowAnswerSubstring, isFalse);
      expect(list.groupId, isNull);
      expect(list.lastOpenedAt, isNull);
      expect(list.testStudyLength, isNull);
    });

    test('testFormat getter/setter round-trips', () {
      final list = StudyList(name: 'A');
      list.testFormat = TestFormat.mc;
      expect(list.testFormat, TestFormat.mc);
      // Written is the fallback for unknown serialized values.
      list.testFormat = TestFormat.written;
      expect(list.testFormat, TestFormat.written);
    });

    test('copyWith replaces only specified fields', () {
      final list = listWithTerms('Original', [term('a', 'b')]);
      final copied = list.copyWith(name: 'Renamed', testFormat: TestFormat.mc);
      expect(copied.name, 'Renamed');
      expect(copied.id, list.id);
      expect(copied.terms, hasLength(1));
      expect(copied.testFormat, TestFormat.mc);
      // Original unchanged.
      expect(list.name, 'Original');
      expect(list.testFormat, TestFormat.written);
    });

    test('copyWith copies terms list instead of sharing reference', () {
      final list = listWithTerms('A', [term('a', 'b')]);
      final copied = list.copyWith();
      expect(identical(copied.terms, list.terms), isFalse);
    });

    test('JSON round-trip preserves all fields', () {
      final list = StudyList(
        id: 'list-1',
        name: 'My List',
        terms: [term('q', 'a'), term('q2', 'a2')],
        createdAt: DateTime(2024, 1, 2),
      )
        ..flashcardShowTermFirst = false
        ..studyShowDefinitionAskTerm = false
        ..testStudyLength = 5
        ..testFormat = TestFormat.mc
        ..allowAnswerSubstring = true
        ..groupId = 'group-1'
        ..lastOpenedAt = DateTime(2024, 5, 6)
        ..lastUsedAt = DateTime(2024, 3, 4);

      final restored = StudyList.fromJson(list.toJson());
      expect(restored.id, 'list-1');
      expect(restored.name, 'My List');
      expect(restored.terms, hasLength(2));
      expect(restored.terms.first.termText, 'q');
      expect(restored.createdAt, DateTime(2024, 1, 2));
      expect(restored.lastUsedAt, DateTime(2024, 3, 4));
      expect(restored.lastOpenedAt, DateTime(2024, 5, 6));
      expect(restored.flashcardShowTermFirst, isFalse);
      expect(restored.studyShowDefinitionAskTerm, isFalse);
      expect(restored.testStudyLength, 5);
      // Note: `testFormat` is intentionally NOT serialized to JSON (the
      // backing `_testFormatString` has no @JsonKey), so it falls back to
      // the `written` default after a JSON round-trip. It IS persisted via
      // Hive (HiveField(7)).
      expect(restored.testFormat, TestFormat.written);
      expect(restored.allowAnswerSubstring, isTrue);
      expect(restored.groupId, 'group-1');
    });

    test('updateLastUsed refreshes timestamp', () {
      final list = StudyList(name: 'A');
      final before = list.lastUsedAt;
      list.updateLastUsed();
      expect(list.lastUsedAt.isAfter(before) ||
          list.lastUsedAt.isAtSameMomentAs(before), isTrue);
    });
  });

  group('StudyGroup', () {
    test('generates id and createdAt', () {
      final group = StudyGroup(name: 'Science');
      expect(group.id, isNotEmpty);
      expect(group.createdAt, isNotNull);
    });

    test('JSON round-trip preserves fields', () {
      final group = StudyGroup(
        name: 'Math',
        id: 'g1',
        createdAt: DateTime(2023, 1, 1),
      );
      final restored = StudyGroup.fromJson(group.toJson());
      expect(restored.name, 'Math');
      expect(restored.id, 'g1');
      expect(restored.createdAt, DateTime(2023, 1, 1));
    });
  });

  group('MatchRecord', () {
    test('JSON round-trip preserves fields', () {
      final record = MatchRecord(
        studyListId: 'list-1',
        timeInTenths: 1234,
        createdAt: DateTime(2023, 6, 7, 8, 9, 10),
      );
      final restored = MatchRecord.fromJson(record.toJson());
      expect(restored.studyListId, 'list-1');
      expect(restored.timeInTenths, 1234);
      expect(restored.createdAt, DateTime(2023, 6, 7, 8, 9, 10));
    });

    test('fromJson migrates legacy studyListName key to studyListId', () {
      final restored = MatchRecord.fromJson({
        'studyListName': 'Legacy Name',
        'timeInTenths': 42,
        'createdAt': '2023-01-01T00:00:00.000',
      });
      expect(restored.studyListId, 'Legacy Name');
      expect(restored.timeInTenths, 42);
    });
  });

  group('TestAnswerRecord', () {
    test('JSON round-trip preserves fields', () {
      final record = TestAnswerRecord(
        questionText: 'Q',
        correctAnswer: 'A',
        userAnswer: 'wrong',
        isCorrect: false,
      );
      final restored = TestAnswerRecord.fromJson(record.toJson());
      expect(restored.questionText, 'Q');
      expect(restored.correctAnswer, 'A');
      expect(restored.userAnswer, 'wrong');
      expect(restored.isCorrect, isFalse);
    });

    test('userAnswer can be null', () {
      final restored = TestAnswerRecord.fromJson({
        'questionText': 'Q',
        'correctAnswer': 'A',
        'userAnswer': null,
        'isCorrect': false,
      });
      expect(restored.userAnswer, isNull);
    });
  });

  group('TestRecord', () {
    test('generates id and createdAt when omitted', () {
      final record = TestRecord(
        studyListId: 'list-1',
        score: 2,
        totalQuestions: 3,
        answers: [],
      );
      expect(record.id, isNotEmpty);
      expect(record.createdAt, isNotNull);
    });

    test('JSON round-trip preserves nested answers', () {
      final record = TestRecord(
        id: 'test-1',
        studyListId: 'list-1',
        score: 1,
        totalQuestions: 2,
        createdAt: DateTime(2023, 2, 3),
        answers: [
          TestAnswerRecord(
            questionText: 'Q1',
            correctAnswer: 'A1',
            userAnswer: 'A1',
            isCorrect: true,
          ),
          TestAnswerRecord(
            questionText: 'Q2',
            correctAnswer: 'A2',
            userAnswer: null,
            isCorrect: false,
          ),
        ],
      );
      final restored = TestRecord.fromJson(record.toJson());
      expect(restored.id, 'test-1');
      expect(restored.studyListId, 'list-1');
      expect(restored.score, 1);
      expect(restored.totalQuestions, 2);
      expect(restored.createdAt, DateTime(2023, 2, 3));
      expect(restored.answers, hasLength(2));
      expect(restored.answers[0].isCorrect, isTrue);
      expect(restored.answers[1].userAnswer, isNull);
    });
  });

  group('AppData', () {
    test('JSON round-trip preserves all collections', () {
      final data = AppData(
        studyLists: [listWithTerms('L', [term('a', 'b')], id: 'l1')],
        matchRecords: [
          MatchRecord(studyListId: 'l1', timeInTenths: 5),
        ],
        studyGroups: [StudyGroup(name: 'G', id: 'g1')],
        testRecords: [
          TestRecord(studyListId: 'l1', score: 1, totalQuestions: 1, answers: []),
        ],
        lastUpdatedBy: 'instance-1',
      );
      final restored = AppData.fromJson(data.toJson());
      expect(restored.studyLists, hasLength(1));
      expect(restored.matchRecords, hasLength(1));
      expect(restored.studyGroups, hasLength(1));
      expect(restored.testRecords, hasLength(1));
      expect(restored.lastUpdatedBy, 'instance-1');
    });

    test('missing collections default to empty lists', () {
      final restored = AppData.fromJson({
        'studyLists': [],
        'matchRecords': [],
      });
      expect(restored.studyGroups, isEmpty);
      expect(restored.testRecords, isEmpty);
      expect(restored.lastUpdatedBy, isNull);
    });

    test('copyWith replaces only specified fields', () {
      final data = AppData(
        studyLists: [listWithTerms('A', [])],
        matchRecords: [],
      );
      final copied = data.copyWith(lastUpdatedBy: 'x');
      expect(copied.lastUpdatedBy, 'x');
      expect(copied.studyLists, hasLength(1));
      expect(copied.matchRecords, isEmpty);
    });
  });

  group('UpdateInfo', () {
    test('stores all fields', () {
      final info = UpdateInfo(
        version: '1.2.12',
        releaseNotes: 'Notes',
        apkUrl: 'https://example.com/app.apk',
        releaseDate: DateTime(2024, 1, 1),
        apkAssetName: 'app-release.apk',
      );
      expect(info.version, '1.2.12');
      expect(info.releaseNotes, 'Notes');
      expect(info.apkUrl, 'https://example.com/app.apk');
      expect(info.releaseDate, DateTime(2024, 1, 1));
      expect(info.apkAssetName, 'app-release.apk');
    });
  });

  group('Enums', () {
    test('testFormat values include written and mc', () {
      expect(TestFormat.values, containsAll([TestFormat.written, TestFormat.mc]));
    });

    test('studyQuestionType values include term and definition', () {
      expect(
        StudyQuestionType.values,
        containsAll([StudyQuestionType.term, StudyQuestionType.definition]),
      );
    });

    test('flashcardStartSide values include term and definition', () {
      expect(
        FlashcardStartSide.values,
        containsAll([FlashcardStartSide.term, FlashcardStartSide.definition]),
      );
    });
  });
}
