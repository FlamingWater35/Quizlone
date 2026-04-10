import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/services/smooth_scroll.dart';
import 'package:quizlone/widgets/error_snackbar.dart';

import '../../i18n/generated/translations.g.dart';
import '../../models/enums/enums.dart';
import '../../models/study_list.dart';
import '../../providers/study/study_list_providers.dart';
import '../../providers/study/study_options_provider.dart';
import '../../widgets/centered_view.dart';

final _log = Logger("ModeSelectionScreen");

@RoutePage()
class ModeSelectionScreen extends ConsumerStatefulWidget {
  const ModeSelectionScreen({super.key});

  @override
  ConsumerState<ModeSelectionScreen> createState() =>
      _ModeSelectionScreenState();
}

class _ModeSelectionScreenState extends ConsumerState<ModeSelectionScreen> {
  final _scrollController = SmoothScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final activeStudyListAsync = ref.watch(activeStudyListProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () {
            final router = context.router;
            if (router.canPop()) {
              router.back();
            } else {
              router.replace(const StartRoute());
            }
          },
        ),
        title: Text(t.modeSelectionScreen.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            tooltip: t.modeSelectionScreen.returnToWelcome,
            onPressed: () {
              ref.read(activeStudyListIdProvider.notifier).set(null);
              context.router.popUntilRoot();
            },
          ),
          const SizedBox(width: 4),
        ],
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
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(activeStudyListIdProvider.notifier)
                                .set(null);
                            context.router.popUntilRoot();
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
                tag: list.id,
                child: Material(
                  type: MaterialType.transparency,
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      const double breakpoint = 650.0;
                      final isWide = constraints.maxWidth >= breakpoint;
                      return isWide
                          ? _WideLayout(
                              list: list,
                              controller: _scrollController,
                            )
                          : _NarrowLayout(
                              list: list,
                              controller: _scrollController,
                            );
                    },
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
  const _NarrowLayout({required this.list, required this.controller});

  final ScrollController controller;
  final StudyList list;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _ActionPanel(list: list),
          const Divider(),
          const _OptionsPanel(),
        ],
      ),
    );
  }
}

class _WideLayout extends StatelessWidget {
  const _WideLayout({required this.list, required this.controller});

  final ScrollController controller;
  final StudyList list;

