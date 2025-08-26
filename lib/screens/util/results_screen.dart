import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../providers/controllers/flashcard_controller.dart';
import '../../providers/controllers/test_controller.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test Results"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: testStateAsync.when(
          data: (state) {
            if (!state.isSubmitted) {
              return const Center(child: Text("Test not submitted yet."));
            }
            if (state.questions.isEmpty) {
              return const Center(
                child: Text("No questions were in this test."),
              );
            }

            final score = state.score;
            final total = state.totalQuestions;
            final percentage = total > 0 ? (score / total * 100).round() : 0;
            final incorrectAnswers = state.incorrectAnswers;

            return CenteredView(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Your Score",
                      style: textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$percentage%",
                      style: textTheme.displayLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$score / $total Correct",
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    if (incorrectAnswers.isNotEmpty) ...[
                      Text(
                        "Review Incorrect Answers:",
                        style: textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: incorrectAnswers.length,
                        itemBuilder: (context, index) {
                          final item = incorrectAnswers[index];
                          return Card(
                            color: colorScheme.errorContainer.withAlpha(38),
                            margin: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.questionText,
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onErrorContainer,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Your Answer: ${item.userAnswerText ?? "(No answer)"}",
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: colorScheme.onErrorContainer,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Correct Answer: ${item.correctAnswerText}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                    ] else if (total > 0) ...[
                      Text(
                        "Congratulations! You got everything right!",
                        style: textTheme.titleLarge?.copyWith(
                          color: Colors.green.shade700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                    ],

                    ElevatedButton.icon(
                      icon: const Icon(Icons.restart_alt),
                      label: const Text("Retry Test"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                      ),
                      onPressed: () async {
                        await testNotifier.restartTest();
                        if (context.mounted) {
                          context.router.replace(const TestModeRoute());
                        }
                      },
                    ),
                    const SizedBox(height: 12),
                    OutlinedButton.icon(
                      icon: const Icon(Icons.style_outlined),
                      label: const Text("Review with Flashcards"),
                      onPressed: () {
                        ref.invalidate(flashcardControllerProvider);
                        context.router.replace(const FlashcardRoute());
                      },
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.router.popUntilRouteWithName(StartRoute.name);
                        },
                        child: const Text("Back to Welcome Screen"),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(child: Text("Loading results...")),
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
                  child: Text(
                    "Error displaying results: $err",
                    style: TextStyle(color: colorScheme.error),
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
