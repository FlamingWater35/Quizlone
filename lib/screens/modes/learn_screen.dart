import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/widgets/web_aware_back_button.dart';

import '../../providers/controllers/learn_controller.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';

final _log = Logger("LearnScreen");

@RoutePage()
class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final activeListAsync = ref.watch(activeStudyListProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const WebAwareBackButton(fallback: ModeSelectionRoute()),
        title: Text(t.learnScreen.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: activeListAsync.when(
          data: (list) {
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
                            context.router.replaceAll([const StartRoute()]);
                          },
                          child: Text(t.modeSelectionScreen.returnToWelcome),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const _LearnView();
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            _log.severe(
              "Error loading active list for LearnScreen",
              err,
              stack,
            );
            return Center(
              child: CenteredView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        t.general.genericError(error: err.toString()),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
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
          },
        ),
      ),
    );
  }
}

class _LearnView extends ConsumerStatefulWidget {
  const _LearnView();

  @override
  ConsumerState<_LearnView> createState() => _LearnViewState();
}

class _LearnViewState extends ConsumerState<_LearnView> {
  late TextEditingController _answerController;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _answerController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  void _onSubmit(LearnController notifier, LearnModeScreenState state) {
    if (_answerController.text.isNotEmpty &&
        !(state.currentQuestion?.answerSubmitted ?? true)) {
      notifier.submitAnswer();
    }
  }

  Widget _buildSessionCompleteUI(
    BuildContext context,
    LearnModeScreenState state,
    LearnController notifier,
  ) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    return Center(
      child: CenteredView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                t.learnScreen.progress.sessionComplete,
                style: theme.textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Icon(
                Icons.check_circle_outline,
                size: 80,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: 16),
              Text(
                state.progressMessage,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      context.router.navigate(const ModeSelectionRoute());
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text(t.learnScreen.backToOptions),
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                    onPressed: notifier.refreshAndRestart,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    child: Text(t.learnScreen.restartSession),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getFeedbackColor(BuildContext context, LearnFeedbackType type) {
    final colorScheme = Theme.of(context).colorScheme;
    switch (type) {
      case LearnFeedbackType.correct:
        return Colors.green.shade700;
      case LearnFeedbackType.incorrect:
        return colorScheme.error;
      case LearnFeedbackType.hint:
        return colorScheme.secondary;
      case LearnFeedbackType.skipped:
        return colorScheme.outline;
      default:
        return colorScheme.onSurface;
    }
  }

  IconData? _getFeedbackIcon(LearnFeedbackType type) {
    switch (type) {
      case LearnFeedbackType.correct:
        return Icons.check_circle_outline;
      case LearnFeedbackType.incorrect:
        return Icons.cancel_outlined;
      case LearnFeedbackType.hint:
        return Icons.lightbulb_outline;
      case LearnFeedbackType.skipped:
        return Icons.double_arrow_outlined;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final learnStateAsync = ref.watch(learnControllerProvider);
    final learnNotifier = ref.read(learnControllerProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
    final t = Translations.of(context);

    ref.listen<AsyncValue<LearnModeScreenState>>(learnControllerProvider, (
      prev,
      next,
    ) {
      final prevQuestionTerm = prev?.asData?.value.currentQuestion?.term;
      final nextQuestionTerm = next.asData?.value.currentQuestion?.term;
      final nextQuestionSubmitted =
          next.asData?.value.currentQuestion?.answerSubmitted ?? false;

      if (nextQuestionTerm != prevQuestionTerm &&
          !nextQuestionSubmitted &&
          mounted) {
        _answerController.clear();

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _focusNode.requestFocus();
          }
        });
      }
    });

    return learnStateAsync.when(
      data: (state) {
        if (state.errorMessage != null) {
          return Center(
            child: CenteredView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.errorMessage!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        ref.read(activeStudyListIdProvider.notifier).set(null);
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
        if (state.isSessionComplete) {
          return _buildSessionCompleteUI(context, state, learnNotifier);
        }
        if (state.currentQuestion == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final questionState = state.currentQuestion!;
        final progressValue = state.termsToLearnThisCycle.isEmpty
            ? 0.0
            : (state.currentTermIndexInCycle + 1) /
                  state.termsToLearnThisCycle.length;

        return CenteredView(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  state.progressMessage,
                  style: textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: LinearProgressIndicator(
                    value: progressValue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                const SizedBox(height: 20),

                Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAlias,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          questionState.questionLabel,
                          style: textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          questionState.questionText,
                          style: textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        const SizedBox(height: 24),
                        const Divider(),
                        const SizedBox(height: 24),

                        TextField(
                          focusNode: _focusNode,
                          controller: _answerController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: t.learnScreen.answerHint,
                          ),
                          onChanged: learnNotifier.updateUserAnswer,
                          onSubmitted: (_) => _onSubmit(learnNotifier, state),
                          readOnly: questionState.answerSubmitted,
                          autofocus: true,
                        ),
                        const SizedBox(height: 20),

                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                          child: questionState.feedbackMessage.isNotEmpty
                              ? Container(
                                  key: ValueKey(questionState.feedbackMessage),
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: _getFeedbackColor(
                                      context,
                                      questionState.feedbackType,
                                    ).withAlpha(15),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (_getFeedbackIcon(
                                            questionState.feedbackType,
                                          ) !=
                                          null)
                                        Icon(
                                          _getFeedbackIcon(
                                            questionState.feedbackType,
                                          ),
                                          color: _getFeedbackColor(
                                            context,
                                            questionState.feedbackType,
                                          ),
                                          size: 20,
                                        ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          questionState.feedbackMessage,
                                          textAlign: TextAlign.center,
                                          style: textTheme.titleMedium
                                              ?.copyWith(
                                                color: _getFeedbackColor(
                                                  context,
                                                  questionState.feedbackType,
                                                ),
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(
                                  key: ValueKey('empty'),
                                  height: 58,
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                if (!questionState.answerSubmitted)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FilledButton.icon(
                        icon: const Icon(Icons.check),
                        onPressed: () => _onSubmit(learnNotifier, state),
                        label: Text(t.general.submit),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextButton.icon(
                              icon: const Icon(
                                Icons.lightbulb_outline,
                                size: 18,
                              ),
                              label: Text(t.learnScreen.hint),
                              onPressed: learnNotifier.showHint,
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextButton.icon(
                              icon: const Icon(
                                Icons.skip_next_outlined,
                                size: 18,
                              ),
                              label: Text(t.learnScreen.skip),
                              onPressed:
                                  learnNotifier.skipQuestionAndShowAnswer,
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                else
                  const SizedBox(height: 80),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) {
        _log.severe("Error in learnControllerProvider", err, stack);
        return Center(
          child: CenteredView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                t.general.genericError(error: err.toString()),
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ),
        );
      },
    );
  }
}
