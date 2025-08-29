import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../screens/main/about_screen.dart';
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
    CustomRoute(
      page: InputRoute.page,
      transitionsBuilder: buildSlideDownTransition,
    ),
    AutoRoute(page: ModeSelectionRoute.page),
    AutoRoute(page: FlashcardRoute.page),
    AutoRoute(page: LearnRoute.page),
    AutoRoute(page: TestModeRoute.page),
    AutoRoute(page: ResultsRoute.page),
    AutoRoute(page: AboutRoute.page),
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

Widget buildSlideDownTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  const begin = Offset(0.0, -1.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end);
  final curvedAnimation = CurvedAnimation(
    parent: animation,
    curve: Curves.easeInOut,
  );

  return SlideTransition(
    position: tween.animate(curvedAnimation),
    child: child,
  );
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
