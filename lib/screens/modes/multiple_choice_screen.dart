import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/widgets/centered_view.dart';
import 'package:quizlone/widgets/web_aware_back_button.dart';

import '../../providers/controllers/multiple_choice_controller.dart';
import '../../providers/study/study_list_providers.dart';

final _log = Logger("MultipleChoiceScreen");

@RoutePage()
class MultipleChoiceScreen extends ConsumerWidget {
  const MultipleChoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final activeListAsync = ref.watch(activeStudyListProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const WebAwareBackButton(),
        title: Text(t.multipleChoiceScreen.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: activeListAsync.when(
          data: (list) {
            if (list == null) {
              return Center(child: Text(t.modeSelectionScreen.noActiveList));
            }
            return const _MCGameView();
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            _log.severe("Error loading list", err, stack);
            return Center(
              child: Text(t.general.genericError(error: err.toString())),
            );
          },
        ),
      ),
    );
  }
}

class _MCGameView extends ConsumerWidget {
  const _MCGameView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mcStateAsync = ref.watch(multipleChoiceControllerProvider);
    final t = Translations.of(context);

    return mcStateAsync.when(
      data: (state) {
        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }

        if (state.isSessionComplete) {
          return _ResultsView(state: state);
        }

        final question = state.currentQuestion;
        if (question == null) return const SizedBox.shrink();

        final options = question.options;
        final rows = (options.length / 2).ceil();

        return CenteredView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t.multipleChoiceScreen.score(score: state.correctCount),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      t.multipleChoiceScreen.questionProgress(
                        current: state.currentIndex + 1,
                        total: state.totalQuestions,
                      ),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (state.currentIndex) / state.totalQuestions,
                  borderRadius: BorderRadius.circular(4),
                ),

                const Spacer(flex: 1),

                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    question.questionText,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                ).animate(key: ValueKey(question)).fadeIn().scale(),

                const Spacer(flex: 1),

                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      for (int i = 0; i < rows; i++) ...[
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: _OptionButton(
                                  text: options[i * 2],
                                  state: state,
                                  onTap: () {
                                    ref
                                        .read(
                                          multipleChoiceControllerProvider
                                              .notifier,
                                        )
                                        .submitAnswer(options[i * 2]);
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              if (i * 2 + 1 < options.length)
                                Expanded(
                                  child: _OptionButton(
                                    text: options[i * 2 + 1],
                                    state: state,
                                    onTap: () {
                                      ref
                                          .read(
                                            multipleChoiceControllerProvider
                                                .notifier,
                                          )
                                          .submitAnswer(options[i * 2 + 1]);
                                    },
                                  ),
                                )
                              else
                                const Spacer(),
                            ],
                          ),
                        ),
                        if (i < rows - 1) const SizedBox(height: 12),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) =>
          Center(child: Text(t.general.genericError(error: err.toString()))),
    );
  }
}

class _OptionButton extends StatelessWidget {
  const _OptionButton({
    required this.text,
    required this.state,
    required this.onTap,
  });

  final VoidCallback onTap;
  final MultipleChoiceState state;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final question = state.currentQuestion!;

    Color cardColor = colorScheme.surfaceContainerLow;
    Color textColor = colorScheme.onSurface;
    BorderSide borderSide = BorderSide.none;

    if (state.isAnswerProcessed) {
      if (text == question.correctAnswer) {
        cardColor = Colors.green.withAlpha(50);
        textColor = Colors.green;
        borderSide = const BorderSide(color: Colors.green, width: 2);
      } else if (text == state.selectedAnswer &&
          text != question.correctAnswer) {
        cardColor = colorScheme.errorContainer;
        textColor = colorScheme.onErrorContainer;
        borderSide = BorderSide(color: colorScheme.error, width: 2);
      } else {
        textColor = colorScheme.onSurface.withAlpha(100);
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: state.isAnswerProcessed ? null : onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.fromBorderSide(borderSide),
            boxShadow: state.isAnswerProcessed
                ? []
                : [
                    BoxShadow(
                      color: Colors.black.withAlpha(20),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          padding: const EdgeInsets.all(12),
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium?.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class _ResultsView extends ConsumerWidget {
  const _ResultsView({required this.state});

  final MultipleChoiceState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final percentage = state.totalQuestions > 0
        ? (state.correctCount / state.totalQuestions)
        : 0.0;
    final percentageInt = (percentage * 100).round();

    return CenteredView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              t.multipleChoiceScreen.results.completed,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 40),
            Text(
              "$percentageInt%",
              style: theme.textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: SizedBox(
                height: 24,
                width: double.infinity,
                child: LinearProgressIndicator(
                  value: percentage,
                  backgroundColor: theme.colorScheme.surfaceContainerHighest,
                  color: _getProgressColor(percentage),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              t.multipleChoiceScreen.results.accuracy,
              style: theme.textTheme.labelLarge,
            ),
            Text(
              t.multipleChoiceScreen.results.correctCount(
                correct: state.correctCount,
                total: state.totalQuestions,
              ),
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    context.router.popUntilRouteWithName(
                      ModeSelectionRoute.name,
                    );
                  },
                  child: Text(t.multipleChoiceScreen.results.backToMenu),
                ),
                const SizedBox(width: 16),
                FilledButton(
                  onPressed: () {
                    ref
                        .read(multipleChoiceControllerProvider.notifier)
                        .restart();
                  },
                  child: Text(t.multipleChoiceScreen.results.playAgain),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getProgressColor(double percentage) {
    if (percentage >= 0.8) return Colors.green;
    if (percentage >= 0.5) return Colors.orange;
    return Colors.red;
  }
}
