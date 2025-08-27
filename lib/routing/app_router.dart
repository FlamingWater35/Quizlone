import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/main/controls_screen.dart';
import '../screens/main/mode_selection_screen.dart';
import '../screens/main/settings_screen.dart';
import '../screens/modes/flashcard_screen.dart';
import '../screens/modes/learn_screen.dart';
import '../screens/modes/test_screen.dart';
import '../screens/util/input_screen.dart';
import '../screens/util/results_screen.dart';
import '../screens/util/start_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: StartRoute.page, initial: true),
    AutoRoute(page: InputRoute.page),
    AutoRoute(page: ModeSelectionRoute.page),
    AutoRoute(page: FlashcardRoute.page),
    AutoRoute(page: LearnRoute.page),
    AutoRoute(page: TestModeRoute.page),
    AutoRoute(page: ResultsRoute.page),
    CustomRoute(
      page: SettingsRoute.page,
      transitionsBuilder: buildSidebarTransition,
    ),
    CustomRoute(
      page: ControlsRoute.page,
      transitionsBuilder: buildSidebarTransition,
    ),
  ];
}

Widget buildSidebarTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return CupertinoPageTransition(
    primaryRouteAnimation: animation,
    secondaryRouteAnimation: secondaryAnimation,
    linearTransition: false,
    child: child,
  );
}
