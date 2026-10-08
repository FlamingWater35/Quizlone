import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/routing/app_navigator.dart';
import 'package:quizlone/services/smooth_scroll.dart';
import 'package:quizlone/widgets/error_snackbar.dart';

import '../../i18n/generated/translations.g.dart';
import '../../models/enums/enums.dart';
import '../../models/study_list.dart';
import '../../providers/core/settings_provider.dart';
import '../../providers/study/study_list_providers.dart';
import '../../providers/study/study_options_provider.dart';
import '../../providers/study/study_stats_providers.dart';
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

  /// Mirrors the data branch below so the digit-shortcut handler can check
  /// mode eligibility without re-subscribing to providers.
  StudyList? _activeList;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool _isTypingInField() {
    final focusContext = FocusManager.instance.primaryFocus?.context;
    if (focusContext == null) return false;
    return focusContext.widget is EditableText ||
        focusContext.findAncestorWidgetOfExactType<EditableText>() != null;
  }

  /// Desktop convenience: digits 1-5 launch the matching enabled mode row.
  KeyEventResult _handleShortcut(FocusNode node, KeyEvent event) {
    if (event is! KeyDownEvent) return KeyEventResult.ignored;
    // Let the study-length field (and any future input) keep its digits.
    if (_isTypingInField()) return KeyEventResult.ignored;

    final digit = int.tryParse(event.logicalKey.keyLabel);
    if (digit == null || digit < 1 || digit > StudyMode.values.length) {
      return KeyEventResult.ignored;
    }

    final list = _activeList;
    if (list == null) return KeyEventResult.ignored;

    final availability = computeModeAvailability(
      termCount: list.terms.length,
      studyLength: ref.read(studyLengthProvider),
      matchPairs: ref.read(matchPairsProvider),
    );
    final mode = StudyMode.values[digit - 1];
    if (!availability[mode].enabled) return KeyEventResult.ignored;

    switch (mode) {
      case StudyMode.flashcards:
        AppNavigator.pushFlashcards(context);
      case StudyMode.learn:
        AppNavigator.pushLearn(context);
      case StudyMode.multipleChoice:
        AppNavigator.pushMultipleChoice(context);
      case StudyMode.test:
        AppNavigator.pushTest(context);
      case StudyMode.match:
        AppNavigator.pushMatch(context);
    }
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final activeStudyListAsync = ref.watch(activeStudyListProvider);

    return Focus(
      autofocus: true,
      onKeyEvent: _handleShortcut,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: () => AppNavigator.goBack(context),
          ),
          title: Text(t.modeSelectionScreen.title),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.home_outlined),
              tooltip: t.modeSelectionScreen.returnToWelcome,
              onPressed: () => AppNavigator.navigateHome(context),
            ),
            const SizedBox(width: 4),
          ],
        ),
        body: SafeArea(
          child: activeStudyListAsync.when(
            data: (StudyList? list) {
              _activeList = list;
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
                            onPressed: () => AppNavigator.navigateHome(context),
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
            loading: () {
              _activeList = null;
              return const Center(child: CircularProgressIndicator());
            },
            error: (err, stack) {
              _activeList = null;
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
    return SmoothSingleChildScrollView(
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

class _WideLayout extends StatefulWidget {
  const _WideLayout({required this.list, required this.controller});

  final ScrollController controller;
  final StudyList list;

  @override
  State<_WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<_WideLayout> {
  final _actionScrollController = SmoothScrollController();

  @override
  void dispose() {
    _actionScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Scrollbar(
              controller: _actionScrollController,
              thumbVisibility: true,
              child: SmoothSingleChildScrollView(
                controller: _actionScrollController,
                // Keep the mode cards clear of the scrollbar thumb rendered
                // along this column's edge without wasting horizontal room.
                padding: const EdgeInsets.only(left: 10, right: 16),
                child: _ActionPanel(list: widget.list, isWide: true),
              ),
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 5,
            child: Scrollbar(
              controller: widget.controller,
              thumbVisibility: true,
              child: SmoothSingleChildScrollView(
                controller: widget.controller,
                // Keep the options cards clear of
                // the scrollbar along the right edge.
                padding: const EdgeInsets.only(left: 10, right: 13),
                child: const _OptionsPanel(),
              ),
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
        _ModeList(list: list),
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

    // Same subtle surface as the mode cards (a shade lighter, no border) so
    // the header reads as part of the card column instead of floating text.
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colorScheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              list.name,
              style:
                  (isWide ? textTheme.headlineMedium : textTheme.headlineSmall)
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
        ),
      ),
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

  Future<void> _resetToDefaults() async {
    final t = Translations.of(context);
    try {
      final applied = await ref
          .read(studyDefaultsProvider.notifier)
          .applyToActiveList();
      if (!mounted) return;
      if (applied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(t.modeSelectionScreen.defaultsApplied)),
        );
      }
    } catch (e) {
      if (mounted) {
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
    final ignoreBrackets = ref.watch(ignoreBracketsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2, right: 2, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  t.modeSelectionScreen.perListOptionsHint,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: _resetToDefaults,
                icon: const Icon(Icons.restart_alt, size: 16),
                label: Text(t.modeSelectionScreen.resetToDefaults),
                style: OutlinedButton.styleFrom(
                  visualDensity: VisualDensity.compact,
                  textStyle: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
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
            SwitchListTile(
              title: Text(t.modeSelectionScreen.ignoreBrackets),
              subtitle: Text(t.modeSelectionScreen.ignoreBracketsSubtitle),
              value: ignoreBrackets,
              onChanged: (value) {
                _handleSettingChange(
                  () => ref.read(ignoreBracketsProvider.notifier).set(value),
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
              child: Column(
                children: [
                  Row(
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
                              suffixText: totalTerms > 0
                                  ? "/ $totalTerms"
                                  : null,
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
                  const SizedBox(height: 6),
                  Text(
                    t.modeSelectionScreen.studyLengthHelper,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        _SettingsCard(
          title: t.modeSelectionScreen.testOptions,
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
                    tooltip: isMCDisabled
                        ? t.multipleChoiceScreen.errors.notEnoughTerms
                        : null,
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

class _ModeList extends ConsumerWidget {
  const _ModeList({required this.list});

  final StudyList list;

  /// Disabled cards swap their description for the same error the mode's
  /// controller would show, so users never navigate into a dead end.
  String _disabledReason(Translations t, StudyMode mode) {
    return switch (mode) {
      StudyMode.flashcards => t.flashcardScreen.noTerms,
      StudyMode.learn => t.learnScreen.errors.noTerms,
      StudyMode.multipleChoice => t.multipleChoiceScreen.errors.notEnoughTerms,
      StudyMode.test => t.testScreen.errors.noTerms,
      StudyMode.match => t.matchScreen.errors.notEnoughTerms,
    };
  }

  /// Trailing metadata: one line aligned with the title plus up to two lines
  /// aligned with the description (see [_ModeCard]).
  List<String> _metaLines(
    Translations t,
    WidgetRef ref,
    StudyMode mode,
    ModeStatus status,
  ) {
    if (!status.enabled) return const [];
    switch (mode) {
      case StudyMode.flashcards:
        return [t.startScreen.termCount(count: status.previewCount)];
      case StudyMode.learn:
      case StudyMode.multipleChoice:
        return [
          t.modeSelectionScreen.modeMeta.questions(count: status.previewCount),
        ];
      case StudyMode.test:
        final formatLabel =
            ref.watch(testQuestionFormatProvider) == TestFormat.written
            ? t.modeSelectionScreen.writtenAnswer
            : t.modeSelectionScreen.multipleChoice;
        final lines = [
          t.modeSelectionScreen.modeMeta.questions(count: status.previewCount),
          formatLabel,
        ];
        final record = ref
            .watch(latestTestRecordProvider(list.id))
            .asData
            ?.value;
        if (record != null && record.totalQuestions > 0) {
          final percent = ((record.score / record.totalQuestions) * 100)
              .round();
          lines.add(t.modeSelectionScreen.modeMeta.lastScore(percent: percent));
        }
        return lines;
      case StudyMode.match:
        final lines = [
          t.modeSelectionScreen.modeMeta.pairs(count: status.previewCount),
        ];
        final records = ref.watch(matchRecordsProvider(list.id)).asData?.value;
        if (records != null && records.isNotEmpty) {
          final seconds = (records.first.timeInTenths / 10).toStringAsFixed(1);
          lines.add(t.modeSelectionScreen.modeMeta.bestTime(time: seconds));
        }
        return lines;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    final availability = computeModeAvailability(
      termCount: list.terms.length,
      studyLength: ref.watch(studyLengthProvider),
      matchPairs: ref.watch(matchPairsProvider),
    );

    Widget cardFor(StudyMode mode, IconData icon, String title, String desc) {
      final status = availability[mode];
      return _ModeCard(
        icon: icon,
        title: title,
        description: desc,
        status: status,
        disabledReason: _disabledReason(t, mode),
        metaLines: _metaLines(t, ref, mode, status),
        onTap: () {
          switch (mode) {
            case StudyMode.flashcards:
              AppNavigator.pushFlashcards(context);
            case StudyMode.learn:
              AppNavigator.pushLearn(context);
            case StudyMode.multipleChoice:
              AppNavigator.pushMultipleChoice(context);
            case StudyMode.test:
              AppNavigator.pushTest(context);
            case StudyMode.match:
              AppNavigator.pushMatch(context);
          }
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        cardFor(
          StudyMode.flashcards,
          Icons.style,
          t.modeSelectionScreen.flashcards,
          t.modeSelectionScreen.modeDescriptions.flashcards,
        ),
        cardFor(
          StudyMode.learn,
          Icons.school,
          t.modeSelectionScreen.learn,
          t.modeSelectionScreen.modeDescriptions.learn,
        ),
        cardFor(
          StudyMode.multipleChoice,
          Icons.checklist_rtl_rounded,
          t.modeSelectionScreen.multipleChoice,
          t.modeSelectionScreen.modeDescriptions.multipleChoice,
        ),
        cardFor(
          StudyMode.test,
          Icons.quiz,
          t.modeSelectionScreen.test,
          t.modeSelectionScreen.modeDescriptions.test,
        ),
        cardFor(
          StudyMode.match,
          Icons.extension,
          t.modeSelectionScreen.match,
          t.modeSelectionScreen.modeDescriptions.match,
        ),
      ],
    );
  }
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.status,
    required this.disabledReason,
    required this.metaLines,
    required this.onTap,
  });

  final String description;
  final String disabledReason;
  final IconData icon;
  final List<String> metaLines;
  final VoidCallback onTap;
  final String title;
  final ModeStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final enabled = status.enabled;

    final Widget card = Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: enabled
          ? colorScheme.surfaceContainerLow
          : theme.disabledColor.withAlpha(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: enabled
              ? colorScheme.outlineVariant.withAlpha(70)
              : Colors.transparent,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: enabled ? onTap : null,
        // InkWell's implicit cursor doesn't surface on some desktop
        // platforms; declare it explicitly.
        mouseCursor: enabled
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: enabled
                      ? colorScheme.primaryContainer
                      : colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 22,
                  color: enabled
                      ? colorScheme.onPrimaryContainer
                      : theme.disabledColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            title,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: enabled ? null : theme.disabledColor,
                            ),
                          ),
                        ),
                        if (metaLines.isNotEmpty) ...[
                          const SizedBox(width: 8),
                          Text(
                            metaLines.first,
                            textAlign: TextAlign.right,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: enabled
                                  ? colorScheme.primary
                                  : theme.disabledColor,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 2),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            enabled ? description : disabledReason,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: enabled
                                  ? colorScheme.onSurfaceVariant
                                  : theme.disabledColor,
                            ),
                          ),
                        ),
                        if (metaLines.length > 1) ...[
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              for (final line in metaLines.skip(1))
                                Text(
                                  line,
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.ellipsis,
                                  style: theme.textTheme.labelSmall?.copyWith(
                                    color: enabled
                                        ? colorScheme.onSurfaceVariant
                                        : theme.disabledColor,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: enabled ? card : Tooltip(message: disabledReason, child: card),
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
    this.tooltip,
  });

  final T groupValue;
  final IconData icon;
  final bool isDisabled;
  final String label;
  final String? tooltip;
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

    final Widget card = Card(
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
        // InkWell's implicit cursor doesn't surface on some desktop
        // platforms; declare it explicitly.
        mouseCursor: isDisabled ? MouseCursor.defer : SystemMouseCursors.click,
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
    );

    return Expanded(
      child: tooltip == null ? card : Tooltip(message: tooltip, child: card),
    );
  }
}
