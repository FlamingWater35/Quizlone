import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../models/match_record.dart';
import '../screens/main/about_screen.dart';
import '../screens/main/controls_screen.dart';
import '../screens/main/mode_selection_screen.dart';
import '../screens/main/settings_screen.dart';
import '../screens/modes/flashcard_screen.dart';
import '../screens/modes/learn_screen.dart';
import '../screens/modes/match_leaderboard_screen.dart';
import '../screens/modes/match_screen.dart';
import '../screens/modes/multiple_choice_screen.dart';
import '../screens/modes/test_screen.dart';
import '../screens/util/input_screen.dart';
import '../screens/util/load_list_screen.dart';
import '../screens/util/results_screen.dart';
import '../screens/util/start_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: StartRoute.page, initial: true),

    AutoRoute(page: LoadListRoute.page, path: '/load-list'),

    CustomRoute(
      page: InputRoute.page,
      path: '/create-list',
      transitionsBuilder: buildSlideDownTransition,
    ),

    AutoRoute(page: ModeSelectionRoute.page, path: '/mode-selection'),
    AutoRoute(page: FlashcardRoute.page, path: '/flashcards'),
    AutoRoute(page: LearnRoute.page, path: '/learn'),
    AutoRoute(page: TestModeRoute.page, path: '/test'),
    AutoRoute(page: MatchRoute.page, path: '/match'),
    AutoRoute(page: MultipleChoiceRoute.page, path: '/multiple-choice'),
    AutoRoute(page: MatchLeaderboardRoute.page, path: '/leaderboard'),
    AutoRoute(page: ResultsRoute.page, path: '/results'),
    AutoRoute(page: AboutRoute.page, path: '/about'),

    CustomRoute(
      page: SettingsRoute.page,
      path: '/settings',
      transitionsBuilder: buildSidebarTransition,
    ),

    CustomRoute(
      page: ControlsRoute.page,
      path: '/controls',
      transitionsBuilder: buildSidebarTransition,
    ),
  ];
}

class DeepLinkResolver {
  DeepLinkResolver._();

  static final List<_DeepLinkEntry> _entries = [
    _DeepLinkEntry(
      path: '/multiple-choice',
      stack: [StartRoute(), ModeSelectionRoute(), MultipleChoiceRoute()],
      requiresActiveList: true,
    ),
    _DeepLinkEntry(
      path: '/mode-selection',
      stack: [StartRoute(), ModeSelectionRoute()],
      requiresActiveList: true,
    ),
    _DeepLinkEntry(
      path: '/flashcards',
      stack: [StartRoute(), ModeSelectionRoute(), FlashcardRoute()],
      requiresActiveList: true,
    ),
    _DeepLinkEntry(
      path: '/learn',
      stack: [StartRoute(), ModeSelectionRoute(), LearnRoute()],
      requiresActiveList: true,
    ),
    _DeepLinkEntry(
      path: '/test',
      stack: [StartRoute(), ModeSelectionRoute(), TestModeRoute()],
      requiresActiveList: true,
    ),
    _DeepLinkEntry(
      path: '/match',
      stack: [StartRoute(), ModeSelectionRoute(), MatchRoute()],
      requiresActiveList: true,
    ),
    _DeepLinkEntry(
      path: '/results',
      stack: [StartRoute(), ModeSelectionRoute(), ResultsRoute()],
      requiresActiveList: true,
    ),
    _DeepLinkEntry(
      path: '/leaderboard',
      stack: [StartRoute(), ModeSelectionRoute(), MatchLeaderboardRoute()],
      requiresActiveList: true,
    ),
    _DeepLinkEntry(
      path: '/settings',
      stack: [StartRoute(), SettingsRoute()],
      requiresActiveList: false,
    ),
    _DeepLinkEntry(
      path: '/controls',
      stack: [StartRoute(), ControlsRoute()],
      requiresActiveList: false,
    ),
    _DeepLinkEntry(
      path: '/about',
      stack: [StartRoute(), AboutRoute()],
      requiresActiveList: false,
    ),
    _DeepLinkEntry(
      path: '/create-list',
      stack: [StartRoute(), InputRoute()],
      requiresActiveList: false,
    ),
    _DeepLinkEntry(
      path: '/load-list',
      stack: [StartRoute(), LoadListRoute()],
      requiresActiveList: false,
    ),
  ];

  static DeepLink resolve(String path, {String? activeListId}) {
    for (final entry in _entries) {
      if (path == entry.path || path.startsWith('${entry.path}/')) {
        if (entry.requiresActiveList && activeListId == null) {
          return DeepLink([StartRoute()]);
        }
        return DeepLink(entry.stack);
      }
    }

    return DeepLink([StartRoute()]);
  }
}

class _DeepLinkEntry {
  const _DeepLinkEntry({
    required this.path,
    required this.stack,
    required this.requiresActiveList,
  });

  final String path;
  final bool requiresActiveList;
  final List<PageRouteInfo> stack;
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
