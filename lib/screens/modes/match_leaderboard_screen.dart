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
class MatchLeaderboardScreen extends ConsumerWidget {
  const MatchLeaderboardScreen({
    required this.studyListName,
    required this.newRecordCreatedAt,
    super.key,
  });

  final DateTime newRecordCreatedAt;
  final String studyListName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kIsWeb && !context.router.canPop()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ref.read(activeStudyListIdProvider) != null && context.mounted) {
          context.router.replaceAll([
            const StartRoute(),
            const ModeSelectionRoute(),
            MatchLeaderboardRoute(
              studyListName: studyListName,
              newRecordCreatedAt: newRecordCreatedAt,
            ),
          ]);
        }
      });
    }

    final recordsAsync = ref.watch(matchRecordsProvider(studyListName));
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
                  studyListName,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: recordsAsync.when(
                    data: (records) {
                      if (records.isEmpty) {
                        return Center(
                          child: Text(t.matchScreen.leaderboard.noRecords),
                        );
                      }

                      final newRecordIndex = records.indexWhere(
                        (r) => r.createdAt == newRecordCreatedAt,
                      );

                      List<MatchRecord> displayRecords =
                          records.take(15).toList();

                      if (newRecordIndex >= 15) {
                        displayRecords.add(records[newRecordIndex]);
                      }

                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        itemCount: displayRecords.length,
                        itemBuilder: (context, index) {
                          final record = displayRecords[index];
                          final isNewRecord =
                              record.createdAt == newRecordCreatedAt;

                          final trueRank = records.indexOf(record) + 1;

                          final timeString = (record.timeInTenths / 10)
                              .toStringAsFixed(1);

                          return Card(
                            color:
                                isNewRecord
                                    ? theme.colorScheme.tertiaryContainer
                                    : null,
                            child: ListTile(
                              leading: Text(
                                "#$trueRank",
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
