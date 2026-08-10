import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/models/enums/enums.dart';
import 'package:quizlone/providers/study/study_list_providers.dart';
import 'package:quizlone/providers/study/study_options_provider.dart';

import 'fake_database_service.dart';

/// Builds a [ProviderContainer] backed by a [FakeDatabaseService] with the
/// active list id and study options overridden so controller behavior is
/// deterministic across tests.
ProviderContainer createControllerContainer({
  required FakeDatabaseService db,
  String? activeListId,
  StudyQuestionType askWith = StudyQuestionType.definition,
  TestFormat testFormat = TestFormat.written,
  int? studyLength,
  bool allowSubstring = false,
  FlashcardStartSide startSide = FlashcardStartSide.term,
}) {
  return ProviderContainer(
    overrides: [
      FakeDatabaseService.asOverride(db),
      activeStudyListIdProvider.overrideWithValue(activeListId),
      studyAskWithProvider.overrideWithValue(askWith),
      testQuestionFormatProvider.overrideWithValue(testFormat),
      studyLengthProvider.overrideWithValue(studyLength),
      allowAnswerSubstringProvider.overrideWithValue(allowSubstring),
      flashcardStartWithProvider.overrideWithValue(startSide),
    ],
  );
}

/// Awaits the value of an autoDispose async provider while keeping it alive.
///
/// Reading an autoDispose provider via `container.read(...future)` creates a
/// temporary subscription that is closed immediately, which can dispose the
/// provider while its (async) build is still in flight. Holding a real
/// subscription (until [ProviderContainer.dispose]) avoids that race and keeps
/// the provider alive so later notifier calls operate on the same instance.
Future<T> awaitProviderValue<T>(ProviderContainer container, Object provider) async {
  container.listen(provider as dynamic, (_, _) {});
  // Keep a live subscription (see doc comment) and await the provider's future.
  return await container.read((provider as dynamic).future) as T;
}
