import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/translations.g.dart';

import '../../providers/controllers/learn_controller.dart';
import '../../widgets/centered_view.dart';

@RoutePage()
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
    final t = Translations.of(context);
    return Center(
      child: CenteredView(
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
              ElevatedButton.icon(
                icon: const Icon(Icons.restart_alt),
                onPressed: notifier.refreshAndRestart,
                label: Text(t.learnScreen.restartSession),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => context.router.pop(),
                child: Text(t.learnScreen.backToOptions),
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
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(t.learnScreen.title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: learnStateAsync.when(
        data: (state) {
          if (state.errorMessage != null) {
            return Center(
              child: CenteredView(
                child: Text(
                  state.errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            );
          }
          if (state.isSessionComplete) {
            return _buildSessionCompleteUI(context, state, learnNotifier);
          }
          if (state.currentQuestion == null && !state.isLoading) {
            return Center(child: Text(t.learnScreen.preparing));
          }
          if (state.currentQuestion == null && state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          final questionState = state.currentQuestion!;

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
                  const SizedBox(height: 20),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            questionState.questionLabel,
                            style: textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            questionState.questionText,
                            style: textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _answerController,
                                  decoration: InputDecoration(
                                    hintText: t.learnScreen.answerHint,
                                    errorText:
                                        (questionState.feedbackType ==
                                                    LearnFeedbackType
                                                        .incorrect &&
                                                questionState.answerSubmitted)
                                            ? t.learnScreen.incorrect
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
                                child: Text(t.general.submit),
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
                                ).withAlpha(12),
                                borderRadius: BorderRadius.circular(12),
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
                                  label: Text(t.learnScreen.hint),
                                  onPressed: learnNotifier.showHint,
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor:
                                        Theme.of(context).colorScheme.secondary,
                                    side: BorderSide(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.secondary,
                                    ),
                                  ),
                                ),
                                OutlinedButton.icon(
                                  icon: const Icon(Icons.skip_next),
                                  label: Text(t.learnScreen.skip),
                                  onPressed:
                                      learnNotifier.skipQuestionAndShowAnswer,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.router.pop();
                      },
                      child: Text(t.learnScreen.backToModeSelection),
                    ),
                  ),
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
      ),
    );
  }
}
