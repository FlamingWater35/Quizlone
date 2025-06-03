import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/screens/main/mode_selection_screen.dart';

import '../../providers/core/navigation_provider.dart';
import '../modes/flashcard_screen.dart';
import '../modes/learn_screen.dart';
import '../modes/test_screen.dart';
import '../util/input_screen.dart';
import '../util/results_screen.dart';
import '../util/start_screen.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentScreen = ref.watch(currentScreenProvider);

    Widget screenWidget;
    switch (currentScreen) {
      case AppScreen.start:
        screenWidget = const StartScreen();
        break;
      case AppScreen.input:
        screenWidget = const InputScreen();
        break;
      case AppScreen.modeSelection:
        screenWidget = const ModeSelectionScreen();
        break;
      case AppScreen.flashcards:
        screenWidget = const FlashcardScreen();
        break;
      case AppScreen.test:
        screenWidget = const TestScreen();
        break;
      case AppScreen.results:
        screenWidget = const ResultsScreen();
        break;
      case AppScreen.learn:
        screenWidget = const LearnScreen();
        break;
    }

    return PageTransitionSwitcher(
      duration: Duration(milliseconds: 300),
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: KeyedSubtree(
        key: ValueKey<AppScreen>(currentScreen),
        child: screenWidget,
      ),
    );
  }
}
