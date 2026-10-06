import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/providers/core/core_providers.dart';
import 'package:quizlone/providers/study/study_list_providers.dart';
import 'package:quizlone/routing/app_navigator.dart';

import '../../widgets/centered_view.dart';
import '../../widgets/sidebar_widget.dart';

@RoutePage()
class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  /// Mirrors the load-list tile tap: make the list active, jump straight to
  /// mode selection, and record the open time so Recent ordering updates.
  void _openList(BuildContext context, WidgetRef ref, StudyList list) {
    ref.read(activeStudyListIdProvider.notifier).set(list.id);
    AppNavigator.pushModeSelection(context);
    list.lastOpenedAt = DateTime.now();
    ref.read(databaseServiceProvider).saveStudyList(list);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final recent = recentStudyLists(
      ref.watch(studyListsProvider).asData?.value ?? const [],
    );

    return Scaffold(
      appBar: AppBar(title: Text(t.startScreen.title), centerTitle: true),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: CenteredView(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24),
                Text(
                  t.startScreen.welcome,
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                _StartCard(
                  icon: Icons.add_circle_outline,
                  title: t.startScreen.createNewList,
                  subtitle: t.startScreen.createNewListSubtitle,
                  onTap: () => AppNavigator.pushCreateList(context, ref),
                ),
                const SizedBox(height: 12),
                _StartCard(
                  icon: Icons.folder_open_outlined,
                  title: t.startScreen.openSavedList,
                  subtitle: t.startScreen.openSavedListSubtitle,
                  onTap: () => AppNavigator.pushLoadList(context),
                ),
                if (recent.isNotEmpty) ...[
                  const SizedBox(height: 28),
                  Text(
                    t.startScreen.recent.toUpperCase(),
                    style: textTheme.labelLarge?.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  for (final list in recent)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _StartCard(
                        icon: Icons.article_outlined,
                        title: list.name,
                        trailing: t.startScreen.termCount(
                          count: list.terms.length,
                        ),
                        onTap: () => _openList(context, ref, list),
                      ),
                    ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// One row on the start screen: icon circle + title (+ optional subtitle or
/// trailing meta), styled to match the mode-selection cards.
class _StartCard extends StatelessWidget {
  const _StartCard({
    required this.icon,
    required this.title,
    required this.onTap,
    this.subtitle,
    this.trailing,
  });

  final IconData icon;
  final VoidCallback onTap;
  final String? subtitle;
  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colorScheme.outlineVariant.withAlpha(70)),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        mouseCursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  size: 22,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (trailing != null) ...[
                const SizedBox(width: 8),
                Text(
                  trailing!,
                  textAlign: TextAlign.right,
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
