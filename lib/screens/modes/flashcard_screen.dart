import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

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
  var _slideFromRight = true;

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

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shuffle),
              tooltip: "Shuffle",
              onPressed: notifier.shuffleCards,
              iconSize: 28,
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.restart_alt),
              tooltip: "Restart",
              onPressed: notifier.restart,
              iconSize: 28,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: const Text("Previous"),
                onPressed: canGoPrev ? notifier.previousCard : null,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: const Text("Next"),
                onPressed: canGoNext ? notifier.nextCard : null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final flashcardStateAsync = ref.watch(flashcardControllerProvider);
    final flashcardNotifier = ref.read(flashcardControllerProvider.notifier);

    ref.listen<AsyncValue<FlashcardScreenState>>(flashcardControllerProvider, (
      prev,
      next,
    ) {
      final prevData = prev?.asData?.value;
      final nextData = next.asData?.value;

      if (prevData != null && nextData != null) {
        if (nextData.currentIndex > prevData.currentIndex) {
          if (mounted) setState(() => _slideFromRight = true);
        } else if (nextData.currentIndex < prevData.currentIndex) {
          if (mounted) setState(() => _slideFromRight = false);
        }
      }
    });

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
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 400),
                          transitionBuilder: (
                            Widget child,
                            Animation<double> animation,
                          ) {
                            final curvedAnimation = CurvedAnimation(
                              parent: animation,
                              curve: Curves.easeInOut,
                            );

                            final offsetAnimation = Tween<Offset>(
                              begin:
                                  _slideFromRight
                                      ? const Offset(1.0, 0.0)
                                      : const Offset(-1.0, 0.0),
                              end: Offset.zero,
                            ).animate(curvedAnimation);

                            final scaleAnimation = Tween<double>(
                              begin: 0.8,
                              end: 1.0,
                            ).animate(curvedAnimation);

                            return FadeTransition(
                              opacity: curvedAnimation,
                              child: ScaleTransition(
                                scale: scaleAnimation,
                                child: SlideTransition(
                                  position: offsetAnimation,
                                  child: child,
                                ),
                              ),
                            );
                          },
                          child: FlashcardWidget(
                            key: ValueKey(state.currentIndex),
                            term: state.currentCard!,
                            isFlipped: state.isFlipped,
                            onTap: flashcardNotifier.flipCard,
                            startSide: state.startSide,
                            height: 300,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    _buildNavigationControls(context, flashcardNotifier, state),
                    const SizedBox(height: 16),
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
