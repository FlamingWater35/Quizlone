// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appThemeHash() => r'a3d87842816f1bd03c31728f831b23d9e2426c55';

/// See also [AppTheme].
@ProviderFor(AppTheme)
final appThemeProvider =
    AutoDisposeNotifierProvider<AppTheme, ThemeMode>.internal(
      AppTheme.new,
      name: r'appThemeProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$appThemeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppTheme = AutoDisposeNotifier<ThemeMode>;
String _$appLanguageNotifierHash() =>
    r'10882d80b2ebdce0def49907b75ac8bd946baec8';

/// See also [AppLanguageNotifier].
@ProviderFor(AppLanguageNotifier)
final appLanguageNotifierProvider =
    AutoDisposeNotifierProvider<AppLanguageNotifier, AppLanguage>.internal(
      AppLanguageNotifier.new,
      name: r'appLanguageNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$appLanguageNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$AppLanguageNotifier = AutoDisposeNotifier<AppLanguage>;
String _$uiScaleNotifierHash() => r'c9be330a2643239bf400f3439c2a393ed3ab9f35';

/// See also [UiScaleNotifier].
@ProviderFor(UiScaleNotifier)
final uiScaleNotifierProvider =
    AutoDisposeNotifierProvider<UiScaleNotifier, double>.internal(
      UiScaleNotifier.new,
      name: r'uiScaleNotifierProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$uiScaleNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$UiScaleNotifier = AutoDisposeNotifier<double>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
