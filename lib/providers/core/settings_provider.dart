import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
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

enum AppLanguage { system, en, fi, ru, es }

extension AppLanguageExtension on AppLanguage {
  String get code {
    switch (this) {
      case AppLanguage.en:
        return 'en';
      case AppLanguage.fi:
        return 'fi';
      case AppLanguage.ru:
        return 'ru';
      case AppLanguage.es:
        return 'es';
      case AppLanguage.system:
        return 'system';
    }
  }

  static AppLanguage fromCode(String code) {
    switch (code) {
      case 'en':
        return AppLanguage.en;
      case 'fi':
        return AppLanguage.fi;
      case 'ru':
        return AppLanguage.ru;
      case 'es':
        return AppLanguage.es;
      default:
        return AppLanguage.system;
    }
  }

  String getDisplayName(Translations t) {
    switch (this) {
      case AppLanguage.en:
        return t.settingsScreen.english;
      case AppLanguage.fi:
        return t.settingsScreen.finnish;
      case AppLanguage.ru:
        return t.settingsScreen.russian;
      case AppLanguage.es:
        return t.settingsScreen.spanish;
      case AppLanguage.system:
        return t.settingsScreen.systemDefault;
    }
  }

  void applyLocale() {
    switch (this) {
      case AppLanguage.en:
        LocaleSettings.setLocale(AppLocale.en);
        break;
      case AppLanguage.fi:
        LocaleSettings.setLocale(AppLocale.fi);
        break;
      case AppLanguage.ru:
        LocaleSettings.setLocale(AppLocale.ru);
        break;
      case AppLanguage.es:
        LocaleSettings.setLocale(AppLocale.es);
        break;
      case AppLanguage.system:
        LocaleSettings.useDeviceLocale();
        break;
    }
  }
}

@riverpod
class AppLanguageNotifier extends _$AppLanguageNotifier {
  Future<void> setLanguage(AppLanguage lang) async {
    _log.fine("[AppLanguageNotifier] Setting language to $lang");
    lang.applyLocale();
    await ref.read(databaseServiceProvider).saveLanguage(lang.code);
    state = lang;
  }

  @override
  AppLanguage build() {
    final langCode = ref.watch(databaseServiceProvider).getLanguage();
    _log.fine("[AppLanguageNotifier] Initializing with langCode: $langCode");
    return AppLanguageExtension.fromCode(langCode);
  }
}

@riverpod
class UiScaleNotifier extends _$UiScaleNotifier {
  Future<void> setScale(double newScale) async {
    _log.fine("[UiScaleNotifier] Setting scale to $newScale");
    await ref.read(databaseServiceProvider).saveUiScale(newScale);
    state = newScale;
  }

  @override
  double build() {
    final scale = ref.watch(databaseServiceProvider).getUiScale();
    _log.fine("[UiScaleNotifier] Initializing with scale: $scale");
    return scale;
  }
}