  @override
  Widget build(BuildContext context) {
    final actionScrollController = SmoothScrollController();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              controller: actionScrollController,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: _ActionPanel(list: list, isWide: true),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 3,
            child: SingleChildScrollView(
              controller: controller,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const _OptionsPanel(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionPanel extends StatelessWidget {
  const _ActionPanel({required this.list, this.isWide = false});

  final bool isWide;
  final StudyList list;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isWide) const SizedBox(height: 10),
        _ListHeader(list: list, isWide: isWide),
        const SizedBox(height: 48),
        const _ActionButtons(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _ListHeader extends StatelessWidget {
  const _ListHeader({required this.list, this.isWide = false});

  final bool isWide;
  final StudyList list;

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

class _OptionsPanel extends ConsumerStatefulWidget {
  const _OptionsPanel();

  @override
  ConsumerState<_OptionsPanel> createState() => _OptionsPanelState();
}

class _OptionsPanelState extends ConsumerState<_OptionsPanel> {
  late final TextEditingController _studyLengthController;
  late final FocusNode _studyLengthFocusNode;

  @override
  void dispose() {
    _studyLengthController.dispose();
    _studyLengthFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final initialValue = ref.read(studyLengthProvider);
    _studyLengthController = TextEditingController(
      text: initialValue?.toString() ?? '',
    );

    _studyLengthFocusNode = FocusNode();
    _studyLengthFocusNode.addListener(() {
      if (!_studyLengthFocusNode.hasFocus) {
        _updateStudyLength();
      }
    });
  }

  void _updateStudyLength() {
    final value = _studyLengthController.text;
    final intVal = int.tryParse(value);
    final totalTerms =
        ref.read(activeStudyListProvider).asData?.value?.terms.length ?? 0;
    final notifier = ref.read(studyLengthProvider.notifier);

    _handleSettingChange(() {
      if (value.isEmpty || intVal == null) {
        return notifier.clear();
      } else if (intVal > totalTerms && totalTerms > 0) {
        return notifier.set(totalTerms);
      } else {
        return notifier.set(intVal);
      }
    });
  }

  Future<void> _handleSettingChange(
    Future<void> Function() updateFunction,
  ) async {
    try {
      await updateFunction();
    } catch (e) {
      if (mounted) {
        final t = Translations.of(context);
        showErrorSnackBar(
          context,
          message: t.modeSelectionScreen.errors.saveSettingFailed(
            error: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int?>(studyLengthProvider, (previous, next) {
      final newText = next?.toString() ?? '';
      if (newText != _studyLengthController.text) {
        _studyLengthController.text = newText;
      }
    });

    final t = Translations.of(context);
    final totalTerms =
        ref.watch(activeStudyListProvider).asData?.value?.terms.length ?? 0;

    final testFormat = ref.watch(testQuestionFormatProvider);
    final bool isMCDisabled = totalTerms < 4;

    final fcStartWith = ref.watch(flashcardStartWithProvider);
    final studyAskWith = ref.watch(studyAskWithProvider);
    final allowSubstring = ref.watch(allowAnswerSubstringProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SettingsCard(
          title: t.modeSelectionScreen.flashcardOptions,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _CustomToggleButton<FlashcardStartSide>(
                    label: t.modeSelectionScreen.showTermFirst,
                    icon: Icons.rectangle_outlined,
                    value: FlashcardStartSide.term,
                    groupValue: fcStartWith,
                    onChanged: (value) => _handleSettingChange(
                      () => ref
                          .read(flashcardStartWithProvider.notifier)
                          .set(value),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _CustomToggleButton<FlashcardStartSide>(
                    label: t.modeSelectionScreen.showDefFirst,
                    icon: Icons.notes_outlined,
                    value: FlashcardStartSide.definition,
                    groupValue: fcStartWith,
                    onChanged: (value) => _handleSettingChange(
                      () => ref
                          .read(flashcardStartWithProvider.notifier)
                          .set(value),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _SettingsCard(
          title: t.modeSelectionScreen.studyOptions,
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _CustomToggleButton<StudyQuestionType>(
                    label: t.modeSelectionScreen.askForTerm,
                    icon: Icons.notes_outlined,
                    value: StudyQuestionType.definition,
                    groupValue: studyAskWith,
                    onChanged: (value) => _handleSettingChange(
                      () => ref.read(studyAskWithProvider.notifier).set(value),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _CustomToggleButton<StudyQuestionType>(
                    label: t.modeSelectionScreen.askForDef,
                    icon: Icons.rectangle_outlined,
                    value: StudyQuestionType.term,
                    groupValue: studyAskWith,
                    onChanged: (value) => _handleSettingChange(
                      () => ref.read(studyAskWithProvider.notifier).set(value),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 24),
            SwitchListTile(
              title: Text(t.modeSelectionScreen.requireOnlyOneAnswer),
              subtitle: Text(
                t.modeSelectionScreen.requireOnlyOneAnswerSubtitle,
              ),
              value: allowSubstring,
              onChanged: (value) {
                _handleSettingChange(
                  () => ref
                      .read(allowAnswerSubstringProvider.notifier)
                      .set(value),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              contentPadding: const EdgeInsets.only(left: 16, right: 8),
              dense: true,
            ),
            const Divider(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(t.modeSelectionScreen.studyLength),
                  const SizedBox(width: 16),
                  Flexible(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 120),
                      child: TextFormField(
                        controller: _studyLengthController,
                        focusNode: _studyLengthFocusNode,
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
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onEditingComplete: _updateStudyLength,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _SettingsCard(
          title: "${t.modeSelectionScreen.test} Options",
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _CustomToggleButton<TestFormat>(
                    label: t.modeSelectionScreen.writtenAnswer,
                    icon: Icons.edit_note_outlined,
                    value: TestFormat.written,
                    groupValue: testFormat,
                    onChanged: (value) => _handleSettingChange(
                      () => ref
                          .read(testQuestionFormatProvider.notifier)
                          .set(value),
                    ),
                  ),
                  const SizedBox(width: 8),
                  _CustomToggleButton<TestFormat>(
                    label: t.modeSelectionScreen.multipleChoice,
                    icon: Icons.check_box_outlined,
                    value: TestFormat.mc,
                    groupValue: testFormat,
                    onChanged: (value) => _handleSettingChange(
                      () => ref
                          .read(testQuestionFormatProvider.notifier)
                          .set(value),
                    ),
                    isDisabled: isMCDisabled,
                  ),
                ],
              ),
            ),
          ],
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
        label: t.modeSelectionScreen.multipleChoice,
        icon: Icons.checklist_rtl_rounded,
        route: const MultipleChoiceRoute(),
      ),
      (
        label: t.modeSelectionScreen.test,
        icon: Icons.quiz,
        route: const TestModeRoute(),
      ),
      (
        label: t.modeSelectionScreen.match,
        icon: Icons.extension,
        route: const MatchRoute(),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: modes.map((mode) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: FilledButton.icon(
            icon: Icon(mode.icon),
            label: Text(mode.label),
            style: FilledButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle: textTheme.titleLarge,
            ),
            onPressed: () => context.router.push(mode.route),
          ),
        );
      }).toList(),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.title, required this.children});

  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _CustomToggleButton<T> extends StatelessWidget {
  const _CustomToggleButton({
    required this.label,
    required this.icon,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.isDisabled = false,
  });

  final T groupValue;
  final IconData icon;
  final bool isDisabled;
  final String label;
  final ValueChanged<T> onChanged;
  final T value;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final Color cardColor = isDisabled
        ? theme.disabledColor.withAlpha(6)
        : (isSelected ? colorScheme.secondaryContainer : colorScheme.surface);

    final Color contentColor = isDisabled
        ? theme.disabledColor
        : (isSelected
              ? colorScheme.onSecondaryContainer
              : colorScheme.onSurfaceVariant);

    final BorderSide borderSide = BorderSide(
      color: isDisabled
          ? Colors.transparent
          : (isSelected ? Colors.transparent : colorScheme.outlineVariant),
    );

    return Expanded(
      child: Card(
        margin: EdgeInsets.zero,
        elevation: isSelected && !isDisabled ? 2 : 0,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: borderSide,
        ),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: isDisabled ? null : () => onChanged(value),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 15.0, color: contentColor),
                const SizedBox(height: 8),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: contentColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
