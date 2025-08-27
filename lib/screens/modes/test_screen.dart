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

  Map<int, TextEditingController> _writtenAnswerControllers = {};

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
    for (var controller in _writtenAnswerControllers.values) {
      controller.dispose();
    }
    _writtenAnswerControllers = {};
    for (int i = 0; i < questions.length; i++) {
      if (ref.read(testControllerProvider).value?.testFormat ==
          TestFormat.written) {
        _writtenAnswerControllers[i] = TextEditingController(
          text: questions[i].userAnswerText ?? '',
        );
      }
    }
  }

  Widget _buildQuestionItem(
    BuildContext context,
    TestQuestion question,
    int index,
    TestController notifier,
    TestScreenState screenState,
  ) {
    final bool isSubmitted = screenState.isSubmitted;
    final colorScheme = Theme.of(context).colorScheme;
    final t = Translations.of(context);
    Color? cardColor;
    InputDecoration inputDecoration;

    if (isSubmitted) {
      if (question.isCorrect == true) {
        cardColor = Colors.green.withAlpha(12);
        inputDecoration = InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700, width: 1.5),
          ),
        );
      } else {
        cardColor = colorScheme.errorContainer.withAlpha(24);
        inputDecoration = InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.error, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.error, width: 1.5),
          ),
        );
      }
    } else {
      inputDecoration = const InputDecoration();
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index + 1}. ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(question.questionText)),
              ],
            ),
            const SizedBox(height: 12),
            if (screenState.testFormat == TestFormat.written)
              TextField(
                controller: _writtenAnswerControllers[index],
                decoration: inputDecoration,
                onChanged: (value) => notifier.updateUserAnswer(index, value),
                readOnly: isSubmitted,
              )
            else if (screenState.testFormat == TestFormat.mc &&
                question.multipleChoiceOptions != null)
              Column(
                children:
                    question.multipleChoiceOptions!.map((option) {
                      bool isSelected = question.userAnswerText == option;
                      bool isActuallyCorrect =
                          option == question.correctAnswerText;
                      Color? tileColor;
                      Color? textColor;

                      if (isSubmitted) {
                        if (isActuallyCorrect) {
                          tileColor = Colors.green.withAlpha(20);
                          textColor = Colors.green.shade900;
                        } else if (isSelected && !isActuallyCorrect) {
                          tileColor = colorScheme.error.withAlpha(20);
                          textColor = colorScheme.error;
                        }
                      }

                      return RadioListTile<String>(
                        title: Text(
                          option,
                          style: TextStyle(
                            color: textColor,
                            fontWeight:
                                isActuallyCorrect && isSubmitted
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                          ),
                        ),
                        value: option,
                        groupValue: question.userAnswerText,
                        onChanged:
                            isSubmitted
                                ? null
                                : (value) {
                                  if (value != null) {
                                    notifier.updateUserAnswer(index, value);
                                  }
                                },
                        tileColor: tileColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                      );
                    }).toList(),
              ),
            if (isSubmitted && question.isCorrect == false)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text.rich(
                  TextSpan(
                    text:
                        "${t.resultsScreen.reviewIncorrect.split(':').first}: ",
                    style: TextStyle(color: Colors.green.shade800),
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
      appBar: AppBar(
        title: Text(t.testScreen.title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
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

            if (_writtenAnswerControllers.isEmpty &&
                state.questions.isNotEmpty &&
                state.testFormat == TestFormat.written) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  _initializeControllers(state.questions);
                  setState(() {});
                }
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
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: double.infinity,
                      child:
                          state.isSubmitted
                              ? ElevatedButton.icon(
                                icon: const Icon(Icons.bar_chart),
                                onPressed: () {
                                  context.router.push(const ResultsRoute());
                                },
                                label: Text(t.testScreen.viewResults),
                              )
                              : ElevatedButton.icon(
                                icon: const Icon(Icons.check_circle_outline),
                                onPressed:
                                    state.questions.isEmpty
                                        ? null
                                        : () {
                                          FocusScope.of(context).unfocus();
                                          testNotifier.submitTest();
                                        },
                                label: Text(t.testScreen.submitTest),
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
