import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/enums/enums.dart';
import '../../models/study_defaults.dart';
import '../../services/smooth_scroll.dart';
import '../study/study_list_providers.dart';
import 'auth_provider.dart';
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

/// Default theme seed color used when the user has not picked a custom one.
const Color defaultSeedColor = Colors.deepPurple;

@riverpod
class SeedColorNotifier extends _$SeedColorNotifier {
  /// Persists a custom theme seed color as an ARGB integer.
  /// Passing `null` restores the default seed color.
  Future<void> set(int? argb) async {
    _log.fine("[SeedColorNotifier] Setting seed color to $argb");
    await ref.read(databaseServiceProvider).saveSeedColor(argb);
    if (!ref.mounted) return;
    state = argb;
  }

  @override
  int? build() {
    final argb = ref.watch(databaseServiceProvider).getSeedColor();
    _log.fine("[SeedColorNotifier] Initializing with seed color: $argb");
    return argb;
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

@riverpod
class ScrollSpeedNotifier extends _$ScrollSpeedNotifier {
  Future<void> set(double value) async {
    _log.fine("[ScrollSpeedNotifier] Setting speed to $value");
    await ref.read(databaseServiceProvider).saveScrollSpeed(value);
    if (!ref.mounted) return;
    state = value;
  }

  @override
  double build() {
    final speed = ref.watch(databaseServiceProvider).getScrollSpeed();
    _log.fine("[ScrollSpeedNotifier] Initializing with speed: $speed");
    return speed;
  }
}

@riverpod
class ScrollDurationNotifier extends _$ScrollDurationNotifier {
  Future<void> set(int value) async {
    _log.fine("[ScrollDurationNotifier] Setting duration to $value");
    await ref.read(databaseServiceProvider).saveScrollDuration(value);
    if (!ref.mounted) return;
    state = value;
  }

  @override
  int build() {
    final duration = ref.watch(databaseServiceProvider).getScrollDuration();
    _log.fine("[ScrollDurationNotifier] Initializing with duration: $duration");
    return duration;
  }
}

@riverpod
class ReduceMotion extends _$ReduceMotion {
  Future<void> toggle(bool disabled) async {
    _log.fine("[ReduceMotion] Setting disabled to $disabled");
    await ref
        .read(databaseServiceProvider)
        .saveFlashcardAnimationsDisabled(disabled);
    if (!ref.mounted) return;
    state = disabled;
  }

  @override
  bool build() {
    final disabled = ref
        .watch(databaseServiceProvider)
        .getFlashcardAnimationsDisabled();
    _log.fine("[ReduceMotion] Initializing with disabled: $disabled");
    return disabled;
  }
}

@riverpod
class StudyDefaultsNotifier extends _$StudyDefaultsNotifier {
  Future<void> update(StudyDefaults defaults) async {
    _log.fine("[StudyDefaultsNotifier] Updating defaults");
    await ref.read(databaseServiceProvider).saveStudyDefaults(defaults);
    if (!ref.mounted) return;
    state = defaults;
  }

  /// Applies the current defaults to every existing list. Returns the number
  /// of lists updated so the UI can confirm.
  Future<int> applyToAllLists() async {
    final db = ref.read(databaseServiceProvider);
    final defaults = state;
    final lists = await db.getAllStudyLists();
    for (final list in lists) {
      list
        ..flashcardShowTermFirst =
            defaults.flashcardStartSide == FlashcardStartSide.term
        ..studyShowDefinitionAskTerm =
            defaults.askWith == StudyQuestionType.definition
        ..testFormat = defaults.testFormat
        ..testStudyLength = defaults.studyLength
        ..ignoreBrackets = defaults.ignoreBrackets
        ..allowAnswerSubstring = defaults.allowAnswerSubstring;
      await db.saveStudyList(list);
    }
    if (!ref.mounted) return lists.length;
    ref.invalidate(studyListsProvider);
    ref.invalidate(activeStudyListProvider);
    return lists.length;
  }

  @override
  StudyDefaults build() {
    return ref.watch(databaseServiceProvider).getStudyDefaults();
  }
}

@riverpod
class AutoAdvanceEnabled extends _$AutoAdvanceEnabled {
  Future<void> toggle(bool enabled) async {
    await ref.read(databaseServiceProvider).saveAutoAdvanceEnabled(enabled);
    if (!ref.mounted) return;
    state = enabled;
  }

  @override
  bool build() => ref.watch(databaseServiceProvider).getAutoAdvanceEnabled();
}

@riverpod
class AutoAdvanceDelayMs extends _$AutoAdvanceDelayMs {
  Future<void> set(int ms) async {
    await ref.read(databaseServiceProvider).saveAutoAdvanceDelayMs(ms);
    if (!ref.mounted) return;
    state = ms;
  }

  @override
  int build() => ref.watch(databaseServiceProvider).getAutoAdvanceDelayMs();
}

@riverpod
class GradingIgnorePunctuation extends _$GradingIgnorePunctuation {
  Future<void> toggle(bool enabled) async {
    await ref
        .read(databaseServiceProvider)
        .saveGradingIgnorePunctuation(enabled);
    if (!ref.mounted) return;
    state = enabled;
  }

  @override
  bool build() =>
      ref.watch(databaseServiceProvider).getGradingIgnorePunctuation();
}

@riverpod
class GradingAccentInsensitive extends _$GradingAccentInsensitive {
  Future<void> toggle(bool enabled) async {
    await ref
        .read(databaseServiceProvider)
        .saveGradingAccentInsensitive(enabled);
    if (!ref.mounted) return;
    state = enabled;
  }

  @override
  bool build() =>
      ref.watch(databaseServiceProvider).getGradingAccentInsensitive();
}

@riverpod
class AutoSyncEnabled extends _$AutoSyncEnabled {
  Future<void> toggle(bool enabled) async {
    await ref.read(databaseServiceProvider).saveAutoSyncEnabled(enabled);
    if (!ref.mounted) return;
    state = enabled;
    // Re-enabling while signed in should resume syncing promptly.
    if (enabled && ref.read(authControllerProvider).value != null) {
      await ref.read(authControllerProvider.notifier).resetCircuitAndSync();
    }
  }

  @override
  bool build() => ref.watch(databaseServiceProvider).getAutoSyncEnabled();
}

@riverpod
class MatchPairs extends _$MatchPairs {
  Future<void> set(int pairs) async {
    await ref.read(databaseServiceProvider).saveMatchPairs(pairs);
    if (!ref.mounted) return;
    state = pairs;
  }

  @override
  int build() => ref.watch(databaseServiceProvider).getMatchPairs();
}

@riverpod
class MatchPenaltyEnabled extends _$MatchPenaltyEnabled {
  Future<void> toggle(bool enabled) async {
    await ref.read(databaseServiceProvider).saveMatchPenaltyEnabled(enabled);
    if (!ref.mounted) return;
    state = enabled;
  }

  @override
  bool build() => ref.watch(databaseServiceProvider).getMatchPenaltyEnabled();
}

@riverpod
class AutoUpdateCheckEnabled extends _$AutoUpdateCheckEnabled {
  Future<void> toggle(bool enabled) async {
    await ref.read(databaseServiceProvider).saveAutoUpdateCheckEnabled(enabled);
    if (!ref.mounted) return;
    state = enabled;
  }

  @override
  bool build() =>
      ref.watch(databaseServiceProvider).getAutoUpdateCheckEnabled();
}

@riverpod
class SystemTextScale extends _$SystemTextScale {
  Future<void> toggle(bool enabled) async {
    await ref.read(databaseServiceProvider).saveSystemTextScaleEnabled(enabled);
    if (!ref.mounted) return;
    state = enabled;
  }

  @override
  bool build() =>
      ref.watch(databaseServiceProvider).getSystemTextScaleEnabled();
}
