import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/i18n/translations.g.dart';
import 'package:quizlone/models/match_record.dart';
import 'package:quizlone/providers/core/core_providers.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/widgets/centered_view.dart';

import '../../providers/controllers/match_controller.dart';
import '../../providers/study/study_list_providers.dart';

final matchRecordsProvider = FutureProvider.family<List<MatchRecord>, String>((
  ref,
  studyListName,
) {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.getRecordsForList(studyListName);
});

@RoutePage()
class MatchLeaderboardScreen extends ConsumerStatefulWidget {
  const MatchLeaderboardScreen({required this.newRecord, super.key});

  final MatchRecord newRecord;

  @override
  ConsumerState<MatchLeaderboardScreen> createState() =>
      _MatchLeaderboardScreenState();
}

class _MatchLeaderboardScreenState extends ConsumerState<MatchLeaderboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final GlobalKey _newRecordKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
  }

  void _scrollToNewRecord(int newRecordDisplayIndex) {
    if (!mounted ||
        newRecordDisplayIndex == -1 ||
        !_scrollController.hasClients) {
      return;
    }

    if (newRecordDisplayIndex < 5) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      return;
    }

    final context = _newRecordKey.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
        alignment: 0.5,
      );
    } else {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      Future.delayed(const Duration(milliseconds: 100), () {
        final newContext = _newRecordKey.currentContext;
        if (newContext != null && newContext.mounted) {
          Scrollable.ensureVisible(
            newContext,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInOut,
            alignment: 0.5,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && !context.router.canPop()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ref.read(activeStudyListIdProvider) != null && context.mounted) {
          context.router.replaceAll([
            const StartRoute(),
            const ModeSelectionRoute(),
            MatchLeaderboardRoute(newRecord: widget.newRecord),
          ]);
        }
      });
    }

    final recordsAsync = ref.watch(
      matchRecordsProvider(widget.newRecord.studyListName),
    );
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.matchScreen.leaderboard.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CenteredView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  t.matchScreen.congratulations,
                  style: theme.textTheme.displaySmall,
                  textAlign: TextAlign.center,
                ),
                Text(
                  widget.newRecord.studyListName,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: recordsAsync.when(
                    data: (records) {
                      _animationController.forward(from: 0.0);

                      final newRecord = widget.newRecord;
                      final topRecordsFromDb = List.of(records);

                      final List<MatchRecord> displayRecords =
                          topRecordsFromDb.take(15).toList();

                      final isNewRecordInDisplayList = displayRecords.any(
                        (r) => r.createdAt == newRecord.createdAt,
                      );

                      if (!isNewRecordInDisplayList) {
                        displayRecords.add(newRecord);
                      }

                      final newRecordDisplayIndex = displayRecords.indexWhere(
                        (r) => r.createdAt == newRecord.createdAt,
                      );

                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) => _scrollToNewRecord(newRecordDisplayIndex),
                      );

                      if (displayRecords.isEmpty) {
                        return Center(
                          child: Text(t.matchScreen.leaderboard.noRecords),
                        );
                      }

                      return ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        itemCount: displayRecords.length,
                        itemBuilder: (context, index) {
                          final record = displayRecords[index];
                          final isNewRecord =
                              record.createdAt == newRecord.createdAt;
                          final timeString = (record.timeInTenths / 10)
                              .toStringAsFixed(1);

                          final trueRankIndex = topRecordsFromDb.indexOf(
                            record,
                          );
                          final String rankText =
                              trueRankIndex != -1
                                  ? "#${trueRankIndex + 1}"
                                  : ">100";

                          final animation = CurvedAnimation(
                            parent: _animationController,
                            curve: Interval(
                              (0.05 * index).clamp(0.0, 1.0),
                              (0.5 + 0.05 * index).clamp(0.0, 1.0),
                              curve: Curves.easeOutCubic,
                            ),
                          );

                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.3, 0),
                                end: Offset.zero,
                              ).animate(animation),
                              child: Card(
                                key: isNewRecord ? _newRecordKey : null,
                                color:
                                    isNewRecord
                                        ? theme.colorScheme.tertiaryContainer
                                        : null,
                                child: ListTile(
                                  leading: Text(
                                    rankText,
                                    style: theme.textTheme.titleLarge?.copyWith(
                                      color: theme.colorScheme.secondary,
                                    ),
                                  ),
                                  title: Text(
                                    t.matchScreen.leaderboard.time(
                                      time: timeString,
                                    ),
                                    style: theme.textTheme.titleMedium,
                                  ),
                                  trailing:
                                      isNewRecord
                                          ? Icon(
                                            Icons.star,
                                            color: theme.colorScheme.tertiary,
                                          )
                                          : null,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    error:
                        (e, s) => Center(
                          child: Text(
                            t.general.genericError(error: e.toString()),
                          ),
                        ),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  icon: const Icon(Icons.restart_alt),
                  label: Text(t.matchScreen.playAgain),
                  onPressed: () {
                    ref.invalidate(matchControllerProvider);
                    context.router.replace(const MatchRoute());
                  },
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed:
                      () => context.router.popUntilRouteWithName(
                        ModeSelectionRoute.name,
                      ),
                  child: Text(t.matchScreen.backToOptions),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
