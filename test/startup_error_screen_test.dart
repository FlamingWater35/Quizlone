import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/main.dart';
import 'package:quizlone/providers/core/settings_provider.dart';

void main() {
  setUpAll(initLocaleSettings);

  testWidgets('startup error app renders its translated error screen', (
    tester,
  ) async {
    await tester.pumpWidget(
      const StartupErrorApp(errorMessage: 'PathAccessException: boom'),
    );
    await tester.pumpAndSettle();

    // Regression: this screen used to throw "Please wrap your app with
    // TranslationProvider" because it called Translations.of without the
    // provider, so users saw Flutter's red error box instead of the error.
    expect(tester.takeException(), isNull);
    expect(find.text('Critical Error During Startup'), findsOneWidget);
    expect(find.text('Please try restarting the app.'), findsOneWidget);
    expect(find.textContaining('PathAccessException: boom'), findsOneWidget);
  });
}
