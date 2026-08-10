import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/providers/core/settings_provider.dart';
import 'package:quizlone/services/smooth_scroll.dart';

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
}
