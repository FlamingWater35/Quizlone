import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../providers/controllers/flashcard_controller.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';
import '../../widgets/flashcard_widget.dart';

@RoutePage()
class FlashcardScreen extends ConsumerWidget {
  const FlashcardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(t.flashcardScreen.title), centerTitle: true),
      body: const SafeArea(child: _FlashcardView()),
    );
  }
}

class _FlashcardView extends ConsumerStatefulWidget {
  const _FlashcardView();

  @override
  ConsumerState<_FlashcardView> createState() => _FlashcardViewState();
}

class _FlashcardViewState extends ConsumerState<_FlashcardView> {
  static final _log = Logger("FlashcardView");
  final FocusNode _focusNode = FocusNode();
  var _slideFromRight = true;

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  Widget _buildNavigationControls(
    BuildContext context,
    FlashcardController notifier,
    FlashcardScreenState state,
  ) {
    final t = Translations.of(context);
    final bool canGoPrev = state.currentIndex > 0;
    final bool canGoNext = state.currentIndex < state.displayTerms.length - 1;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.arrow_back),
                label: Text(t.general.previous),
                onPressed: canGoPrev ? notifier.previousCard : null,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.arrow_forward),
                label: Text(t.general.next),
                onPressed: canGoNext ? notifier.nextCard : null,
              ),
            ),
          ],
        ),
        const Divider(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.shuffle),
              tooltip: t.flashcardScreen.shuffle,
              onPressed: notifier.shuffleCards,
              iconSize: 28,
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(Icons.restart_alt),
              tooltip: t.flashcardScreen.restart,
              onPressed: notifier.restart,
              iconSize: 28,
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
    final t = Translations.of(context);

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

    return Focus(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (node, event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            flashcardNotifier.previousCard();
            return KeyEventResult.handled;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            flashcardNotifier.nextCard();
            return KeyEventResult.handled;
          }
          if (event.logicalKey == LogicalKeyboardKey.arrowUp ||
              event.logicalKey == LogicalKeyboardKey.arrowDown ||
              event.logicalKey == LogicalKeyboardKey.space) {
            flashcardNotifier.flipCard();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: flashcardStateAsync.when(
        data: (state) {
          if (state.errorMessage != null) {
            return Center(
              child: CenteredView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.errorMessage!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(activeStudyListIdProvider.notifier)
                              .set(null);
                          context.router.replace(const StartRoute());
                        },
                        child: Text(t.modeSelectionScreen.returnToWelcome),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          if (state.currentCard == null) {
            return Center(child: Text(t.flashcardScreen.noCards));
          }

          return CenteredView(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    state.currentProgress,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onHorizontalDragEnd: (details) {
                      if (details.primaryVelocity != null) {
                        if (details.primaryVelocity! < -100) {
                          flashcardNotifier.nextCard();
                        } else if (details.primaryVelocity! > 100) {
                          flashcardNotifier.previousCard();
                        }
                      }
                    },
                    onVerticalDragEnd: (details) {
                      if (details.primaryVelocity != null &&
                          details.primaryVelocity!.abs() > 100) {
                        flashcardNotifier.flipCard();
                      }
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            AnimatedSwitcher(
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
                                          ? const Offset(0.3, 0.0)
                                          : const Offset(-0.3, 0.0),
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
                            const SizedBox(height: 24),
                            _buildNavigationControls(
                              context,
                              flashcardNotifier,
                              state,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                  t.general.genericError(error: err.toString()),
                  textAlign: TextAlign.center,
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
