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
  setUpAll(() {
    initLocaleSettings();
  });

  const listId = 'list-1';

  /// Regression test: with reduce motion on, the feedback box used to be an
  /// `AnimatedSize(duration: Duration.zero)`. Its controller completes
  /// synchronously and calls `markNeedsLayout()` on the render object from
  /// inside its own `performLayout`, which Flutter rejects with
  /// "A RenderAnimatedSize was mutated in its own performLayout
  /// implementation". The size change (empty SizedBox -> feedback Padding) is
  /// what triggers it, so submitting an answer is enough to reproduce.
  testWidgets(
    'learn feedback area lays out with reduce motion enabled',
    (tester) async {
      final fakeDb = FakeDatabaseService();
      fakeDb.settings['flashcardAnimationsDisabled'] = true;
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

      expect(find.byType(LearnScreen), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);

      // Submitting swaps the placeholder SizedBox for the feedback box — the
      // exact child-size change that used to restart the zero-duration
      // animation during layout.
      // Terms are shuffled, so answer whatever question was dealt.
      final questionText = tester
          .widgetList<Text>(find.byType(Text))
          .map((w) => w.data)
          .whereType<String>()
          .firstWhere(
            (s) =>
                fakeDb.studyLists[listId]!.terms.any((t) => t.definitionText == s),
          );
      final expected = fakeDb.studyLists[listId]!.terms
          .firstWhere((t) => t.definitionText == questionText)
          .termText;

      await tester.enterText(find.byType(TextField), expected);
      await tester.pump();
      await tester.tap(find.widgetWithText(FilledButton, 'Submit'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(tester.takeException(), isNull);
      expect(find.text(t.learnScreen.feedback.correct), findsOneWidget);

      // Flush the controller's auto-advance timer so the test doesn't finish
      // with it still pending.
      await tester.pump(const Duration(milliseconds: 2000));
      expect(tester.takeException(), isNull);
    },
  );
}
