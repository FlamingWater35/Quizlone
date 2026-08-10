import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/models/enums/enums.dart';
import 'package:quizlone/providers/controllers/learn_controller.dart';
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
      'Learn List',
      [
        term('Apple', 'A fruit'),
        term('Banana', 'A yellow fruit'),
        term('Cherry', 'A small red fruit'),
      ],
      id: listId,
    );
  });

  group('LearnController', () {
    test('builds the first cycle with the first question', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, learnControllerProvider);
      expect(state.isLoading, isFalse);
      expect(state.errorMessage, isNull);
      expect(state.isSessionComplete, isFalse);
      expect(state.cycleCount, 1);
      expect(state.termsToLearnThisCycle, hasLength(3));
      expect(state.currentQuestion, isNotNull);
      // Definition shown, term expected by default.
      expect(state.currentQuestion!.questionText, isNotEmpty);
    });

    test('asks for the definition when studyAskWith is definition', () async {
      final container = createControllerContainer(
        db: fakeDb,
        activeListId: listId,
        askWith: StudyQuestionType.definition,
      );
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, learnControllerProvider);
      final q = state.currentQuestion!;
      expect(q.expectedAnswer, q.term.termText);
      expect(q.questionText, q.term.definitionText);
    });

    test('asks for the term when studyAskWith is term', () async {
      final container = createControllerContainer(
        db: fakeDb,
        activeListId: listId,
        askWith: StudyQuestionType.term,
      );
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, learnControllerProvider);
      final q = state.currentQuestion!;
      expect(q.expectedAnswer, q.term.definitionText);
      expect(q.questionText, q.term.termText);
    });

    test('reports an error when there are no terms', () async {
      fakeDb.studyLists[listId]!.terms.clear();
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, learnControllerProvider);
      expect(state.errorMessage, isNotNull);
    });

    test('updateUserAnswer updates the typed answer', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, learnControllerProvider);
      final notifier = container.read(learnControllerProvider.notifier);
      notifier.updateUserAnswer('Apple');
      expect(
        container.read(learnControllerProvider).value!.currentQuestion!.userAnswer,
        'Apple',
      );
    });

    test('submitAnswer marks correct answers and advances after the delay', () {
      fakeAsync((async) async {
        final container = createControllerContainer(db: fakeDb, activeListId: listId);
        addTearDown(container.dispose);

        await awaitProviderValue(container, learnControllerProvider);

        final notifier = container.read(learnControllerProvider.notifier);
        final expected = container
            .read(learnControllerProvider)
            .value!
            .currentQuestion!
            .expectedAnswer;
        notifier.updateUserAnswer(expected);
        notifier.submitAnswer();
        async.flushMicrotasks();

        var state = container.read(learnControllerProvider).value!;
        expect(state.currentQuestion!.feedbackType, LearnFeedbackType.correct);
        expect(state.currentQuestion!.answerSubmitted, isTrue);
        expect(state.termsIncorrectThisCycle, isEmpty);

        // After the feedback delay the session advances to question 2.
        async.elapse(const Duration(milliseconds: 2000));
        state = container.read(learnControllerProvider).value!;
        expect(state.currentTermIndexInCycle, 1);
      });
    });

    test('submitAnswer marks wrong answers and tracks them for retry', () {
      fakeAsync((async) async {
        final container = createControllerContainer(db: fakeDb, activeListId: listId);
        addTearDown(container.dispose);

        await awaitProviderValue(container, learnControllerProvider);

        final notifier = container.read(learnControllerProvider.notifier);
        notifier.updateUserAnswer('totally wrong');
        notifier.submitAnswer();
        async.flushMicrotasks();

        var state = container.read(learnControllerProvider).value!;
        expect(state.currentQuestion!.feedbackType, LearnFeedbackType.incorrect);
        expect(state.termsIncorrectThisCycle, hasLength(1));

        async.elapse(const Duration(milliseconds: 2000));
        state = container.read(learnControllerProvider).value!;
        expect(state.currentTermIndexInCycle, 1);
      });
    });

    test('showHint reveals the first character', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, learnControllerProvider);
      final notifier = container.read(learnControllerProvider.notifier);
      notifier.showHint();

      final state = container.read(learnControllerProvider).value!;
      expect(state.currentQuestion!.feedbackType, LearnFeedbackType.hint);
      final expected = state.currentQuestion!.expectedAnswer;
      expect(state.currentQuestion!.feedbackMessage, contains(expected[0]));
    });

    test('skipQuestionAndShowAnswer marks skipped and advances', () {
      fakeAsync((async) async {
        final container = createControllerContainer(db: fakeDb, activeListId: listId);
        addTearDown(container.dispose);

        await awaitProviderValue(container, learnControllerProvider);

        final notifier = container.read(learnControllerProvider.notifier);
        notifier.skipQuestionAndShowAnswer();
        async.flushMicrotasks();

        var state = container.read(learnControllerProvider).value!;
        expect(state.currentQuestion!.feedbackType, LearnFeedbackType.skipped);
        expect(state.currentQuestion!.answerSubmitted, isTrue);
        expect(state.termsIncorrectThisCycle, hasLength(1));

        async.elapse(const Duration(milliseconds: 2500));
        state = container.read(learnControllerProvider).value!;
        expect(state.currentTermIndexInCycle, 1);
      });
    });

    test('answering everything correctly completes the session', () {
      fakeAsync((async) async {
        final container = createControllerContainer(db: fakeDb, activeListId: listId);
        addTearDown(container.dispose);

        await awaitProviderValue(container, learnControllerProvider);

        final notifier = container.read(learnControllerProvider.notifier);

        // Answer all 3 questions correctly.
        for (var i = 0; i < 3; i++) {
          final expected = container
              .read(learnControllerProvider)
              .value!
              .currentQuestion!
              .expectedAnswer;
          notifier.updateUserAnswer(expected);
          notifier.submitAnswer();
          async.flushMicrotasks();
          async.elapse(const Duration(milliseconds: 2000));
        }

        final state = container.read(learnControllerProvider).value!;
        expect(state.isSessionComplete, isTrue);
        expect(state.currentQuestion, isNull);
      });
    });
  });
}
