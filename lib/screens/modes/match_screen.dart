import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../providers/controllers/match_controller.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';
import 'match_leaderboard_screen.dart';

final _log = Logger("MatchScreen");

@RoutePage()
class MatchScreen extends ConsumerStatefulWidget {
  const MatchScreen({super.key});

  @override
  ConsumerState<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends ConsumerState<MatchScreen> {
  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !context.router.canPop()) {
          final currentRoutes = context.router.stack
              .map((e) => e.name)
              .toList();
          if (currentRoutes.isEmpty || currentRoutes.first != StartRoute.name) {
            if (ref.read(activeStudyListIdProvider) != null) {
              context.router.replaceAll([
                const StartRoute(),
                const ModeSelectionRoute(),
                const MatchRoute(),
              ]);
            }
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<MatchScreenState>>(matchControllerProvider, (
      prev,
      next,
    ) {
      final isComplete = next.value?.isComplete ?? false;
      final finalRecord = next.value?.finalRecord;
      if (isComplete && finalRecord != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) {
            ref.invalidate(matchRecordsProvider(finalRecord.studyListName));

            context.router.replace(
              MatchLeaderboardRoute(newRecord: finalRecord),
            );
          }
        });
      }
    });

    if (kIsWeb && !context.router.canPop()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ref.read(activeStudyListIdProvider) != null && context.mounted) {
          context.router.replaceAll([
            const StartRoute(),
            const ModeSelectionRoute(),
            const MatchRoute(),
          ]);
        }
      });
    }

    final t = Translations.of(context);
    final activeListAsync = ref.watch(activeStudyListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(t.matchScreen.title), centerTitle: true),
      body: SafeArea(
        child: activeListAsync.when(
          data: (list) {
            if (list == null) {
              return Center(
                child: CenteredView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          t.modeSelectionScreen.noActiveList,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            ref
                                .read(activeStudyListIdProvider.notifier)
                                .set(null);
                            context.router.replaceAll([const StartRoute()]);
                          },
                          child: Text(t.modeSelectionScreen.returnToWelcome),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            return const _MatchView();
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) {
            _log.severe(
              "Error loading active list for MatchScreen",
              err,
              stack,
            );
            return Center(
              child: Text(t.general.genericError(error: err.toString())),
            );
          },
        ),
      ),
    );
  }
}

class _TimerDisplay extends ConsumerWidget {
  const _TimerDisplay();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeString = ref.watch(matchTimerProvider);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer_outlined, size: 20),
          const SizedBox(width: 8),
          Text(timeString, style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}

class _MatchView extends ConsumerWidget {
  const _MatchView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final matchStateAsync = ref.watch(matchControllerProvider);
    final t = Translations.of(context);

    return matchStateAsync.when(
      data: (state) {
        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }
        if (state.items.isEmpty || state.isComplete) {
          return const Center(child: CircularProgressIndicator());
        }

        return Column(
          children: [
            const _TimerDisplay(),
            Expanded(
              child: CenteredView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      const double spacing = 12.0;
                      final itemCount = state.items.length;
                      if (itemCount == 0) return const SizedBox.shrink();

                      final screenRatio =
                          constraints.maxWidth / constraints.maxHeight;
                      final idealCols = sqrt(itemCount * screenRatio);
                      final cols = max(2, idealCols.round());
                      final rows = (itemCount / cols).ceil();

                      final cardWidth =
                          (constraints.maxWidth - (cols - 1) * spacing) / cols;
                      final cardHeight =
                          (constraints.maxHeight - (rows - 1) * spacing) / rows;
                      final aspectRatio = cardHeight > 0
                          ? cardWidth / cardHeight
                          : 1.0;

                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: cols,
                          crossAxisSpacing: spacing,
                          mainAxisSpacing: spacing,
                          childAspectRatio: aspectRatio,
                        ),
                        itemCount: itemCount,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          final isSelected =
                              state.selectedItem?.uniqueId == item.uniqueId;
                          final isMatched = state.matchedPairIds.contains(
                            item.pairId,
                          );
                          final isIncorrect = state.incorrectPair.contains(
                            item.uniqueId,
                          );

                          return _MatchCard(
                            item: item,
                            isSelected: isSelected,
                            isMatched: isMatched,
                            isIncorrect: isIncorrect,
                            onTap: () => ref
                                .read(matchControllerProvider.notifier)
                                .selectItem(item),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) =>
          Center(child: Text(t.general.genericError(error: err.toString()))),
    );
  }
}

class _MatchCard extends StatelessWidget {
  const _MatchCard({
    required this.item,
    required this.isSelected,
    required this.isMatched,
    required this.isIncorrect,
    required this.onTap,
  });

  final bool isIncorrect;
  final bool isMatched;
  final bool isSelected;
  final MatchItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    Color cardColor = colorScheme.surfaceContainerHighest;
    Color textColor = colorScheme.onSurfaceVariant;
    Border? border;

    if (isIncorrect) {
      cardColor = colorScheme.errorContainer;
      textColor = colorScheme.onErrorContainer;
    } else if (isSelected) {
      cardColor = colorScheme.primaryContainer;
      textColor = colorScheme.onPrimaryContainer;
      border = Border.all(color: colorScheme.primary, width: 2.0);
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: isMatched ? 0.0 : 1.0,
      child: IgnorePointer(
        ignoring: isMatched,
        child: Card(
          margin: EdgeInsets.zero,
          elevation: isSelected ? 4.0 : 1.0,
          color: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: border != null
                ? border.top
                : BorderSide(color: colorScheme.outlineVariant),
          ),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.text,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(color: textColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
