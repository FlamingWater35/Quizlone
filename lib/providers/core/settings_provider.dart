import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/smooth_scroll.dart';
import 'core_providers.dart';

part 'settings_provider.g.dart';

final _log = Logger("SettingsProvider");

void initLocaleSettings() {
  LocaleSettings.setPluralResolver(
    locale: AppLocale.en,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.en.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.fi,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.fi.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.es,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.es.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.ru,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.ru.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.fr,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.fr.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.de,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.de.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.pt,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.pt.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.it,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.it.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.zh,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.zh.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.ja,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.ja.languageCode),
  );
  LocaleSettings.setPluralResolver(
    locale: AppLocale.sv,
    cardinalResolver: PluralResolvers.cardinal(AppLocale.sv.languageCode),
  );
}

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
    if (!ref.mounted) return;
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

enum AppLanguage { system, en, fi, ru, es, fr, de, pt, it, zh, ja, sv }

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
      case AppLanguage.fr:
        return 'fr';
      case AppLanguage.de:
        return 'de';
      case AppLanguage.pt:
        return 'pt';
      case AppLanguage.it:
        return 'it';
      case AppLanguage.zh:
        return 'zh';
      case AppLanguage.ja:
        return 'ja';
      case AppLanguage.sv:
        return 'sv';
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
      case 'fr':
        return AppLanguage.fr;
      case 'de':
        return AppLanguage.de;
      case 'pt':
        return AppLanguage.pt;
      case 'it':
        return AppLanguage.it;
      case 'zh':
        return AppLanguage.zh;
      case 'ja':
        return AppLanguage.ja;
      case 'sv':
        return AppLanguage.sv;
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
      case AppLanguage.fr:
        return t.settingsScreen.french;
      case AppLanguage.de:
        return t.settingsScreen.german;
      case AppLanguage.pt:
        return t.settingsScreen.portuguese;
      case AppLanguage.it:
        return t.settingsScreen.italian;
      case AppLanguage.zh:
        return t.settingsScreen.chinese;
      case AppLanguage.ja:
        return t.settingsScreen.japanese;
      case AppLanguage.sv:
        return t.settingsScreen.swedish;
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
      case AppLanguage.fr:
        LocaleSettings.setLocale(AppLocale.fr);
        break;
      case AppLanguage.de:
        LocaleSettings.setLocale(AppLocale.de);
        break;
      case AppLanguage.pt:
        LocaleSettings.setLocale(AppLocale.pt);
        break;
      case AppLanguage.it:
        LocaleSettings.setLocale(AppLocale.it);
        break;
      case AppLanguage.zh:
        LocaleSettings.setLocale(AppLocale.zh);
        break;
      case AppLanguage.ja:
        LocaleSettings.setLocale(AppLocale.ja);
        break;
      case AppLanguage.sv:
        LocaleSettings.setLocale(AppLocale.sv);
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
    if (!ref.mounted) return;
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
    if (!ref.mounted) return;
    state = newScale;
  }

  @override
  double build() {
    final scale = ref.watch(databaseServiceProvider).getUiScale();
    _log.fine("[UiScaleNotifier] Initializing with scale: $scale");
    return scale;
  }
}

@riverpod
class SmoothScrollNotifier extends _$SmoothScrollNotifier {
  Future<void> toggle(bool enabled) async {
    _log.fine("[SmoothScrollNotifier] Setting enabled to $enabled");
    await ref.read(databaseServiceProvider).saveSmoothScroll(enabled);
    SmoothScrollController.enabledGlobally = enabled;
    if (!ref.mounted) return;
    state = enabled;
  }

  @override
  bool build() {
    final enabled = ref.watch(databaseServiceProvider).getSmoothScroll();
    _log.fine("[SmoothScrollNotifier] Initializing with enabled: $enabled");
    SmoothScrollController.enabledGlobally = enabled;
    return enabled;
  }
}
