import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'core_providers.dart';

part 'settings_provider.g.dart';

final _log = Logger("SettingsProvider");

@riverpod
class AppTheme extends _$AppTheme {
  Future<void> setTheme(ThemeMode mode) async {
    _log.fine("[AppTheme] Setting theme to $mode");
    String themeName;
    switch (mode) {
      case ThemeMode.light:
        themeName = 'light';
        break;
      case ThemeMode.dark:
        themeName = 'dark';
        break;
      case ThemeMode.system:
        themeName = 'system';
        break;
    }
    await ref.read(databaseServiceProvider).saveTheme(themeName);
    state = mode;
  }

  @override
  ThemeMode build() {
    final theme = ref.watch(databaseServiceProvider).getTheme();
    _log.fine("[AppTheme] Initializing with theme: $theme");
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}

enum AppLanguage { system, en, fi }

@riverpod
class AppLanguageNotifier extends _$AppLanguageNotifier {
  Future<void> setLanguage(AppLanguage lang) async {
    _log.fine("[AppLanguageNotifier] Setting language to $lang");
    String langCode;
    switch (lang) {
      case AppLanguage.en:
        langCode = 'en';
        LocaleSettings.setLocale(AppLocale.en);
        break;
      case AppLanguage.fi:
        langCode = 'fi';
        LocaleSettings.setLocale(AppLocale.fi);
        break;
      case AppLanguage.system:
      default:
        langCode = 'system';
        LocaleSettings.useDeviceLocale();
        break;
    }
    await ref.read(databaseServiceProvider).saveLanguage(langCode);
    state = lang;
  }

  @override
  AppLanguage build() {
    final langCode = ref.watch(databaseServiceProvider).getLanguage();
    _log.fine("[AppLanguageNotifier] Initializing with langCode: $langCode");
    switch (langCode) {
      case 'en':
        return AppLanguage.en;
      case 'fi':
        return AppLanguage.fi;
      default:
        return AppLanguage.system;
    }
  }
}
