import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../models/enums/enums.dart';
import '../../providers/controllers/test_controller.dart';
import '../../widgets/centered_view.dart';

@RoutePage(name: "TestModeRoute")
class TestScreen extends ConsumerStatefulWidget {
  const TestScreen({super.key});

  @override
  ConsumerState<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends ConsumerState<TestScreen> {
  static final _log = Logger("TestScreen");

  final Map<int, TextEditingController> _writtenAnswerControllers = {};

  @override
  void dispose() {
    for (var controller in _writtenAnswerControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _initializeControllers(List<TestQuestion> questions) {
    if (_writtenAnswerControllers.isNotEmpty) return;

    for (int i = 0; i < questions.length; i++) {
      if (ref.read(testControllerProvider).value?.testFormat ==
          TestFormat.written) {
        _writtenAnswerControllers[i] = TextEditingController(
          text: questions[i].userAnswerText ?? '',
        );
      }
    }
  }

  Widget _buildMultipleChoiceOption(
    BuildContext context,
    String option,
    TestQuestion question,
    int questionIndex,
    TestController notifier,
    bool isSubmitted,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final bool isSelected = question.userAnswerText == option;
    final bool isCorrectAnswer = option == question.correctAnswerText;

    Color? tileColor;
    Color? textColor;
    Icon? resultIcon;

    if (isSubmitted) {
      if (isCorrectAnswer) {
        tileColor = colorScheme.primary.withOpacity(0.15);
        textColor = colorScheme.primary;
        resultIcon = Icon(Icons.check_circle, color: textColor);
      } else if (isSelected && !isCorrectAnswer) {
        tileColor = colorScheme.error.withOpacity(0.15);
        textColor = colorScheme.error;
        resultIcon = Icon(Icons.cancel, color: textColor);
      } else {
        textColor = colorScheme.onSurfaceVariant;
      }
    } else {
      if (isSelected) {
        tileColor = colorScheme.primaryContainer;
        textColor = colorScheme.onPrimaryContainer;
      }
    }

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      color: tileColor ?? colorScheme.surfaceContainerHighest.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side:
            isSelected && !isSubmitted
                ? BorderSide(color: colorScheme.primary, width: 1.5)
                : BorderSide.none,
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap:
            isSubmitted
                ? null
                : () => notifier.updateUserAnswer(questionIndex, option),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              if (resultIcon != null) ...[
                resultIcon,
                const SizedBox(width: 12),
              ] else
                Radio<String>(
                  value: option,
                  groupValue: question.userAnswerText,
                  onChanged:
                      isSubmitted
                          ? null
                          : (_) =>
                              notifier.updateUserAnswer(questionIndex, option),
                ),
              Expanded(
                child: Text(
                  option,
                  style: textTheme.bodyLarge?.copyWith(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionItem(
    BuildContext context,
    TestQuestion question,
    int index,
    TestController notifier,
    TestScreenState screenState,
  ) {
    final isSubmitted = screenState.isSubmitted;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final t = Translations.of(context);
    Color? cardBorderColor;

    if (isSubmitted) {
      cardBorderColor =
          question.isCorrect == true ? colorScheme.primary : colorScheme.error;
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side:
            cardBorderColor != null
                ? BorderSide(color: cardBorderColor, width: 1.5)
                : BorderSide(color: colorScheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                text: "${index + 1}. ",
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                children: [
                  TextSpan(
                    text: question.questionText,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.normal,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            if (screenState.testFormat == TestFormat.written)
              TextField(
                controller: _writtenAnswerControllers[index],
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: t.learnScreen.answerHint,
                ),
                onChanged: (value) => notifier.updateUserAnswer(index, value),
                readOnly: isSubmitted,
              )
            else if (screenState.testFormat == TestFormat.mc &&
                question.multipleChoiceOptions != null)
              Column(
                children:
                    question.multipleChoiceOptions!
                        .map(
                          (option) => _buildMultipleChoiceOption(
                            context,
                            option,
                            question,
                            index,
                            notifier,
                            isSubmitted,
                          ),
                        )
                        .toList(),
              ),

            if (isSubmitted && question.isCorrect == false)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text.rich(
                  TextSpan(
                    text:
                        "${t.resultsScreen.reviewIncorrect.split(':').first}: ",
                    style: textTheme.titleSmall?.copyWith(
                      color: colorScheme.primary,
                    ),
                    children: [
                      TextSpan(
                        text: question.correctAnswerText,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final testStateAsync = ref.watch(testControllerProvider);
    final testNotifier = ref.read(testControllerProvider.notifier);
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.testScreen.title), centerTitle: true),
      body: SafeArea(
        child: testStateAsync.when(
          data: (state) {
            if (state.errorMessage != null) {
              return Center(
                child: CenteredView(
                  child: Text(
                    state.errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              );
            }
            if (state.questions.isEmpty && !state.isLoading) {
              return Center(child: Text(t.testScreen.noQuestions));
            }

            if (state.questions.isNotEmpty &&
                state.testFormat == TestFormat.written) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) _initializeControllers(state.questions);
              });
            }

            return CenteredView(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: state.questions.length,
                      itemBuilder: (context, index) {
                        final question = state.questions[index];
                        return _buildQuestionItem(
                          context,
                          question,
                          index,
                          testNotifier,
                          state,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: SizedBox(
                      width: double.infinity,
                      child:
                          state.isSubmitted
                              ? FilledButton.icon(
                                icon: const Icon(Icons.bar_chart),
                                onPressed:
                                    () => context.router.push(
                                      const ResultsRoute(),
                                    ),
                                label: Text(t.testScreen.viewResults),
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                ),
                              )
                              : FilledButton.icon(
                                icon: const Icon(Icons.check_circle_outline),
                                onPressed:
                                    state.questions.isEmpty
                                        ? null
                                        : () {
                                          FocusScope.of(context).unfocus();
                                          testNotifier.submitTest();
                                        },
                                label: Text(t.testScreen.submitTest),
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                ),
                              ),
                    ),
                  ),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            _log.severe("Error in testControllerProvider", err, stack);
            return Center(
              child: CenteredView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    t.general.genericError(error: err.toString()),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
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
