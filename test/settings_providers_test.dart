import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/models/enums/enums.dart';
import 'package:quizlone/models/study_defaults.dart';
import 'package:quizlone/providers/core/settings_provider.dart';
import 'package:quizlone/services/smooth_scroll.dart';

import 'helpers/fake_database_service.dart';
import 'helpers/test_data.dart';

void main() {
  setUpAll(() {
    initLocaleSettings();
  });

  late FakeDatabaseService fakeDb;

  setUp(() {
    fakeDb = FakeDatabaseService();
  });

  ProviderContainer createContainer() {
    return ProviderContainer(
      overrides: [FakeDatabaseService.asOverride(fakeDb)],
    );
  }

  group('AppLanguageExtension', () {
    test('fromCode maps known codes and falls back to system', () {
      expect(AppLanguageExtension.fromCode('en'), AppLanguage.en);
      expect(AppLanguageExtension.fromCode('fi'), AppLanguage.fi);
      expect(AppLanguageExtension.fromCode('zh'), AppLanguage.zh);
      expect(AppLanguageExtension.fromCode('unknown'), AppLanguage.system);
    });

    test('code getter returns the language code', () {
      expect(AppLanguage.en.code, 'en');
      expect(AppLanguage.system.code, 'system');
      expect(AppLanguage.ru.code, 'ru');
    });

    test('getDisplayName returns localized labels for every language', () {
      // `t` is the global translations getter from slang.
      expect(AppLanguage.en.getDisplayName(t), isNotEmpty);
      expect(AppLanguage.system.getDisplayName(t), isNotEmpty);
    });
  });

  group('AppTheme', () {
    test('defaults to system theme', () {
      final container = createContainer();
      addTearDown(container.dispose);
      expect(container.read(appThemeProvider), ThemeMode.system);
    });

    test('persists a saved theme', () async {
      fakeDb.settings['theme'] = 'dark';
      final container = createContainer();
      addTearDown(container.dispose);
      expect(container.read(appThemeProvider), ThemeMode.dark);
    });

    test('setTheme saves and updates state', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(appThemeProvider.notifier).setTheme(ThemeMode.light);
      expect(container.read(appThemeProvider), ThemeMode.light);
      expect(fakeDb.settings['theme'], 'light');
    });
  });

  group('AppLanguageNotifier', () {
    test('defaults to system language', () {
      final container = createContainer();
      addTearDown(container.dispose);
      expect(container.read(appLanguageProvider), AppLanguage.system);
    });

    test('setLanguage persists and updates state', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container
          .read(appLanguageProvider.notifier)
          .setLanguage(AppLanguage.fr);
      expect(container.read(appLanguageProvider), AppLanguage.fr);
      expect(fakeDb.settings['language'], 'fr');
    });
  });

  group('UiScaleNotifier', () {
    test('defaults to 1.0', () {
      final container = createContainer();
      addTearDown(container.dispose);
      expect(container.read(uiScaleProvider), 1.0);
    });

    test('setScale persists and updates state', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(uiScaleProvider.notifier).setScale(1.25);
      expect(container.read(uiScaleProvider), 1.25);
      expect(fakeDb.settings['uiScale'], 1.25);
    });
  });

  group('SmoothScrollNotifier', () {
    test('defaults to disabled', () {
      final container = createContainer();
      addTearDown(container.dispose);
      expect(container.read(smoothScrollProvider), isFalse);
      expect(SmoothScrollController.enabledGlobally, isFalse);
    });

    test('toggle persists, updates state, and flips the global flag', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(smoothScrollProvider.notifier).toggle(true);
      expect(container.read(smoothScrollProvider), isTrue);
      expect(fakeDb.settings['smoothScrollEnabled'], isTrue);
      expect(SmoothScrollController.enabledGlobally, isTrue);
    });
  });

  group('study/behavior settings notifiers', () {
    test('expose the documented defaults', () {
      final container = createContainer();
      addTearDown(container.dispose);

      expect(container.read(reduceMotionProvider), isFalse);
      expect(container.read(autoAdvanceEnabledProvider), isTrue);
      expect(container.read(autoAdvanceDelayMsProvider), 1500);
      expect(container.read(gradingIgnorePunctuationProvider), isFalse);
      expect(container.read(gradingAccentInsensitiveProvider), isFalse);
      expect(container.read(autoSyncEnabledProvider), isTrue);
      expect(container.read(matchPairsProvider), 10);
      expect(container.read(matchPenaltyEnabledProvider), isTrue);
      expect(container.read(autoUpdateCheckEnabledProvider), isTrue);
      expect(container.read(systemTextScaleProvider), isTrue);
      expect(container.read(studyDefaultsProvider), const StudyDefaults());
    });

    test('toggle/set round-trips through the fake DB', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(reduceMotionProvider.notifier).toggle(true);
      expect(container.read(reduceMotionProvider), isTrue);
      expect(fakeDb.settings['flashcardAnimationsDisabled'], isTrue);

      await container.read(autoAdvanceEnabledProvider.notifier).toggle(false);
      expect(container.read(autoAdvanceEnabledProvider), isFalse);
      expect(fakeDb.settings['autoAdvanceEnabled'], isFalse);

      await container.read(autoAdvanceDelayMsProvider.notifier).set(750);
      expect(container.read(autoAdvanceDelayMsProvider), 750);
      expect(fakeDb.settings['autoAdvanceDelayMs'], 750);

      await container
          .read(gradingIgnorePunctuationProvider.notifier)
          .toggle(true);
      expect(container.read(gradingIgnorePunctuationProvider), isTrue);
      expect(fakeDb.settings['gradingIgnorePunctuation'], isTrue);

      await container.read(gradingAccentInsensitiveProvider.notifier).toggle(
        true,
      );
      expect(container.read(gradingAccentInsensitiveProvider), isTrue);
      expect(fakeDb.settings['gradingAccentInsensitive'], isTrue);

      await container.read(matchPairsProvider.notifier).set(4);
      expect(container.read(matchPairsProvider), 4);
      expect(fakeDb.settings['matchPairs'], 4);

      await container.read(matchPenaltyEnabledProvider.notifier).toggle(false);
      expect(container.read(matchPenaltyEnabledProvider), isFalse);
      expect(fakeDb.settings['matchPenaltyEnabled'], isFalse);

      await container
          .read(autoUpdateCheckEnabledProvider.notifier)
          .toggle(false);
      expect(container.read(autoUpdateCheckEnabledProvider), isFalse);
      expect(fakeDb.settings['autoUpdateCheckEnabled'], isFalse);

      await container.read(systemTextScaleProvider.notifier).toggle(false);
      expect(container.read(systemTextScaleProvider), isFalse);
      expect(fakeDb.settings['systemTextScaleEnabled'], isFalse);

      // Only exercised in the "off" direction: re-enabling while signed in
      // would touch Supabase, which is not initialized in unit tests.
      await container.read(autoSyncEnabledProvider.notifier).toggle(false);
      expect(container.read(autoSyncEnabledProvider), isFalse);
      expect(fakeDb.settings['autoSyncEnabled'], isFalse);
    });

    test('StudyDefaultsNotifier.update persists the new defaults', () async {
      final container = createContainer();
      addTearDown(container.dispose);

      const updated = StudyDefaults(
        flashcardStartSide: FlashcardStartSide.definition,
        askWith: StudyQuestionType.term,
        testFormat: TestFormat.mc,
        studyLength: 7,
        ignoreBrackets: false,
        allowAnswerSubstring: true,
      );

      await container.read(studyDefaultsProvider.notifier).update(updated);
      expect(container.read(studyDefaultsProvider), updated);
      expect(fakeDb.getStudyDefaults(), updated);

      // Survives a fresh container reading back from the same fake.
      final fresh = createContainer();
      addTearDown(fresh.dispose);
      expect(fresh.read(studyDefaultsProvider), updated);
    });

    test('applyToAllLists writes the defaults onto every list', () async {
      const listA = 'list-a';
      const listB = 'list-b';
      fakeDb.studyLists[listA] = listWithTerms('A', [
        term('t1', 'd1'),
        term('t2', 'd2'),
      ], id: listA);
      fakeDb.studyLists[listB] = listWithTerms('B', [
        term('t3', 'd3'),
        term('t4', 'd4'),
      ], id: listB);

      final container = createContainer();
      addTearDown(container.dispose);

      await container.read(studyDefaultsProvider.notifier).update(
            const StudyDefaults(
              flashcardStartSide: FlashcardStartSide.definition,
              askWith: StudyQuestionType.term,
              testFormat: TestFormat.mc,
              studyLength: 3,
              ignoreBrackets: false,
              allowAnswerSubstring: true,
            ),
          );

      final count = await container
          .read(studyDefaultsProvider.notifier)
          .applyToAllLists();
      expect(count, 2);

      for (final list in fakeDb.studyLists.values) {
        expect(list.flashcardShowTermFirst, isFalse);
        expect(list.studyShowDefinitionAskTerm, isFalse);
        expect(list.testFormat, TestFormat.mc);
        expect(list.testStudyLength, 3);
        expect(list.ignoreBrackets, isFalse);
        expect(list.allowAnswerSubstring, isTrue);
      }
    });
  });
}
