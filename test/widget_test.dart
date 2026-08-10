import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/main.dart';
import 'package:quizlone/providers/core/auth_provider.dart';
import 'package:quizlone/providers/core/settings_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'helpers/fake_database_service.dart';

void main() {
  setUpAll(() {
    initLocaleSettings();
  });

  testWidgets('app boots to the start screen', (tester) async {
    final fakeDb = FakeDatabaseService();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          FakeDatabaseService.asOverride(fakeDb),
          // Auth depends on Supabase, which cannot be initialized in a unit
          // test. Overriding with "signed out" exercises the same UI path.
          authControllerProvider.overrideWithValue(AsyncData<User?>(null)),
        ],
        child: TranslationProvider(child: const MyApp()),
      ),
    );
    await tester.pumpAndSettle();

    // Start screen content is visible.
    expect(find.text('Welcome!'), findsOneWidget);
    expect(find.text('Create New List'), findsOneWidget);
    expect(find.text('Open Saved List'), findsOneWidget);
    expect(find.text('Quizlone'), findsWidgets);
  });
}
