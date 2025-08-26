import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../providers/controllers/flashcard_controller.dart';
import '../../widgets/centered_view.dart';
import '../../widgets/flashcard_widget.dart';

@RoutePage()
class FlashcardScreen extends ConsumerStatefulWidget {
  const FlashcardScreen({super.key});

  @override
  ConsumerState<FlashcardScreen> createState() => _FlashcardScreenState();
}

class _FlashcardScreenState extends ConsumerState<FlashcardScreen> {
  static final _log = Logger("FlashcardScreen");

  @override
  void initState() {
    super.initState();
  }

  Widget _buildNavigationControls(
    BuildContext context,
    FlashcardController notifier,
    FlashcardScreenState state,
  ) {
    final bool canGoPrev = state.currentIndex > 0;
    final bool canGoNext = state.currentIndex < state.displayTerms.length - 1;

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 550) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.restart_alt),
                      label: const Text("Restart"),
                      onPressed: notifier.restart,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton.icon(
                      icon: const Icon(Icons.shuffle),
                      label: const Text("Shuffle"),
                      onPressed: notifier.shuffleCards,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: canGoPrev ? notifier.previousCard : null,
                      child: const Text("Previous"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: canGoNext ? notifier.nextCard : null,
                      child: const Text("Next"),
                    ),
                  ),
                ],
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton.icon(
                icon: const Icon(Icons.restart_alt),
                label: const Text("Restart"),
                onPressed: notifier.restart,
              ),
              OutlinedButton(
                onPressed: canGoPrev ? notifier.previousCard : null,
                child: const Text("Previous"),
              ),
              OutlinedButton(
                onPressed: canGoNext ? notifier.nextCard : null,
                child: const Text("Next"),
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.shuffle),
                label: const Text("Shuffle"),
                onPressed: notifier.shuffleCards,
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildBottomControls(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            context.router.push(const TestModeRoute());
          },
          child: const Text("Start Test"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final flashcardStateAsync = ref.watch(flashcardControllerProvider);
    final flashcardNotifier = ref.read(flashcardControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flashcards"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      body: SafeArea(
        child: flashcardStateAsync.when(
          data: (state) {
            if (state.errorMessage != null) {
              return Center(
                child: CenteredView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      state.errorMessage!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              );
            }
            if (state.currentCard == null) {
              return const Center(child: Text("No flashcards to display."));
            }

            return CenteredView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      state.currentProgress,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: Center(
                        child: FlashcardWidget(
                          key: ValueKey(state.currentCard!.termText),
                          term: state.currentCard!,
                          isFlipped: state.isFlipped,
                          onTap: flashcardNotifier.flipCard,
                          startSide: state.startSide,
                          height: 300,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildNavigationControls(context, flashcardNotifier, state),
                    const SizedBox(height: 24),
                    _buildBottomControls(context, ref),
                  ],
                ),
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            _log.severe("Error in flashcardControllerProvider", err, stack);
            return Center(
              child: CenteredView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Error: $err",
                    textAlign: TextAlign.center,
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
