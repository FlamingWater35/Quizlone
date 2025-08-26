import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../services/database_service.dart';
import 'core_providers.dart';

part 'settings_provider.g.dart';

@riverpod
class AppTheme extends _$AppTheme {
  late DatabaseService _dbService;

  ThemeMode _stringToThemeMode(String themeName) {
    switch (themeName) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  ThemeMode build() {
    _dbService = ref.watch(databaseServiceProvider);
    final themeName = _dbService.getTheme();
    return _stringToThemeMode(themeName);
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    await _dbService.saveTheme(themeMode.name);
    state = themeMode;
  }
}
