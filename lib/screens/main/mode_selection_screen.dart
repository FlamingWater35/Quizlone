import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../models/enums/enums.dart';
import '../../models/study_list.dart';
import '../../providers/study/study_list_providers.dart';
import '../../providers/study/study_options_provider.dart';
import '../../widgets/centered_view.dart';

final _log = Logger("ModeSelectionScreen");

@RoutePage()
class ModeSelectionScreen extends ConsumerWidget {
  const ModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeId = ref.watch(activeStudyListIdProvider);
    final t = Translations.of(context);
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
    final roundedShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(t.modeSelectionScreen.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: activeStudyListAsync.when(
          data: (StudyList? list) {
            if (list == null) {
              return Center(
                child: CenteredView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          t.modeSelectionScreen.noActiveList,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          t.modeSelectionScreen.debugActiveId(
                            id: activeId ?? 'null',
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(activeStudyListIdProvider.notifier)
                                .set(null);
                            context.router.replace(const StartRoute());
                          },
                          child: Text(t.modeSelectionScreen.returnToWelcome),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            final int totalTerms = list.terms.length;

            return CenteredView(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      list.name,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      t.startScreen.termCount(count: list.terms.length),
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    _OptionGroup(
                      title: t.modeSelectionScreen.flashcardOptions,
                      children: [
                        RadioListTile<FlashcardStartSide>(
                          shape: roundedShape,
                          title: Text(t.modeSelectionScreen.showTermFirst),
                          value: FlashcardStartSide.term,
                          groupValue: fcStartWith,
                          onChanged:
                              (value) => ref
                                  .read(flashcardStartWithProvider.notifier)
                                  .set(value!),
                        ),
                        RadioListTile<FlashcardStartSide>(
                          shape: roundedShape,
                          title: Text(t.modeSelectionScreen.showDefFirst),
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
                      title: t.modeSelectionScreen.studyOptions,
                      children: [
                        RadioListTile<StudyQuestionType>(
                          shape: roundedShape,
                          title: Text(t.modeSelectionScreen.askForTerm),
                          value: StudyQuestionType.definition,
                          groupValue: studyAskWith,
                          onChanged:
                              (value) => ref
                                  .read(studyAskWithProvider.notifier)
                                  .set(value!),
                        ),
                        RadioListTile<StudyQuestionType>(
                          shape: roundedShape,
                          title: Text(t.modeSelectionScreen.askForDef),
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
                              Text(t.modeSelectionScreen.studyLength),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 80,
                                child: TextFormField(
                                  initialValue: studyLength?.toString() ?? '',
                                  decoration: InputDecoration(
                                    hintText: t.general.all,
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
                                    } else {
                                      ref
                                          .read(studyLengthProvider.notifier)
                                          .set(intVal);
                                    }
                                  },
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            t.modeSelectionScreen.testFormat,
                            style: textTheme.titleSmall,
                          ),
                        ),
                        const SizedBox(height: 4),
                        RadioListTile<TestFormat>(
                          shape: roundedShape,
                          title: Text(t.modeSelectionScreen.writtenAnswer),
                          value: TestFormat.written,
                          groupValue: testFormat,
                          onChanged:
                              (value) => ref
                                  .read(testQuestionFormatProvider.notifier)
                                  .set(value!),
                        ),
                        RadioListTile<TestFormat>(
                          shape: roundedShape,
                          title: Text(t.modeSelectionScreen.multipleChoice),
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

                    ...[
                      (
                        label: t.modeSelectionScreen.flashcards,
                        icon: Icons.style,
                        route: const FlashcardRoute(),
                      ),
                      (
                        label: t.modeSelectionScreen.learn,
                        icon: Icons.school,
                        route: const LearnRoute(),
                      ),
                      (
                        label: t.modeSelectionScreen.test,
                        icon: Icons.quiz,
                        route: const TestModeRoute(),
                      ),
                    ].map((mode) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6.0),
                        child: ElevatedButton.icon(
                          icon: Icon(mode.icon),
                          label: Text(mode.label),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            textStyle: textTheme.titleLarge,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () => context.router.push(mode.route),
                        ),
                      );
                    }),

                    const SizedBox(height: 30),

                    Center(
                      child: TextButton(
                        onPressed: () => context.router.pop(),
                        child: Text(t.modeSelectionScreen.backToWelcome),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            _log.severe(
              "Error in activeStudyListProvider for ModeSelectionScreen",
              err,
              stack,
            );
            return Center(
              child: Text(t.general.genericError(error: err.toString())),
            );
          },
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
              child: Text(title, style: Theme.of(context).textTheme.titleLarge),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }
}
