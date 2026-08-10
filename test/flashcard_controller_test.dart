import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/models/enums/enums.dart';
import 'package:quizlone/providers/controllers/flashcard_controller.dart';
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
      'Flashcards',
      sampleTerms(3),
      id: listId,
    );
  });

  group('FlashcardController', () {
    test('builds state with all terms and defaults', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, flashcardControllerProvider);
      expect(state.isLoading, isFalse);
      expect(state.errorMessage, isNull);
      expect(state.originalTerms, hasLength(3));
      expect(state.displayTerms, hasLength(3));
      expect(state.currentIndex, 0);
      expect(state.isFlipped, isFalse);
      expect(state.startSide, FlashcardStartSide.term);
    });

    test('reports an error when no terms are available', () async {
      fakeDb.studyLists[listId]!.terms.clear();
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, flashcardControllerProvider);
      expect(state.errorMessage, isNotNull);
      expect(state.displayTerms, isEmpty);
    });

    test('reports an error when the active list is missing', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: 'missing');
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, flashcardControllerProvider);
      expect(state.errorMessage, isNotNull);
    });

    test('flipCard toggles the flip state', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, flashcardControllerProvider);
      final notifier = container.read(flashcardControllerProvider.notifier);

      notifier.flipCard();
      expect(container.read(flashcardControllerProvider).value!.isFlipped, isTrue);
      notifier.flipCard();
      expect(container.read(flashcardControllerProvider).value!.isFlipped, isFalse);
    });

    test('nextCard and previousCard move through the deck', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, flashcardControllerProvider);
      final notifier = container.read(flashcardControllerProvider.notifier);

      notifier.nextCard();
      expect(container.read(flashcardControllerProvider).value!.currentIndex, 1);
      notifier.nextCard();
      expect(container.read(flashcardControllerProvider).value!.currentIndex, 2);
      // Clamped at the end.
      notifier.nextCard();
      expect(container.read(flashcardControllerProvider).value!.currentIndex, 2);

      notifier.previousCard();
      expect(container.read(flashcardControllerProvider).value!.currentIndex, 1);
      notifier.previousCard();
      notifier.previousCard();
      expect(container.read(flashcardControllerProvider).value!.currentIndex, 0);
    });

    test('shuffleCards reorders the deck and resets progress', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, flashcardControllerProvider);
      final notifier = container.read(flashcardControllerProvider.notifier);
      notifier.nextCard();
      notifier.flipCard();

      notifier.shuffleCards();
      final state = container.read(flashcardControllerProvider).value!;
      expect(state.currentIndex, 0);
      expect(state.isFlipped, isFalse);
      expect(state.displayTerms, hasLength(3));
      // Same set, possibly different order.
      expect(
        state.displayTerms.map((t) => t.termText).toSet(),
        {'Term 0', 'Term 1', 'Term 2'},
      );
      // Original set is preserved for restarts.
      expect(state.originalTerms.map((t) => t.termText).toSet(), {'Term 0', 'Term 1', 'Term 2'});
    });

    test('restart resets to the first card and unflips', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, flashcardControllerProvider);
      final notifier = container.read(flashcardControllerProvider.notifier);
      notifier.nextCard();
      notifier.nextCard();
      notifier.flipCard();

      notifier.restart();
      final state = container.read(flashcardControllerProvider).value!;
      expect(state.currentIndex, 0);
      expect(state.isFlipped, isFalse);
    });

    test('currentCard and currentProgress reflect position', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      await awaitProviderValue(container, flashcardControllerProvider);
      final state = container.read(flashcardControllerProvider).value!;
      expect(state.currentCard!.termText, 'Term 0');
      expect(state.currentProgress, '1/3');
    });

    test('respects the flashcard start side option', () async {
      final container = createControllerContainer(
        db: fakeDb,
        activeListId: listId,
        startSide: FlashcardStartSide.definition,
      );
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, flashcardControllerProvider);
      expect(state.startSide, FlashcardStartSide.definition);
    });
  });
}
