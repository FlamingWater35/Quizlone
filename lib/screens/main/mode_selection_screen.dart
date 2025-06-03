import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import '../../models/enums/enums.dart';
import '../../models/study_list.dart';
import '../../providers/core/navigation_provider.dart';
import '../../providers/study/study_list_providers.dart';
import '../../providers/study/study_options_provider.dart';

final _log = Logger("ModeSelectionScreen");

class ModeSelectionScreen extends ConsumerWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeId = ref.watch(activeStudyListIdProvider);
    _log.fine(
      "ModeSelectionScreen build: activeStudyListIdProvider is $activeId",
    );
    final activeStudyListAsync = ref.watch(activeStudyListProvider);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final fcStartWith = ref.watch(flashcardStartWithProvider);
    final studyAskWith = ref.watch(studyAskWithProvider);
    final studyLength = ref.watch(studyLengthProvider);
    final testFormat = ref.watch(testQuestionFormatProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("3. Options & Mode"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: activeStudyListAsync.when(
          data: (StudyList? list) {
            if (list == null) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "No active study list found or list could not be loaded.",
                    ),
                    const SizedBox(height: 10),
                    Text("Debug: Current Active ID is $activeId"),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(activeStudyListIdProvider.notifier).set(null);
                        ref
                            .read(currentScreenProvider.notifier)
                            .goTo(AppScreen.start);
                      },
                      child: const Text("Go to Start Screen"),
                    ),
                  ],
                ),
              );
            }

            final int totalTerms = list.terms.length;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "${list.terms.length} term${list.terms.length == 1 ? '' : 's'} loaded from \"${list.name}\".",
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),

                  _OptionGroup(
                    title: "Flashcard Options",
                    children: [
                      RadioListTile<FlashcardStartSide>(
                        title: const Text("Show Term First"),
                        value: FlashcardStartSide.term,
                        groupValue: fcStartWith,
                        onChanged:
                            (value) => ref
                                .read(flashcardStartWithProvider.notifier)
                                .set(value!),
                      ),
                      RadioListTile<FlashcardStartSide>(
                        title: const Text("Show Definition First"),
                        value: FlashcardStartSide.definition,
                        groupValue: fcStartWith,
                        onChanged:
                            (value) => ref
                                .read(flashcardStartWithProvider.notifier)
                                .set(value!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  _OptionGroup(
                    title: "Study Options",
                    children: [
                      RadioListTile<StudyQuestionType>(
                        title: const Text("Show Definition, Ask for Term"),
                        value: StudyQuestionType.definition,
                        groupValue: studyAskWith,
                        onChanged:
                            (value) => ref
                                .read(studyAskWithProvider.notifier)
                                .set(value!),
                      ),
                      RadioListTile<StudyQuestionType>(
                        title: const Text("Show Term, Ask for Definition"),
                        value: StudyQuestionType.term,
                        groupValue: studyAskWith,
                        onChanged:
                            (value) => ref
                                .read(studyAskWithProvider.notifier)
                                .set(value!),
                      ),
                      const Divider(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          children: [
                            const Text("Study Length: "),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 80,
                              child: TextFormField(
                                initialValue: studyLength?.toString() ?? '',
                                decoration: InputDecoration(
                                  hintText: "All",
                                  border: const OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  isDense: true,
                                  suffixText:
                                      totalTerms > 0 ? "/ $totalTerms" : null,
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                onChanged: (value) {
                                  final intVal = int.tryParse(value);
                                  if (value.isEmpty || intVal == null) {
                                    ref
                                        .read(studyLengthProvider.notifier)
                                        .clear();
                                  } else if (intVal > totalTerms &&
                                      totalTerms > 0) {
                                    ref
                                        .read(studyLengthProvider.notifier)
                                        .set(totalTerms);
                                    // Consider updating the text field value here if it gets clamped
                                  } else {
                                    ref
                                        .read(studyLengthProvider.notifier)
                                        .set(intVal);
                                  }
                                },
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                "(For Learn & Test modes)",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("Test Format", style: textTheme.titleSmall),
                      ),
                      RadioListTile<TestFormat>(
                        title: const Text("Written Answer"),
                        value: TestFormat.written,
                        groupValue: testFormat,
                        onChanged:
                            (value) => ref
                                .read(testQuestionFormatProvider.notifier)
                                .set(value!),
                      ),
                      RadioListTile<TestFormat>(
                        title: const Text("Multiple Choice (4 options)"),
                        value: TestFormat.mc,
                        groupValue: testFormat,
                        onChanged:
                            (value) => ref
                                .read(testQuestionFormatProvider.notifier)
                                .set(value!),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(currentScreenProvider.notifier)
                              .goTo(AppScreen.flashcards);
                        },
                        child: const Text("Flashcards"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(currentScreenProvider.notifier)
                              .goTo(AppScreen.learn);
                        },
                        child: const Text("Learn"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(currentScreenProvider.notifier)
                              .goTo(AppScreen.test);
                        },
                        child: const Text("Test"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        ref.read(activeStudyListIdProvider.notifier).set(null);
                        ref
                            .read(currentScreenProvider.notifier)
                            .goTo(AppScreen.start);
                      },
                      child: const Text("Change List / Go to Start"),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error:
              (err, stack) => Center(child: Text("Error loading list: $err")),
        ),
      ),
    );
  }
}

class _OptionGroup extends StatelessWidget {
  const _OptionGroup({required this.title, required this.children});

  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 4.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }
}
