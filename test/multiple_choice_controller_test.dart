import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/models/enums/enums.dart';
import 'package:quizlone/providers/controllers/multiple_choice_controller.dart';
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
      'MC List',
      [
        term('Apple', 'A fruit'),
        term('Banana', 'A yellow fruit'),
        term('Cherry', 'A small red fruit'),
        term('Durian', 'A smelly fruit'),
      ],
      id: listId,
    );
  });

  group('MultipleChoiceController', () {
    test('builds a question for every term', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, multipleChoiceControllerProvider);
      expect(state.isLoading, isFalse);
      expect(state.errorMessage, isNull);
      expect(state.totalQuestions, 4);
      expect(state.correctCount, 0);
      expect(state.isSessionComplete, isFalse);
      expect(state.currentQuestion, isNotNull);
    });

    test('asks for the term when studyAskWith is term (definition shown)', () async {
      final container = createControllerContainer(
        db: fakeDb,
        activeListId: listId,
        askWith: StudyQuestionType.term,
      );
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, multipleChoiceControllerProvider);
      for (final q in state.questions) {
        // askDefinition=true -> show the term, ask for the definition.
        expect(q.questionText, q.term.termText);
        expect(q.correctAnswer, q.term.definitionText);
      }
    });

    test('asks for the definition when studyAskWith is definition (term shown)', () async {
      final container = createControllerContainer(
        db: fakeDb,
        activeListId: listId,
        askWith: StudyQuestionType.definition,
      );
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, multipleChoiceControllerProvider);
      for (final q in state.questions) {
        // askDefinition=false -> show the definition, ask for the term.
        expect(q.questionText, q.term.definitionText);
        expect(q.correctAnswer, q.term.termText);
      }
    });

    test('each question has four options including the correct one', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, multipleChoiceControllerProvider);
      for (final q in state.questions) {
        expect(q.options, hasLength(4));
        expect(q.options, contains(q.correctAnswer));
      }
    });

    test('reports an error with fewer than 4 terms', () async {
      fakeDb.studyLists[listId] = listWithTerms('Small', sampleTerms(3), id: listId);
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, multipleChoiceControllerProvider);
      expect(state.errorMessage, isNotNull);
      expect(state.questions, isEmpty);
    });

    test('correct answers increase the score and advance after the delay', () {
      fakeAsync((async) async {
        final container = createControllerContainer(db: fakeDb, activeListId: listId);
        addTearDown(container.dispose);

        await awaitProviderValue(container, multipleChoiceControllerProvider);

        final notifier = container.read(multipleChoiceControllerProvider.notifier);
        final correct = container
            .read(multipleChoiceControllerProvider)
            .value!
            .currentQuestion!
            .correctAnswer;
        notifier.submitAnswer(correct);
        async.flushMicrotasks();

        var state = container.read(multipleChoiceControllerProvider).value!;
        expect(state.isAnswerProcessed, isTrue);
        expect(state.selectedAnswer, correct);
        expect(state.correctCount, 1);

        async.elapse(const Duration(milliseconds: 2000));
        state = container.read(multipleChoiceControllerProvider).value!;
        expect(state.currentIndex, 1);
        expect(state.isAnswerProcessed, isFalse);
        expect(state.selectedAnswer, isNull);
      });
    });

    test('wrong answers keep the score and advance', () {
      fakeAsync((async) async {
        final container = createControllerContainer(db: fakeDb, activeListId: listId);
        addTearDown(container.dispose);

        await awaitProviderValue(container, multipleChoiceControllerProvider);

        final notifier = container.read(multipleChoiceControllerProvider.notifier);
        final q = container
            .read(multipleChoiceControllerProvider)
            .value!
            .currentQuestion!;
        final wrong = q.options.firstWhere((o) => o != q.correctAnswer);
        notifier.submitAnswer(wrong);
        async.flushMicrotasks();

        var state = container.read(multipleChoiceControllerProvider).value!;
        expect(state.correctCount, 0);
        expect(state.selectedAnswer, wrong);

        async.elapse(const Duration(milliseconds: 2000));
        state = container.read(multipleChoiceControllerProvider).value!;
        expect(state.currentIndex, 1);
      });
    });

    test('completing all questions ends the session', () {
      fakeAsync((async) async {
        final container = createControllerContainer(db: fakeDb, activeListId: listId);
        addTearDown(container.dispose);

        await awaitProviderValue(container, multipleChoiceControllerProvider);

        final notifier = container.read(multipleChoiceControllerProvider.notifier);
        for (var i = 0; i < 4; i++) {
          final q = container
              .read(multipleChoiceControllerProvider)
              .value!
              .currentQuestion!;
          notifier.submitAnswer(q.correctAnswer);
          async.flushMicrotasks();
          async.elapse(const Duration(milliseconds: 2000));
        }

        final state = container.read(multipleChoiceControllerProvider).value!;
        expect(state.isSessionComplete, isTrue);
        expect(state.correctCount, 4);
        expect(state.currentQuestion, isNull);
      });
    });
  });
}
