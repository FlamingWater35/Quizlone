import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import '../../models/enums/enums.dart';
import '../../providers/controllers/test_controller.dart';
import '../../providers/core/navigation_provider.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _log.fine(
          "[TestScreen] initState: invalidating TestController to get fresh questions.",
        );
        ref.invalidate(testControllerProvider);
      }
    });
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
    InputDecoration? inputDecoration;

    if (isSubmitted) {
      if (question.isCorrect == true) {
        inputDecoration = InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green.shade700, width: 2),
          ),
          filled: true,
          fillColor: Colors.green.withAlpha(15),
        );
      } else {
        inputDecoration = InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.error.withAlpha(15),
        );
      }
    } else {
      inputDecoration = const InputDecoration(border: OutlineInputBorder());
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: isSubmitted ? 0 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side:
            isSubmitted
                ? BorderSide(
                  color:
                      question.isCorrect == true
                          ? Colors.green.shade300
                          : Theme.of(context).colorScheme.errorContainer,
                  width: 1.5,
                )
                : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
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
            const SizedBox(height: 10),
            if (screenState.testFormat == TestFormat.written)
              TextField(
                controller: _writtenAnswerControllers[index],
                decoration: inputDecoration.copyWith(
                  hintText: "Your answer...",
                ),
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
                      TextStyle? textStyle;

                      if (isSubmitted) {
                        if (isActuallyCorrect) {
                          tileColor = Colors.green.withAlpha(30);
                          textStyle = const TextStyle(
                            fontWeight: FontWeight.bold,
                          );
                        } else if (isSelected && !isActuallyCorrect) {
                          tileColor = Theme.of(
                            context,
                          ).colorScheme.error.withAlpha(30);
                        }
                      }

                      return RadioListTile<String>(
                        title: Text(option, style: textStyle),
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
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                      );
                    }).toList(),
              ),
            if (isSubmitted && question.isCorrect == false)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "Correct: ${question.correctAnswerText}",
                  style: TextStyle(
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.w500,
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

    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref
                .read(currentScreenProvider.notifier)
                .goTo(AppScreen.modeSelection);
          },
        ),
      ),
      body: SafeArea(
        child: testStateAsync.when(
          data: (state) {
            if (state.errorMessage != null) {
              return Center(
                child: Text(
                  state.errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              );
            }
            if (state.questions.isEmpty && !state.isLoading) {
              return const Center(child: Text("No questions for this test."));
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

            return Column(
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
                  child:
                      state.isSubmitted
                          ? ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(currentScreenProvider.notifier)
                                  .goTo(AppScreen.results);
                            },
                            child: const Text("View Results"),
                          )
                          : ElevatedButton(
                            onPressed:
                                state.questions.isEmpty
                                    ? null
                                    : () {
                                      FocusScope.of(context).unfocus();
                                      testNotifier.submitTest();
                                    },
                            child: const Text("Submit Test"),
                          ),
                ),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error:
              (err, stack) => Center(
                child: Text(
                  "Error: $err",
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
        ),
      ),
    );
  }
}
