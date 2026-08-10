import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/widgets/app_scaler.dart';
import 'package:quizlone/widgets/error_snackbar.dart';

void main() {
  group('AppScaler', () {
    testWidgets('returns the child unchanged at scale 1.0', (tester) async {
      const child = Text('hello');
      await tester.pumpWidget(const MaterialApp(home: AppScaler(scale: 1.0, child: child)));

      expect(find.text('hello'), findsOneWidget);
      expect(find.byType(FittedBox), findsNothing);
    });

    testWidgets('wraps the child in a FittedBox at other scales', (tester) async {
      const child = Text('hello');
      await tester.pumpWidget(const MaterialApp(home: AppScaler(scale: 1.5, child: child)));

      expect(find.text('hello'), findsOneWidget);
      expect(find.byType(FittedBox), findsOneWidget);
    });
  });

  group('showErrorSnackBar', () {
    Future<void> pumpSnackbar(WidgetTester tester) async {
      final messengerKey = GlobalKey<ScaffoldMessengerState>();
      await tester.pumpWidget(
        MaterialApp(
          scaffoldMessengerKey: messengerKey,
          home: Builder(
            builder: (context) => Scaffold(
              body: ElevatedButton(
                onPressed: () =>
                    showErrorSnackBar(context, message: 'Something failed'),
                child: const Text('trigger'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('trigger'));
      await tester.pump();
    }

    testWidgets('shows a snackbar with the error message and icon', (tester) async {
      await pumpSnackbar(tester);

      expect(find.text('Something failed'), findsOneWidget);
      expect(find.byIcon(Icons.error_outline), findsOneWidget);
    });

    testWidgets('renders in dark mode as well', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData.dark(),
          home: Builder(
            builder: (context) => Scaffold(
              body: ElevatedButton(
                onPressed: () => showErrorSnackBar(context, message: 'Dark error'),
                child: const Text('trigger'),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.text('trigger'));
      await tester.pump();

      expect(find.text('Dark error'), findsOneWidget);
    });
  });
}
