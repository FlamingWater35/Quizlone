import 'package:flutter/material.dart' as legacy;
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart' as modern;
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/main.dart';
import 'package:quizlone/providers/core/auth_provider.dart';
import 'package:quizlone/providers/core/settings_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'helpers/fake_database_service.dart';

/// Guards the dark-mode white-flash fix.
///
/// Flutter 3.47 moved Material into `package:material_ui`, and auto_route
/// navigates with that package. Its `Theme.of` is a different inherited widget
/// than `flutter/material.dart`'s, so a `MaterialApp` theme alone leaves the
/// router looking at `ThemeData.fallback()` — a *light* theme. The desktop zoom
/// transition paints its scrim in `colorScheme.surface`, so on a dark app that
/// fallback produced a near-white wash over the page.
///
/// The app now installs a matching `material_ui` theme above the navigator.
void main() {
  setUpAll(initLocaleSettings);

  Widget buildApp() {
    return ProviderScope(
      overrides: [
        FakeDatabaseService.asOverride(FakeDatabaseService()),
        authControllerProvider.overrideWithValue(AsyncData<User?>(null)),
        appThemeProvider.overrideWith(_DarkTheme.new),
      ],
      child: TranslationProvider(child: const MyApp()),
    );
  }

  testWidgets('the router sees the app dark theme, not a light fallback', (
    tester,
  ) async {
    await tester.pumpWidget(buildApp());
    await tester.pumpAndSettle();
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    final context = tester.element(find.byType(legacy.Scaffold).first);
    final appTheme = legacy.Theme.of(context);
    final routerTheme = modern.Theme.of(context);

    expect(appTheme.brightness, legacy.Brightness.dark);
    expect(
      routerTheme.brightness,
      modern.Brightness.dark,
      reason:
          'the router is on a light fallback theme, which is what painted a '
          'white scrim during desktop transitions',
    );
    expect(
      routerTheme.colorScheme.surface,
      appTheme.colorScheme.surface,
      reason: 'the transition scrim must use the app surface colour',
    );
  });

  test('the mirrored theme never lets a transition snapshot a page', () {
    final source = legacy.ThemeData(
      colorScheme: legacy.ColorScheme.fromSeed(
        seedColor: legacy.Colors.deepPurple,
        brightness: legacy.Brightness.dark,
      ),
    );
    final builders = buildModernTheme(source).pageTransitionsTheme.builders;

    for (final platform in [TargetPlatform.windows, TargetPlatform.linux]) {
      final builder = builders[platform];
      expect(
        builder,
        isA<modern.ZoomPageTransitionsBuilder>(),
        reason: '$platform should keep the zoom transition',
      );
      final zoom = builder! as modern.ZoomPageTransitionsBuilder;
      expect(
        zoom.allowSnapshotting,
        isFalse,
        reason: 'a blank snapshot is what renders as a white flash',
      );
      expect(zoom.allowEnterRouteSnapshotting, isFalse);
    }
  });
}

class _DarkTheme extends AppTheme {
  @override
  legacy.ThemeMode build() => legacy.ThemeMode.dark;
}
