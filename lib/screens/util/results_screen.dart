import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import '../../providers/controllers/flashcard_controller.dart';
import '../../providers/controllers/test_controller.dart';
import '../../providers/core/navigation_provider.dart';

class ResultsScreen extends ConsumerWidget {
  const ResultsScreen({super.key});
  static final _log = Logger("ResultScreen");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testStateAsync = ref.watch(testControllerProvider);
    final testNotifier = ref.read(testControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("7. Test Results"),
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

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Your Score: $score / $total ($percentage%)",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  if (incorrectAnswers.isNotEmpty) ...[
                    Text(
                      "Review Incorrect Answers:",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: incorrectAnswers.length,
                      itemBuilder: (context, index) {
                        final item = incorrectAnswers[index];
                        return Card(
                          color: Theme.of(
                            context,
                          ).colorScheme.errorContainer.withAlpha(45),
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.isQuestionDefinition
                                      ? "Definition Shown:"
                                      : "Term Shown:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onErrorContainer
                                        .withAlpha(210),
                                  ),
                                ),
                                Text(
                                  item.questionText,
                                  style: TextStyle(
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onErrorContainer,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "Your Answer: ${item.userAnswerText ?? "(No answer)"}",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onErrorContainer,
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
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.green.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                  ],

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12.0,
                    runSpacing: 12.0,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          ref
                              .read(currentScreenProvider.notifier)
                              .goTo(AppScreen.start);
                        },
                        child: const Text("Start Screen"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref.invalidate(flashcardControllerProvider);
                          ref
                              .read(currentScreenProvider.notifier)
                              .goTo(AppScreen.flashcards);
                        },
                        child: const Text("Review Flashcards"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          foregroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                        ),
                        onPressed: () {
                          testNotifier.restartTest().then((_) {
                            ref
                                .read(currentScreenProvider.notifier)
                                .goTo(AppScreen.test);
                          });
                        },
                        child: const Text("Retry Test"),
                      ),
                    ],
                  ),
                ],
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Error displaying results: $err",
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
