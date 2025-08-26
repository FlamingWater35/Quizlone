import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../providers/core/core_providers.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';

final _log = Logger("StartScreen");

@RoutePage()
class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final studyListsAsync = ref.watch(studyListsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Quizlone"), centerTitle: true),
      body: SafeArea(
        child: CenteredView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Welcome!",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    ref.invalidate(studyListFormNotifierProvider);
                    context.router.push(const InputRoute());
                  },
                  child: const Text("Create New List"),
                ),
                const SizedBox(height: 40),
                Text(
                  "Load Saved List",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: studyListsAsync.when(
                    data: (lists) {
                      if (lists.isEmpty) {
                        return const Center(child: Text("No lists saved yet."));
                      }
                      return ListView.builder(
                        itemCount: lists.length,
                        itemBuilder: (context, index) {
                          final list = lists[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              title: Text(list.name),
                              subtitle: Text(
                                "${list.terms.length} terms - Created: ${list.createdAt.toLocal().toString().substring(0, 16)}",
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.play_arrow),
                                    tooltip: "Load",
                                    onPressed: () {
                                      ref
                                          .read(
                                            activeStudyListIdProvider.notifier,
                                          )
                                          .set(list.name);
                                      _log.fine(
                                        "StartScreen: Set activeStudyListIdProvider to ${list.name}",
                                      );
                                      context.router.push(
                                        const ModeSelectionRoute(),
                                      );
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color:
                                          Theme.of(context).colorScheme.error,
                                    ),
                                    tooltip: "Delete",
                                    onPressed: () async {
                                      final confirm = await showDialog<bool>(
                                        context: context,
                                        builder:
                                            (ctx) => AlertDialog(
                                              title: const Text(
                                                "Confirm Delete",
                                              ),
                                              content: Text(
                                                "Are you sure you want to delete '${list.name}'?",
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed:
                                                      () => Navigator.of(
                                                        ctx,
                                                      ).pop(false),
                                                  child: const Text("Cancel"),
                                                ),
                                                TextButton(
                                                  onPressed:
                                                      () => Navigator.of(
                                                        ctx,
                                                      ).pop(true),
                                                  child: Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                      color:
                                                          Theme.of(
                                                            context,
                                                          ).colorScheme.error,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                      );
                                      if (confirm == true) {
                                        await ref
                                            .read(databaseServiceProvider)
                                            .deleteStudyList(list.name);
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    error: (err, stack) {
                      _log.severe(
                        "Error in studyListsProvider for StartScreen",
                        err,
                        stack,
                      );
                      return Center(child: Text("Error: $err"));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
