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

/// UI-level coverage for the `autoAdvanceEnabled` setting in learn mode.
///
/// The controller tests in `learn_controller_test.dart` assert the state
/// machine; these assert what the user actually sees — whether the "Next"
/// button is on screen and whether the screen moves on by itself.
void main() {
  setUpAll(() {
    initLocaleSettings();
  });

  const listId = 'list-1';

  Future<FakeDatabaseService> boot(
    WidgetTester tester, {
    required bool autoAdvance,
  }) async {
    final fakeDb = FakeDatabaseService();
    fakeDb.settings['autoAdvanceEnabled'] = autoAdvance;
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

  /// Answers whichever term was dealt correctly (the set is shuffled).
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

  testWidgets('with auto-advance on, no Next button appears and the screen '
      'moves on by itself', (tester) async {
    final db = await boot(tester, autoAdvance: true);
    await answerCorrectly(tester, db);

    final submit = find.widgetWithText(FilledButton, t.general.submit);
    final next = find.widgetWithText(FilledButton, t.general.next);

    expect(
      next,
      findsNothing,
      reason: 'Next must stay hidden while auto-advance is on',
    );
    // The feedback is on screen. (The Submit button is still mid-fade-out via
    // AnimatedSwitcher here, so it is only asserted gone once that settles.)
    expect(find.text(t.learnScreen.feedback.correct), findsOneWidget);

    // Still showing feedback just before the default 1500ms delay elapses.
    await tester.pump(const Duration(milliseconds: 1000));
    expect(
      submit,
      findsNothing,
      reason: 'must not advance before the configured delay',
    );

    // Past the delay the next question is dealt, so Submit is back.
    await tester.pump(const Duration(milliseconds: 700));
    await tester.pump(const Duration(milliseconds: 500));
    expect(
      submit,
      findsOneWidget,
      reason: 'auto-advance should have dealt the next question',
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('with auto-advance off, the feedback waits for Next', (
    tester,
  ) async {
    final db = await boot(tester, autoAdvance: false);
    await answerCorrectly(tester, db);

    final submit = find.widgetWithText(FilledButton, t.general.submit);
    final next = find.widgetWithText(FilledButton, t.general.next);

    expect(
      next,
      findsOneWidget,
      reason: 'Next must be visible when auto-advance is off',
    );

    // Well past the delay: nothing happens on its own.
    await tester.pump(const Duration(seconds: 3));
    expect(
      next,
      findsOneWidget,
      reason: 'feedback must be held until the user taps Next',
    );
    expect(submit, findsNothing);

    await tester.tap(next);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));
    expect(
      submit,
      findsOneWidget,
      reason: 'tapping Next should deal the next question',
    );
    expect(tester.takeException(), isNull);
  });
}
