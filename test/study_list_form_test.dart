import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/providers/core/settings_provider.dart';
import 'package:quizlone/providers/study/study_list_providers.dart';

import 'helpers/fake_database_service.dart';

void main() {
  setUpAll(() {
    initLocaleSettings();
  });

  late FakeDatabaseService fakeDb;

  setUp(() {
    fakeDb = FakeDatabaseService();
  });

  ProviderContainer createContainer() {
    return ProviderContainer(overrides: [FakeDatabaseService.asOverride(fakeDb)]);
  }

  group('StudyListFormNotifier', () {
    test('initial state has empty fields and a generated list id', () {
      final container = createContainer();
      addTearDown(container.dispose);

      final state = container.read(studyListFormProvider);
      expect(state.listNameInput, '');
      expect(state.rawTermsInput, '');
      expect(state.selectedGroupId, isNull);
      expect(state.isLoading, isFalse);
      expect(state.errorMessage, isNull);
      expect(state.studyList.id, isNotEmpty);
      expect(state.studyList.terms, isEmpty);
    });

    test('setListName and setRawTerms update state and clear errors', () {
      final container = createContainer();
      addTearDown(container.dispose);

      container.read(studyListFormProvider.notifier).setListName('My List');
      container.read(studyListFormProvider.notifier).setRawTerms('a\nb');

      final state = container.read(studyListFormProvider);
      expect(state.listNameInput, 'My List');
      expect(state.rawTermsInput, 'a\nb');
      expect(state.errorMessage, isNull);
    });

    test('setGroupId updates the selected group', () {
      final container = createContainer();
      addTearDown(container.dispose);

      container.read(studyListFormProvider.notifier).setGroupId('g1');
      expect(container.read(studyListFormProvider).selectedGroupId, 'g1');
    });

    test('saveListAndContinue rejects an empty list name', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyListFormProvider.notifier);
      notifier.setRawTerms('a\nb');
      final saved = await notifier.saveListAndContinue();

      expect(saved, isFalse);
      expect(container.read(studyListFormProvider).errorMessage, isNotNull);
      expect(container.read(studyListFormProvider).isLoading, isFalse);
      expect(fakeDb.studyLists, isEmpty);
    });

    test('saveListAndContinue rejects empty terms input', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyListFormProvider.notifier);
      notifier.setListName('My List');
      final saved = await notifier.saveListAndContinue();

      expect(saved, isFalse);
      expect(container.read(studyListFormProvider).errorMessage, isNotNull);
    });

    test('saveListAndContinue rejects an odd number of term lines', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyListFormProvider.notifier);
      notifier.setListName('My List');
      notifier.setRawTerms('a\nb\nc');
      final saved = await notifier.saveListAndContinue();

      expect(saved, isFalse);
      expect(container.read(studyListFormProvider).errorMessage, isNotNull);
    });

    test('saveListAndContinue rejects blank term lines', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyListFormProvider.notifier);
      notifier.setListName('My List');
      notifier.setRawTerms('a\n\nc\nd');
      final saved = await notifier.saveListAndContinue();

      expect(saved, isFalse);
      expect(container.read(studyListFormProvider).errorMessage, isNotNull);
    });

    test('saveListAndContinue persists a valid list and sets it active', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyListFormProvider.notifier);
      notifier.setListName('  My List  ');
      notifier.setGroupId('g1');
      notifier.setRawTerms('Hello\nWorld\nTerm 2\nDefinition 2');
      final saved = await notifier.saveListAndContinue();

      expect(saved, isTrue);
      expect(container.read(studyListFormProvider).errorMessage, isNull);

      expect(fakeDb.studyLists, hasLength(1));
      final savedList = fakeDb.studyLists.values.single;
      expect(savedList.name, 'My List'); // trimmed
      expect(savedList.terms, hasLength(2));
      expect(savedList.terms[0].termText, 'Hello');
      expect(savedList.terms[0].definitionText, 'World');
      expect(savedList.terms[1].termText, 'Term 2');
      expect(savedList.groupId, 'g1');

      // The saved list becomes the active list.
      expect(fakeDb.getActiveListId(), savedList.id);
      expect(container.read(activeStudyListIdProvider), savedList.id);
    });

    test('saveListAndContinue surfaces a DB failure as an error message', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      fakeDb.failOnWrite = true;
      final notifier = container.read(studyListFormProvider.notifier);
      notifier.setListName('My List');
      notifier.setRawTerms('a\nb');
      final saved = await notifier.saveListAndContinue();

      expect(saved, isFalse);
      final state = container.read(studyListFormProvider);
      expect(state.errorMessage, isNotNull);
      expect(state.errorMessage, contains('Simulated DB failure'));
      expect(state.isLoading, isFalse);
    });

    test('saveListAndContinue ignores empty lines between pairs', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      final notifier = container.read(studyListFormProvider.notifier);
      notifier.setListName('My List');
      notifier.setRawTerms('a\nb\n\n\nc\nd');
      final saved = await notifier.saveListAndContinue();

      expect(saved, isTrue);
      expect(fakeDb.studyLists.values.single.terms, hasLength(2));
    });
  });
}
