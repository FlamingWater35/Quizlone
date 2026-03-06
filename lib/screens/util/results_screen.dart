import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../providers/controllers/flashcard_controller.dart';
import '../../providers/controllers/test_controller.dart';
import '../../providers/core/core_providers.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';

@RoutePage()
class ResultsScreen extends ConsumerStatefulWidget {
  const ResultsScreen({super.key});

  static final _log = Logger("ResultScreen");

  @override
  ConsumerState<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends ConsumerState<ResultsScreen> {
  bool _isLoadingHistory = false;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _isLoadingHistory = true;
      _initWebHistory();
    }
  }

  Future<void> _initWebHistory() async {
    try {
      final state = await ref.read(testControllerProvider.future);

      if (mounted) {
        if (!state.isSubmitted) {
          await _loadLatestResult(isInitialWebLoad: true);
        } else {
          setState(() => _isLoadingHistory = false);
        }
      }
    } catch (e) {
      ResultsScreen._log.warning("Error initializing web history", e);
      if (mounted) setState(() => _isLoadingHistory = false);
    }
  }

  Future<void> _loadLatestResult({bool isInitialWebLoad = false}) async {
    final activeId = ref.read(activeStudyListIdProvider);

    if (activeId == null) {
      if (mounted) setState(() => _isLoadingHistory = false);
      return;
    }

    if (!isInitialWebLoad) {
      setState(() => _isLoadingHistory = true);
    }

    try {
      final latest = await ref
          .read(databaseServiceProvider)
          .getLatestTestRecord(activeId);

      if (latest != null && mounted) {
        ref.read(testControllerProvider.notifier).loadHistoricalRecord(latest);
      }
    } catch (e) {
      ResultsScreen._log.warning("Failed to load latest result", e);
    } finally {
      if (mounted) setState(() => _isLoadingHistory = false);
    }
  }

  Future<void> _showHistoryDialog() async {
    final t = Translations.of(context);
    final activeId = ref.read(activeStudyListIdProvider);
    if (activeId == null) return;

    final db = ref.read(databaseServiceProvider);
    final records = await db.getTestRecordsForList(activeId);
    final dateFormat = DateFormat.yMMMd().add_jm();

    if (!mounted) return;

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.resultsScreen.history.title),
        content: SizedBox(
          width: double.maxFinite,
          child: records.isEmpty
              ? Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    t.resultsScreen.history.noRecords,
                    textAlign: TextAlign.center,
                  ),
                )
              : ListView.separated(
                  shrinkWrap: true,
                  itemCount: records.length,
                  separatorBuilder: (_, _) => const Divider(),
                  itemBuilder: (context, index) {
                    final record = records[index];
                    final percentage = record.totalQuestions > 0
                        ? (record.score / record.totalQuestions * 100).round()
                        : 0;

                    return ListTile(
                      title: Text(dateFormat.format(record.createdAt)),
                      subtitle: Text(
                        t.resultsScreen.scoreFraction(
                          score: record.score,
                          total: record.totalQuestions,
                        ),
                      ),
                      trailing: Text(
                        "$percentage%",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: percentage == 100
                              ? Theme.of(context).colorScheme.primary
                              : null,
                        ),
                      ),
                      onTap: () {
                        ref
                            .read(testControllerProvider.notifier)
                            .loadHistoricalRecord(record);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(t.general.cancel),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final testStateAsync = ref.watch(testControllerProvider);
    final testNotifier = ref.read(testControllerProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final t = Translations.of(context);

    if (_isLoadingHistory) {
      return Scaffold(
        appBar: AppBar(
          title: Text(t.resultsScreen.title),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.resultsScreen.title),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            tooltip: t.resultsScreen.history.title,
            onPressed: _showHistoryDialog,
          ),
        ],
      ),
      body: SafeArea(
        child: testStateAsync.when(
          data: (state) {
            if (!state.isSubmitted) {
              return Center(
                child: CenteredView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history_edu,
                          size: 64,
                          color: colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          t.resultsScreen.notSubmitted,
                          style: textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        FilledButton(
                          onPressed: () {
                            context.router.popUntilRouteWithName(
                              ModeSelectionRoute.name,
                            );
                          },
                          child: Text(t.modeSelectionScreen.title),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            if (state.questions.isEmpty) {
              return Center(child: Text(t.resultsScreen.noQuestions));
            }

            final score = state.score;
            final total = state.totalQuestions;
            final percentage = total > 0 ? (score / total * 100).round() : 0;
            final incorrectAnswers = state.incorrectAnswers;
            final bool isPerfectScore = score == total && total > 0;

            return CenteredView(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      t.resultsScreen.yourScore,
                      style: textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "$percentage%",
                      style: textTheme.displayLarge?.copyWith(
                        color: isPerfectScore
                            ? colorScheme.primary
                            : colorScheme.onSurface,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      t.resultsScreen.scoreFraction(score: score, total: total),
                      style: textTheme.titleLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    if (incorrectAnswers.isNotEmpty) ...[
                      Text(
                        t.resultsScreen.reviewIncorrect,
                        style: textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      ...incorrectAnswers.map((item) {
                        return Card(
                          color: colorScheme.error.withAlpha(15),
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: colorScheme.error.withAlpha(40),
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.questionText,
                                  style: textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.onSurface,
                                  ),
                                ),
                                const Divider(height: 24),
                                Text.rich(
                                  TextSpan(
                                    text:
                                        "${t.resultsScreen.yourAnswerWas(answer: '')} ",
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            item.userAnswerText ??
                                            t.resultsScreen.noAnswer,
                                        style: TextStyle(
                                          color: colorScheme.error,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text.rich(
                                  TextSpan(
                                    text:
                                        "${t.resultsScreen.reviewIncorrect.split(':').first}: ",
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: item.correctAnswerText,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.primary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ] else if (total > 0) ...[
                      Icon(
                        Icons.check_circle_outline,
                        color: colorScheme.primary,
                        size: 60,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        t.resultsScreen.congratulations,
                        style: textTheme.headlineSmall?.copyWith(
                          color: colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],

                    const SizedBox(height: 48),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            context.router.popUntilRouteWithName(
                              ModeSelectionRoute.name,
                            );
                          },
                          child: Text(t.modeSelectionScreen.title),
                        ),
                        const SizedBox(width: 16),
                        FilledButton.icon(
                          icon: const Icon(Icons.restart_alt),
                          label: Text(t.resultsScreen.retryTest),
                          onPressed: () {
                            testNotifier.restartTest();
                            context.router.replace(const TestModeRoute());
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    TextButton.icon(
                      icon: const Icon(Icons.style_outlined),
                      label: Text(t.resultsScreen.reviewFlashcards),
                      onPressed: () {
                        ref
                            .read(flashcardControllerProvider.notifier)
                            .refreshWithOptions();
                        context.router.replace(const FlashcardRoute());
                      },
                    ),
                  ],
                ),
              ),
            );
          },
          loading: () => Center(child: Text(t.general.loading)),
          error: (err, stack) {
            ResultsScreen._log.severe(
              "Error in testControllerProvider for ResultsScreen",
              err,
              stack,
            );
            return Center(
              child: CenteredView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        t.general.genericError(error: err.toString()),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: colorScheme.error),
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
          },
        ),
      ),
    );
  }
}
