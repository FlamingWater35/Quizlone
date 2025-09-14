import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../providers/controllers/flashcard_controller.dart';
import '../../providers/controllers/test_controller.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';

@RoutePage()
class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});

  static final _log = Logger("ResultScreen");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testStateAsync = ref.watch(testControllerProvider);
    final testNotifier = ref.read(testControllerProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.resultsScreen.title),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: testStateAsync.when(
          data: (state) {
            if (!state.isSubmitted) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  if (kIsWeb && !context.router.canPop()) {
                    if (ref.read(activeStudyListIdProvider) != null) {
                      context.router.replaceAll([
                        const StartRoute(),
                        const ModeSelectionRoute(),
                      ]);
                    } else {
                      context.router.replaceAll([const StartRoute()]);
                    }
                  } else {
                    context.router.pop();
                  }
                }
              });
              return const Center(child: CircularProgressIndicator());
            }

            if (state.questions.isEmpty) {
              return Center(child: Text(t.resultsScreen.noQuestions));
            }

            final score = state.score;
            final total = state.totalQuestions;
            final percentage = total > 0 ? (score / total * 100).round() : 0;
            final incorrectAnswers = state.incorrectAnswers;
            final bool isPerfectScore = score == total && total > 0;

            return CenteredView(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      t.resultsScreen.yourScore,
                      style: textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$percentage%",
                      style: textTheme.displayLarge?.copyWith(
                        color:
                            isPerfectScore
                                ? colorScheme.primary
                                : colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      t.resultsScreen.scoreFraction(score: score, total: total),
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    if (incorrectAnswers.isNotEmpty) ...[
                      Text(
                        t.resultsScreen.reviewIncorrect,
                        style: textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      ...incorrectAnswers.map((item) {
                        return Card(
                          color: colorScheme.error.withAlpha(15),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: colorScheme.error.withAlpha(40),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.questionText,
                                  style: textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                const Divider(height: 24),
                                Text.rich(
                                  TextSpan(
                                    text:
                                        "${t.resultsScreen.yourAnswerWas(answer: '')} ",
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            item.userAnswerText ??
                                            t.resultsScreen.noAnswer,
                                        style: TextStyle(
                                          color: colorScheme.error,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text.rich(
                                  TextSpan(
                                    text:
                                        "${t.resultsScreen.reviewIncorrect.split(':').first}: ",
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: item.correctAnswerText,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ] else if (total > 0) ...[
                      Icon(
                        Icons.check_circle_outline,
                        color: colorScheme.primary,
                        size: 60,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        t.resultsScreen.congratulations,
                        style: textTheme.headlineSmall?.copyWith(
                          color: colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],

                    const SizedBox(height: 32),

                    FilledButton.icon(
                      icon: const Icon(Icons.restart_alt),
                      label: Text(t.resultsScreen.retryTest),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        testNotifier.restartTest();
                      },
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.style_outlined),
                      label: Text(t.resultsScreen.reviewFlashcards),
                      onPressed: () {
                        ref
                            .read(flashcardControllerProvider.notifier)
                            .refreshWithOptions();
                        context.router.replace(const FlashcardRoute());
                      },
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.router.popUntilRouteWithName(
                            ModeSelectionRoute.name,
                          );
                        },
                        child: Text(t.modeSelectionScreen.title),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => Center(child: Text(t.general.loading)),
          error: (err, stack) {
            _log.severe(
              "Error in testControllerProvider for ResultsScreen",
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
                        style: TextStyle(color: colorScheme.error),
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
