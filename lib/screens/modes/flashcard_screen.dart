import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

import '../../providers/controllers/flashcard_controller.dart';
import '../../providers/core/navigation_provider.dart';
import '../../widgets/flashcard_widget.dart';

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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _log.fine("[FlashcardScreen] initState: Triggering refreshWithOptions");
        ref.read(flashcardControllerProvider.notifier).refreshWithOptions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final flashcardStateAsync = ref.watch(flashcardControllerProvider);
    final flashcardNotifier = ref.read(flashcardControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("4. Flashcards"),
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
        child: flashcardStateAsync.when(
          data: (state) {
            if (state.errorMessage != null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    state.errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }
            if (state.currentCard == null) {
              return const Center(child: Text("No flashcards to display."));
            }

            return Padding(
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
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error:
              (err, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Error: $err\n$stack",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ),
        ),
      ),
    );
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
            ref.read(currentScreenProvider.notifier).goTo(AppScreen.test);
          },
          child: const Text("Start Test"),
        ),
      ],
    );
  }
}
