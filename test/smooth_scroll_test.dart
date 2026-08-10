import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizlone/services/smooth_scroll.dart';

/// Builds a scrollable list driven by a [SmoothScrollController] inside a
/// [MaterialApp] so pointer scroll events can be tested.
Widget _buildApp(SmoothScrollController controller) {
  return MaterialApp(
    home: Scaffold(
      body: ListView(
        controller: controller,
        children: List.generate(200, (i) => SizedBox(height: 50, child: Text('Item $i'))),
      ),
    ),
  );
}

void main() {
  testWidgets('pointerScroll scrolls instantly when smooth scroll is disabled', (
    tester,
  ) async {
    SmoothScrollController.enabledGlobally = false;
    final controller = SmoothScrollController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(_buildApp(controller));
    await tester.pump();

    final position = controller.position;
    final startPixels = position.pixels;
    position.pointerScroll(500);
    await tester.pump();

    // Without smooth scrolling the offset jumps immediately.
    expect(controller.offset, closeTo(startPixels + 500, 0.01));
  });

  testWidgets('pointerScroll animates toward the target when smooth scroll is enabled', (
    tester,
  ) async {
    SmoothScrollController.enabledGlobally = true;
    final controller = SmoothScrollController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(_buildApp(controller));
    await tester.pump();

    final startPixels = controller.position.pixels;
    controller.position.pointerScroll(500);

    // One frame in: the scroll is animating, so it has not reached the target yet.
    await tester.pump(const Duration(milliseconds: 50));
    expect(controller.offset, lessThan(startPixels + 500));

    // After the animation completes the target is reached.
    await tester.pumpAndSettle(const Duration(milliseconds: 200));
    expect(controller.offset, closeTo(startPixels + 500, 1.0));
  });
}
