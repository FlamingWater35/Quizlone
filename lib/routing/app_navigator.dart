import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/models/match_record.dart';
import 'package:quizlone/providers/study/study_list_providers.dart';
import 'package:quizlone/routing/app_router.dart';

class AppNavigator {
  AppNavigator._();

  static void goBack(BuildContext context, {PageRouteInfo? fallback}) {
    final router = context.router;
    if (router.canPop()) {
      router.maybePop();
    } else {
      router.replace(fallback ?? const StartRoute());
    }
  }

  static void navigateHome(BuildContext context) {
    final router = context.router;
    if (router.canPop()) {
      router.popUntilRoot();
    } else {
      router.replace(const StartRoute());
    }
  }

  static void pushModeSelection(BuildContext context) {
    context.router.push(const ModeSelectionRoute());
  }

  static void returnToModeSelection(BuildContext context) {
    final router = context.router;
    router.popUntil(
      (route) =>
          route.settings.name == ModeSelectionRoute.name || route.isFirst,
    );
    if (router.current.name != ModeSelectionRoute.name) {
      router.replace(const ModeSelectionRoute());
    }
  }

  static void pushFlashcards(BuildContext context) {
    context.router.push(const FlashcardRoute());
  }

  static void pushLearn(BuildContext context) {
    context.router.push(const LearnRoute());
  }

  static void pushTest(BuildContext context) {
    context.router.push(const TestModeRoute());
  }

  static void pushMatch(BuildContext context) {
    context.router.push(const MatchRoute());
  }

  static void pushMultipleChoice(BuildContext context) {
    context.router.push(const MultipleChoiceRoute());
  }

  static void replaceWithResults(BuildContext context) {
    context.router.replace(const ResultsRoute());
  }

  static void replaceWithMatchLeaderboard(
    BuildContext context, {
    MatchRecord? newRecord,
  }) {
    context.router.replace(MatchLeaderboardRoute(newRecord: newRecord));
  }

  static void pushCreateList(BuildContext context, WidgetRef ref) {
    ref.invalidate(studyListFormProvider);
    context.router.push(const InputRoute());
  }

  static void pushLoadList(BuildContext context) {
    context.router.push(const LoadListRoute());
  }

  static void replaceWithModeSelection(BuildContext context) {
    context.router.replace(const ModeSelectionRoute());
  }

  static void pushSettings(BuildContext context) {
    context.router.push(const SettingsRoute());
  }

  static void pushControls(BuildContext context) {
    context.router.push(const ControlsRoute());
  }

  static void pushAbout(BuildContext context) {
    context.router.push(const AboutRoute());
  }
}
