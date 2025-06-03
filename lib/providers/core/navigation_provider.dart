import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_provider.g.dart';

enum AppScreen { start, input, modeSelection, flashcards, learn, test, results }

@riverpod
class CurrentScreen extends _$CurrentScreen {
  void goTo(AppScreen screen) {
    state = screen;
  }

  @override
  AppScreen build() => AppScreen.start;
}
