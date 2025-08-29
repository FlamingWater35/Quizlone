// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AboutScreen]
class AboutRoute extends PageRouteInfo<void> {
  const AboutRoute({List<PageRouteInfo>? children})
    : super(AboutRoute.name, initialChildren: children);

  static const String name = 'AboutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AboutScreen();
    },
  );
}

/// generated route for
/// [ControlsScreen]
class ControlsRoute extends PageRouteInfo<void> {
  const ControlsRoute({List<PageRouteInfo>? children})
    : super(ControlsRoute.name, initialChildren: children);

  static const String name = 'ControlsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ControlsScreen();
    },
  );
}

/// generated route for
/// [FlashcardScreen]
class FlashcardRoute extends PageRouteInfo<void> {
  const FlashcardRoute({List<PageRouteInfo>? children})
    : super(FlashcardRoute.name, initialChildren: children);

  static const String name = 'FlashcardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FlashcardScreen();
    },
  );
}

/// generated route for
/// [InputScreen]
class InputRoute extends PageRouteInfo<void> {
  const InputRoute({List<PageRouteInfo>? children})
    : super(InputRoute.name, initialChildren: children);

  static const String name = 'InputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InputScreen();
    },
  );
}

/// generated route for
/// [LearnScreen]
class LearnRoute extends PageRouteInfo<void> {
  const LearnRoute({List<PageRouteInfo>? children})
    : super(LearnRoute.name, initialChildren: children);

  static const String name = 'LearnRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LearnScreen();
    },
  );
}

/// generated route for
/// [MatchLeaderboardScreen]
class MatchLeaderboardRoute extends PageRouteInfo<MatchLeaderboardRouteArgs> {
  MatchLeaderboardRoute({
    required String studyListName,
    required DateTime newRecordCreatedAt,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
         MatchLeaderboardRoute.name,
         args: MatchLeaderboardRouteArgs(
           studyListName: studyListName,
           newRecordCreatedAt: newRecordCreatedAt,
           key: key,
         ),
         initialChildren: children,
       );

  static const String name = 'MatchLeaderboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MatchLeaderboardRouteArgs>();
      return MatchLeaderboardScreen(
        studyListName: args.studyListName,
        newRecordCreatedAt: args.newRecordCreatedAt,
        key: args.key,
      );
    },
  );
}

class MatchLeaderboardRouteArgs {
  const MatchLeaderboardRouteArgs({
    required this.studyListName,
    required this.newRecordCreatedAt,
    this.key,
  });

  final String studyListName;

  final DateTime newRecordCreatedAt;

  final Key? key;

  @override
  String toString() {
    return 'MatchLeaderboardRouteArgs{studyListName: $studyListName, newRecordCreatedAt: $newRecordCreatedAt, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MatchLeaderboardRouteArgs) return false;
    return studyListName == other.studyListName &&
        newRecordCreatedAt == other.newRecordCreatedAt &&
        key == other.key;
  }

  @override
  int get hashCode =>
      studyListName.hashCode ^ newRecordCreatedAt.hashCode ^ key.hashCode;
}

/// generated route for
/// [MatchScreen]
class MatchRoute extends PageRouteInfo<void> {
  const MatchRoute({List<PageRouteInfo>? children})
    : super(MatchRoute.name, initialChildren: children);

  static const String name = 'MatchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MatchScreen();
    },
  );
}

/// generated route for
/// [ModeSelectionScreen]
class ModeSelectionRoute extends PageRouteInfo<void> {
  const ModeSelectionRoute({List<PageRouteInfo>? children})
    : super(ModeSelectionRoute.name, initialChildren: children);

  static const String name = 'ModeSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ModeSelectionScreen();
    },
  );
}

/// generated route for
/// [ResultsScreen]
class ResultsRoute extends PageRouteInfo<void> {
  const ResultsRoute({List<PageRouteInfo>? children})
    : super(ResultsRoute.name, initialChildren: children);

  static const String name = 'ResultsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResultsScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [StartScreen]
class StartRoute extends PageRouteInfo<void> {
  const StartRoute({List<PageRouteInfo>? children})
    : super(StartRoute.name, initialChildren: children);

  static const String name = 'StartRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const StartScreen();
    },
  );
}

/// generated route for
/// [TestScreen]
class TestModeRoute extends PageRouteInfo<void> {
  const TestModeRoute({List<PageRouteInfo>? children})
    : super(TestModeRoute.name, initialChildren: children);

  static const String name = 'TestModeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TestScreen();
    },
  );
}
