import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/providers/study/study_list_providers.dart';

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

class StudyModeGuard extends AutoRouteGuard {
  StudyModeGuard(this.ref);

  final WidgetRef ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final activeId = ref.read(activeStudyListIdProvider);

    if (activeId != null) {
      resolver.next(true);
    } else {
      router.replaceAll([const StartRoute()]);
    }
  }
}

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter(this.ref);

  final WidgetRef ref;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: StartRoute.page, initial: true),
    AutoRoute(page: InputRoute.page),
    AutoRoute(page: ModeSelectionRoute.page, guards: [StudyModeGuard(ref)]),
    AutoRoute(page: FlashcardRoute.page, guards: [StudyModeGuard(ref)]),
    AutoRoute(page: LearnRoute.page, guards: [StudyModeGuard(ref)]),
    AutoRoute(page: TestModeRoute.page, guards: [StudyModeGuard(ref)]),
    AutoRoute(page: ResultsRoute.page, guards: [StudyModeGuard(ref)]),
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
