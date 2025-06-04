import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import '../../providers/controllers/learn_controller.dart';
import '../../providers/core/navigation_provider.dart';

class LearnScreen extends ConsumerStatefulWidget {
  const LearnScreen({super.key});

  @override
  ConsumerState<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends ConsumerState<LearnScreen> {
  late TextEditingController _answerController;
  static final _log = Logger("LearnScreen");

  @override
  void dispose() {
    _answerController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _answerController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _log.fine(
          "[LearnScreen] initState: Invalidating LearnController to start session.",
        );
        ref.invalidate(learnControllerProvider);
      }
    });
  }

  void _onSubmit(LearnController notifier) {
    if (_answerController.text.isNotEmpty) {
      notifier.submitAnswer();
    }
  }

  Widget _buildSessionCompleteUI(
    BuildContext context,
    LearnModeScreenState state,
    LearnController notifier,
  ) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.progressMessage,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: notifier.refreshAndRestart,
              child: const Text("Restart Learn Session"),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed:
                  () => ref
                      .read(currentScreenProvider.notifier)
                      .goTo(AppScreen.modeSelection),
              child: const Text("Back to Options"),
            ),
          ],
        ),
      ),
    );
  }

  Color _getFeedbackColor(BuildContext context, LearnFeedbackType type) {
    switch (type) {
      case LearnFeedbackType.correct:
        return Colors.green.shade700;
      case LearnFeedbackType.incorrect:
        return Theme.of(context).colorScheme.error;
      case LearnFeedbackType.hint:
        return Colors.orange.shade700;
      case LearnFeedbackType.skipped:
        return Theme.of(context).colorScheme.outline;
      default:
        return Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    final learnStateAsync = ref.watch(learnControllerProvider);
    final learnNotifier = ref.read(learnControllerProvider.notifier);
    final textTheme = Theme.of(context).textTheme;

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
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref
                .read(currentScreenProvider.notifier)
                .goTo(AppScreen.modeSelection);
          },
        ),
      ),
      body: learnStateAsync.when(
        data: (state) {
          if (state.errorMessage != null) {
            return Center(
              child: Text(
                state.errorMessage!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            );
          }
          if (state.isSessionComplete) {
            return _buildSessionCompleteUI(context, state, learnNotifier);
          }
          if (state.currentQuestion == null && !state.isLoading) {
            return const Center(child: Text("Preparing next question..."));
          }
          if (state.currentQuestion == null && state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final questionState = state.currentQuestion!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  state.progressMessage,
                  style: textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          questionState.questionLabel,
                          style: textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          questionState.questionText,
                          style: textTheme.headlineSmall,
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _answerController,
                        decoration: InputDecoration(
                          hintText: "Type your answer here...",
                          border: const OutlineInputBorder(),
                          errorText:
                              (questionState.feedbackType ==
                                          LearnFeedbackType.incorrect &&
                                      questionState.answerSubmitted)
                                  ? "Incorrect"
                                  : null,
                        ),
                        onChanged: learnNotifier.updateUserAnswer,
                        onSubmitted: (_) => _onSubmit(learnNotifier),
                        readOnly: questionState.answerSubmitted,
                        autofocus: true,
                      ),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed:
                          questionState.answerSubmitted
                              ? null
                              : () => _onSubmit(learnNotifier),
                      child: const Text("Submit"),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                if (questionState.feedbackMessage.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: _getFeedbackColor(
                        context,
                        questionState.feedbackType,
                      ).withAlpha(15),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: _getFeedbackColor(
                          context,
                          questionState.feedbackType,
                        ).withAlpha(45),
                      ),
                    ),
                    child: Text(
                      questionState.feedbackMessage,
                      textAlign: TextAlign.center,
                      style: textTheme.titleMedium?.copyWith(
                        color: _getFeedbackColor(
                          context,
                          questionState.feedbackType,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 24),

                if (!questionState.answerSubmitted)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton.icon(
                        icon: const Icon(Icons.lightbulb_outline),
                        label: const Text("Hint"),
                        onPressed: learnNotifier.showHint,
                        style: OutlinedButton.styleFrom(
                          foregroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      OutlinedButton.icon(
                        icon: const Icon(Icons.skip_next),
                        label: const Text("Show & Skip"),
                        onPressed: learnNotifier.skipQuestionAndShowAnswer,
                      ),
                    ],
                  ),
                const SizedBox(height: 40),
                OutlinedButton(
                  onPressed: () {
                    ref
                        .read(currentScreenProvider.notifier)
                        .goTo(AppScreen.modeSelection);
                  },
                  child: const Text("Change Mode / Options"),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) {
          _log.severe("Error in learnControllerProvider", err, stack);
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Error in Learn Mode: $err",
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          );
        },
      ),
    );
  }
}
