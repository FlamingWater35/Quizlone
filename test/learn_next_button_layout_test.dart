import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/providers/core/auth_provider.dart';
import 'package:quizlone/providers/core/settings_provider.dart';
import 'package:quizlone/screens/modes/learn_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'helpers/fake_database_service.dart';
import 'helpers/test_data.dart';

void main() {
  setUpAll(initLocaleSettings);

  const listId = 'list-1';

  Future<FakeDatabaseService> boot(WidgetTester tester) async {
    final fakeDb = FakeDatabaseService();
    fakeDb.settings['autoAdvanceEnabled'] = false;
    fakeDb.studyLists[listId] = listWithTerms('Learn List', [
      term('Apple', 'A fruit'),
      term('Banana', 'A yellow fruit'),
    ], id: listId);
    await fakeDb.saveActiveListId(listId);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          FakeDatabaseService.asOverride(fakeDb),
          authControllerProvider.overrideWithValue(AsyncData<User?>(null)),
        ],
        child: TranslationProvider(
          child: const MaterialApp(home: LearnScreen()),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return fakeDb;
  }

  Future<void> answerCorrectly(
    WidgetTester tester,
    FakeDatabaseService db,
  ) async {
    final questionText = tester
        .widgetList<Text>(find.byType(Text))
        .map((w) => w.data)
        .whereType<String>()
        .firstWhere(
          (s) => db.studyLists[listId]!.terms.any((t) => t.definitionText == s),
        );
    final expected = db.studyLists[listId]!.terms
        .firstWhere((t) => t.definitionText == questionText)
        .termText;
    await tester.enterText(find.byType(TextField), expected);
    await tester.pump();
    await tester.tap(find.widgetWithText(FilledButton, 'Submit'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
  }

  testWidgets('Next matches Submit in width, height and horizontal position', (
    tester,
  ) async {
    final db = await boot(tester);

    final submitFinder = find.widgetWithText(FilledButton, t.general.submit);
    expect(submitFinder, findsOneWidget);
    final submitRect = tester.getRect(submitFinder);

    await answerCorrectly(tester, db);

    final nextFinder = find.widgetWithText(FilledButton, t.general.next);
    expect(nextFinder, findsOneWidget);
    final nextRect = tester.getRect(nextFinder);

    expect(
      nextRect.width,
      moreOrLessEquals(submitRect.width, epsilon: 0.5),
      reason: 'Next must be as wide as Submit',
    );
    expect(
      nextRect.height,
      moreOrLessEquals(submitRect.height, epsilon: 0.5),
      reason: 'Next must be as tall as Submit',
    );
    expect(
      nextRect.left,
      moreOrLessEquals(submitRect.left, epsilon: 0.5),
      reason: 'Next must start at the same horizontal offset as Submit',
    );
    expect(
      nextRect.right,
      moreOrLessEquals(submitRect.right, epsilon: 0.5),
      reason: 'Next must end at the same horizontal offset as Submit',
    );

    // Flush the pending focus timer so the test tears down cleanly.
    await tester.pump(const Duration(milliseconds: 500));
    expect(tester.takeException(), isNull);
  });
}
