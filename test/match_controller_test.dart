import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/providers/controllers/match_controller.dart';
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
      'Match List',
      [
        term('Apple', 'A fruit'),
        term('Banana', 'A yellow fruit'),
        term('Cherry', 'A small red fruit'),
      ],
      id: listId,
    );
  });

  group('MatchController', () {
    test('builds pairs for each term and shuffles them', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, matchControllerProvider);
      expect(state.isLoading, isFalse);
      expect(state.errorMessage, isNull);
      expect(state.isComplete, isFalse);
      // 3 terms -> 6 items.
      expect(state.items, hasLength(6));
      expect(state.items.map((i) => i.pairId).toSet(), {'Apple', 'Banana', 'Cherry'});
      // Each pair has exactly one term and one definition card.
      for (final pairId in {'Apple', 'Banana', 'Cherry'}) {
        final pairItems = state.items.where((i) => i.pairId == pairId).toList();
        expect(pairItems, hasLength(2));
        expect(pairItems.map((i) => i.text).toSet(), {pairId, pairId == 'Apple' ? 'A fruit' : pairId == 'Banana' ? 'A yellow fruit' : 'A small red fruit'});
      }
      // Unique ids.
      expect(state.items.map((i) => i.uniqueId).toSet(), hasLength(6));
    });

    test('caps the deck at maxMatchPairs pairs', () async {
      fakeDb.studyLists[listId] = listWithTerms('Big', sampleTerms(15), id: listId);
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, matchControllerProvider);
      expect(state.items, hasLength(maxMatchPairs * 2));
    });

    test('reports an error when there are no terms', () async {
      fakeDb.studyLists[listId]!.terms.clear();
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, matchControllerProvider);
      expect(state.errorMessage, isNotNull);
    });

    test('selecting the same card twice deselects it', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, matchControllerProvider);
      final notifier = container.read(matchControllerProvider.notifier);
      final first = state.items.first;

      notifier.selectItem(first);
      expect(
        container.read(matchControllerProvider).value!.selectedItem?.uniqueId,
        first.uniqueId,
      );
      notifier.selectItem(first);
      expect(container.read(matchControllerProvider).value!.selectedItem, isNull);
    });

    test('matching a pair adds it to matchedPairIds', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, matchControllerProvider);
      final notifier = container.read(matchControllerProvider.notifier);

      final pair = state.items.first.pairId;
      final pairItems = state.items.where((i) => i.pairId == pair).toList();
      notifier.selectItem(pairItems[0]);
      notifier.selectItem(pairItems[1]);

      final current = container.read(matchControllerProvider).value!;
      expect(current.matchedPairIds, {pair});
      expect(current.selectedItem, isNull);
      expect(current.isComplete, isFalse);
    });

    test('mismatched cards highlight as incorrect then reset', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, matchControllerProvider);
      final notifier = container.read(matchControllerProvider.notifier);

      final firstPair = state.items[0].pairId;
      // Pick a second item from a DIFFERENT pair (items are shuffled, so the
      // first two entries could belong to the same pair).
      final secondPair = state.items
          .firstWhere((i) => i.pairId != firstPair)
          .pairId;
      final firstPairItem = state.items.firstWhere((i) => i.pairId == firstPair);
      final secondPairItem = state.items.firstWhere((i) => i.pairId == secondPair);

      notifier.selectItem(firstPairItem);
      notifier.selectItem(secondPairItem);

      var current = container.read(matchControllerProvider).value!;
      expect(current.incorrectPair, {firstPairItem.uniqueId, secondPairItem.uniqueId});
      expect(current.selectedItem, isNull);
      expect(current.matchedPairIds, isEmpty);

      // After the highlight delay the incorrect pair resets.
      await Future<void>.delayed(const Duration(milliseconds: 600));
      current = container.read(matchControllerProvider).value!;
      expect(current.incorrectPair, isEmpty);
    });

    test('completing all pairs finishes the game and saves a record', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, matchControllerProvider);
      final notifier = container.read(matchControllerProvider.notifier);

      final pairs = state.items.map((i) => i.pairId).toSet();
      for (final pair in pairs) {
        final pairItems = state.items.where((i) => i.pairId == pair).toList();
        notifier.selectItem(pairItems[0]);
        notifier.selectItem(pairItems[1]);
      }

      // selectItem is `void async`, so its DB save runs in the background;
      // let those microtasks settle before asserting completion.
      await Future<void>.delayed(const Duration(milliseconds: 20));
      await pumpEventQueue();

      final current = container.read(matchControllerProvider).value!;
      expect(current.isComplete, isTrue);
      expect(current.matchedPairIds, hasLength(3));
      expect(current.finalRecord, isNotNull);
      expect(current.finalRecord!.studyListId, listId);
      expect(current.finalRecord!.timeInTenths, greaterThanOrEqualTo(0));

      // Saved and pruned via the fake DB.
      expect(fakeDb.matchRecords, hasLength(1));
      expect(fakeDb.pruneCalls[listId], 1);
    });

    test('ignores selections after the game is complete', () async {
      final container = createControllerContainer(db: fakeDb, activeListId: listId);
      addTearDown(container.dispose);

      final state = await awaitProviderValue(container, matchControllerProvider);
      final notifier = container.read(matchControllerProvider.notifier);

      final pairs = state.items.map((i) => i.pairId).toSet();
      for (final pair in pairs) {
        final pairItems = state.items.where((i) => i.pairId == pair).toList();
        notifier.selectItem(pairItems[0]);
        notifier.selectItem(pairItems[1]);
      }
      await Future<void>.delayed(const Duration(milliseconds: 20));
      await pumpEventQueue();

      expect(container.read(matchControllerProvider).value!.isComplete, isTrue);

      final before = container.read(matchControllerProvider).value!.matchedPairIds;
      notifier.selectItem(state.items.first);
      await Future<void>.delayed(const Duration(milliseconds: 10));
      expect(
        container.read(matchControllerProvider).value!.matchedPairIds,
        before,
      );
      expect(container.read(matchControllerProvider).value!.selectedItem, isNull);
    });
  });
}
