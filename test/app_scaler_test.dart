import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/widgets/app_scaler.dart';

void main() {
  /// Wraps [child] in an ambient MediaQuery. Deliberately avoids MaterialApp:
  /// its root `View` installs its own MediaQuery that would shadow ours.
  Widget wrap(Widget child, double ambientScale) {
    return MediaQuery(
      data: MediaQueryData(
        size: const Size(800, 600),
        textScaler: TextScaler.linear(ambientScale),
      ),
      child: child,
    );
  }

  testWidgets('preserves system text scaler when followSystemScale is true', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(
        AppScaler(
          scale: 1.2, // force the scaling path
          followSystemScale: true,
          child: Builder(
            builder: (context) {
              final scaler = MediaQuery.of(context).textScaler;
              expect(scaler, TextScaler.linear(1.5));
              return const SizedBox();
            },
          ),
        ),
        1.5,
      ),
    );
  });

  testWidgets('discards system text scaler when followSystemScale is false', (
    tester,
  ) async {
    await tester.pumpWidget(
      wrap(
        AppScaler(
          scale: 1.2,
          followSystemScale: false,
          child: Builder(
            builder: (context) {
              final scaler = MediaQuery.of(context).textScaler;
              expect(scaler, TextScaler.noScaling);
              return const SizedBox();
            },
          ),
        ),
        1.5,
      ),
    );
  });

  testWidgets('scale==1.0 fast path returns child untouched', (tester) async {
    await tester.pumpWidget(
      wrap(
        AppScaler(
          scale: 1.0,
          followSystemScale: false, // should be ignored on fast path
          child: Builder(
            builder: (context) {
              // Fast path returns child directly -> ambient scaler survives.
              expect(MediaQuery.of(context).textScaler, TextScaler.linear(1.5));
              return const SizedBox();
            },
          ),
        ),
        1.5,
      ),
    );
  });
}
