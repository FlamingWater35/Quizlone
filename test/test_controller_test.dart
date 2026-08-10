import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/models/enums/enums.dart';
import 'package:quizlone/providers/controllers/test_controller.dart';
import 'package:quizlone/providers/core/settings_provider.dart';

import 'helpers/controller_harness.dart';
import 'helpers/fake_database_service.dart';
import 'helpers/test_data.dart';

void main() {
  setUpAll(() {
    initLocaleSettings();
  });

  late FakeDatabaseService fakeDb;
  const listId = 'list-1';

  setUp(() {
    fakeDb = FakeDatabaseService();
    fakeDb.studyLists[listId] = listWithTerms(
      'Test List',
      [
        term('Apple', 'A fruit'),
        term('Banana', 'A yellow fruit'),
        term('Cherry', 'A small red fruit'),
        term('Durian', 'A smelly fruit'),
      ],
      id: listId,
    );
  });

  group('TestController', () {
    test('builds a written test with all terms', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, testControllerProvider);
      expect(state.isLoading, isFalse);
      expect(state.errorMessage, isNull);
      expect(state.testFormat, TestFormat.written);
      expect(state.questions, hasLength(4));
      expect(state.totalQuestions, 4);
      expect(state.score, 0);
      expect(state.isSubmitted, isFalse);
    });

    test('respects the study length option', () async {
      final container = createControllerContainer(
        db: fakeDb,
        activeListId: listId,
        studyLength: 2,
      );
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, testControllerProvider);
      expect(state.questions, hasLength(2));
    });

    test('generates four multiple-choice options per question', () async {
      final container = createControllerContainer(
        db: fakeDb,
        activeListId: listId,
        testFormat: TestFormat.mc,
      );
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, testControllerProvider);
      expect(state.testFormat, TestFormat.mc);
      for (final q in state.questions) {
        expect(q.multipleChoiceOptions, hasLength(4));
        expect(q.multipleChoiceOptions, contains(q.correctAnswerText));
      }
    });

    test('reports an error when the list has no terms', () async {
      fakeDb.studyLists[listId]!.terms.clear();
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, testControllerProvider);
      expect(state.errorMessage, isNotNull);
      expect(state.isLoading, isFalse);
    });

    test('reports an error when the active list is missing', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: 'nope');
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, testControllerProvider);
      expect(state.errorMessage, isNotNull);
    });

    test('updateUserAnswer records answers and ignores invalid indexes', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, testControllerProvider);
      final notifier = container.read(testControllerProvider.notifier);

      // Questions are shuffled, so answer the question whose correct answer is
      // the definition of "Apple".
      final questions = container.read(testControllerProvider).value!.questions;
      final appleIndex = questions.indexWhere((q) => q.correctAnswerText == 'Apple');
      expect(appleIndex, greaterThanOrEqualTo(0));

      notifier.updateUserAnswer(appleIndex, 'Apple');
      expect(
        container.read(testControllerProvider).value!.questions[appleIndex].userAnswerText,
        'Apple',
      );

      notifier.updateUserAnswer(99, 'ignored');
      expect(
        container.read(testControllerProvider).value!.questions[appleIndex].userAnswerText,
        'Apple',
      );
      notifier.updateUserAnswer(-1, 'ignored');
      expect(
        container.read(testControllerProvider).value!.questions[appleIndex].userAnswerText,
        'Apple',
      );
    });

    test('submitTest grades answers case-insensitively and trims whitespace', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, testControllerProvider);
      final notifier = container.read(testControllerProvider.notifier);

      final questions = container.read(testControllerProvider).value!.questions;
      final appleIndex = questions.indexWhere((q) => q.correctAnswerText == 'Apple');
      final bananaIndex = questions.indexWhere((q) => q.correctAnswerText == 'Banana');
      final cherryIndex = questions.indexWhere((q) => q.correctAnswerText == 'Cherry');
      expect(appleIndex, greaterThanOrEqualTo(0));
      expect(bananaIndex, greaterThanOrEqualTo(0));
      expect(cherryIndex, greaterThanOrEqualTo(0));

      notifier.updateUserAnswer(appleIndex, '  apple  ');
      notifier.updateUserAnswer(bananaIndex, 'wrong');
      notifier.updateUserAnswer(cherryIndex, 'CHERRY');
      await notifier.submitTest();

      final state = container.read(testControllerProvider).value!;
      expect(state.isSubmitted, isTrue);
      expect(state.score, 2);
      expect(state.incorrectAnswers, hasLength(2));
      expect(state.questions[appleIndex].isCorrect, isTrue);
      expect(state.questions[bananaIndex].isCorrect, isFalse);
      expect(state.questions[cherryIndex].isCorrect, isTrue);

      // Record was persisted to the fake DB.
      expect(fakeDb.testRecords, hasLength(1));
      final record = fakeDb.testRecords.values.single;
      expect(record.studyListId, listId);
      expect(record.score, 2);
      expect(record.totalQuestions, 4);
      expect(record.answers, hasLength(4));
    });

    test('submitTest with substring matching accepts comma-separated answers', () async {
      final container = createControllerContainer(
        db: fakeDb,
        activeListId: listId,
        allowSubstring: true,
        askWith: StudyQuestionType.term, // ask term, expect (comma) definition
      );
      addTearDown(container.dispose);

      // Give the first term a comma-separated accepted answer.
      fakeDb.studyLists[listId]!.terms[0] = term('Apple', 'A fruit, Pomaceous fruit');

      await awaitProviderValue(container, testControllerProvider);
      final notifier = container.read(testControllerProvider.notifier);

      // Find the question whose correct answer contains a comma.
      final stateBefore = container.read(testControllerProvider).value!;
      final commaIndex = stateBefore.questions.indexWhere(
        (q) => q.correctAnswerText.contains(','),
      );
      expect(commaIndex, greaterThanOrEqualTo(0));

      notifier.updateUserAnswer(commaIndex, 'pomaceous fruit');
      await notifier.submitTest();

      final state = container.read(testControllerProvider).value!;
      expect(state.questions[commaIndex].isCorrect, isTrue);
    });

    test('submission error is surfaced without blocking results', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, testControllerProvider);
      fakeDb.failOnWrite = true;

      final notifier = container.read(testControllerProvider.notifier);
      final questions = container.read(testControllerProvider).value!.questions;
      final appleIndex = questions.indexWhere((q) => q.correctAnswerText == 'Apple');
      notifier.updateUserAnswer(appleIndex, 'Apple');
      await notifier.submitTest();

      final state = container.read(testControllerProvider).value!;
      expect(state.isSubmitted, isTrue);
      expect(state.submissionError, isNotNull);
      expect(state.score, 1);
    });

    test('loadHistoricalRecord rehydrates state from a saved record', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, testControllerProvider);
      final notifier = container.read(testControllerProvider.notifier);
      final questions = container.read(testControllerProvider).value!.questions;
      final appleIndex = questions.indexWhere((q) => q.correctAnswerText == 'Apple');
      notifier.updateUserAnswer(appleIndex, 'Apple');
      await notifier.submitTest();

      final savedRecord = fakeDb.testRecords.values.single;
      notifier.loadHistoricalRecord(savedRecord);

      final state = container.read(testControllerProvider).value!;
      expect(state.isSubmitted, isTrue);
      expect(state.questions, hasLength(savedRecord.answers.length));
      expect(state.score, savedRecord.score);
    });

    test('restartTest invalidates and rebuilds', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, testControllerProvider);
      final notifier = container.read(testControllerProvider.notifier);
      final questions = container.read(testControllerProvider).value!.questions;
      final appleIndex = questions.indexWhere((q) => q.correctAnswerText == 'Apple');
      notifier.updateUserAnswer(appleIndex, 'Apple');
      await notifier.submitTest();
      expect(container.read(testControllerProvider).value!.isSubmitted, isTrue);

      notifier.restartTest();
      final state = await awaitProviderValue(container, testControllerProvider);
      expect(state.isSubmitted, isFalse);
      expect(state.questions, hasLength(4));
    });
  });
}
