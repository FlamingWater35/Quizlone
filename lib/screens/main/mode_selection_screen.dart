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

            return CenteredView(
              child: Hero(
                tag: list.name,
                child: Material(
                  type: MaterialType.transparency,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        const double breakpoint = 500.0;
                        final isWide = constraints.maxWidth >= breakpoint;
                        return isWide
                            ? _WideLayout(list: list)
                            : _NarrowLayout(list: list);
                      },
                    ),
                  ),
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

class _NarrowLayout extends StatelessWidget {
  const _NarrowLayout({required this.list});
  final StudyList list;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ListHeader(list: list),
        const SizedBox(height: 24),
        const _OptionsPanel(),
        const SizedBox(height: 32),
        const _ActionButtons(),
        const SizedBox(height: 30),
        const _BackButton(),
      ],
    );
  }
}

class _WideLayout extends StatelessWidget {
  const _WideLayout({required this.list});
  final StudyList list;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              _ListHeader(list: list, isWide: true),
              const SizedBox(height: 48),
              const _ActionButtons(),
              const SizedBox(height: 40),
              const _BackButton(),
            ],
          ),
        ),
        const SizedBox(width: 24),
        const Expanded(flex: 3, child: _OptionsPanel()),
      ],
    );
  }
}

class _ListHeader extends StatelessWidget {
  const _ListHeader({required this.list, this.isWide = false});
  final StudyList list;
  final bool isWide;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Text(
          list.name,
          style: (isWide ? textTheme.headlineMedium : textTheme.headlineSmall)
              ?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          t.startScreen.termCount(count: list.terms.length),
          style: (isWide ? textTheme.titleLarge : textTheme.titleMedium)
              ?.copyWith(color: colorScheme.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _OptionsPanel extends ConsumerWidget {
  const _OptionsPanel();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final totalTerms =
        ref.watch(activeStudyListProvider).asData?.value?.terms.length ?? 0;

    final fcStartWith = ref.watch(flashcardStartWithProvider);
    final studyAskWith = ref.watch(studyAskWithProvider);
    final studyLength = ref.watch(studyLengthProvider);
    final testFormat = ref.watch(testQuestionFormatProvider);

    return Column(
      children: [
        _SettingsHeader(title: t.modeSelectionScreen.flashcardOptions),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              RadioListTile<FlashcardStartSide>(
                title: Text(t.modeSelectionScreen.showTermFirst),
                value: FlashcardStartSide.term,
                groupValue: fcStartWith,
                onChanged:
                    (value) => ref
                        .read(flashcardStartWithProvider.notifier)
                        .set(value!),
              ),
              RadioListTile<FlashcardStartSide>(
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
        ),
        const SizedBox(height: 16),
        _SettingsHeader(title: t.modeSelectionScreen.studyOptions),
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioListTile<StudyQuestionType>(
                title: Text(t.modeSelectionScreen.askForTerm),
                value: StudyQuestionType.definition,
                groupValue: studyAskWith,
                onChanged:
                    (value) =>
                        ref.read(studyAskWithProvider.notifier).set(value!),
              ),
              RadioListTile<StudyQuestionType>(
                title: Text(t.modeSelectionScreen.askForDef),
                value: StudyQuestionType.term,
                groupValue: studyAskWith,
                onChanged:
                    (value) =>
                        ref.read(studyAskWithProvider.notifier).set(value!),
              ),
              const Divider(indent: 16, endIndent: 16),
              ListTile(
                title: Text(t.modeSelectionScreen.studyLength),
                trailing: SizedBox(
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
                      suffixText: totalTerms > 0 ? "/ $totalTerms" : null,
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      final intVal = int.tryParse(value);
                      final notifier = ref.read(studyLengthProvider.notifier);
                      if (value.isEmpty || intVal == null) {
                        notifier.clear();
                      } else if (intVal > totalTerms && totalTerms > 0) {
                        notifier.set(totalTerms);
                      } else {
                        notifier.set(intVal);
                      }
                    },
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const Divider(indent: 16, endIndent: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0.0),
                child: Text(
                  t.modeSelectionScreen.testFormat,
                  style: textTheme.titleMedium,
                ),
              ),
              RadioListTile<TestFormat>(
                title: Text(t.modeSelectionScreen.writtenAnswer),
                value: TestFormat.written,
                groupValue: testFormat,
                onChanged:
                    (value) => ref
                        .read(testQuestionFormatProvider.notifier)
                        .set(value!),
              ),
              RadioListTile<TestFormat>(
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
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final modes = [
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
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:
          modes.map((mode) {
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
          }).toList(),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Center(
      child: TextButton(
        onPressed: () => context.router.pop(),
        child: Text(t.modeSelectionScreen.backToWelcome),
      ),
    );
  }
}

class _SettingsHeader extends StatelessWidget {
  const _SettingsHeader({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 16, 4, 8),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
