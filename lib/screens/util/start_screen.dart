import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/translations.g.dart';
import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../providers/core/core_providers.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';
import '../../widgets/sidebar_widget.dart';

final _log = Logger("StartScreen");

@RoutePage()
class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  List<StudyList>? _localLists;

  Future<void> _showRenameDialog(
    BuildContext context,
    WidgetRef ref,
    StudyList list,
  ) async {
    final t = Translations.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final controller = TextEditingController(text: list.name);
    final formKey = GlobalKey<FormState>();

    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(t.startScreen.renameListDialog.title),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(hintText: t.inputScreen.listName),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return t.startScreen.renameListDialog.errorNameEmpty;
                }
                return null;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(t.general.cancel),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            FilledButton(
              child: Text(t.startScreen.renameListDialog.rename),
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  final newName = controller.text.trim();
                  final oldName = list.name;

                  if (newName == oldName) {
                    Navigator.of(dialogContext).pop();
                    return;
                  }

                  final success = await ref
                      .read(databaseServiceProvider)
                      .renameStudyList(oldName, newName);

                  if (success) {
                    if (ref.read(activeStudyListIdProvider) == oldName) {
                      ref.read(activeStudyListIdProvider.notifier).set(newName);
                    }
                    if (context.mounted) {
                      Navigator.of(dialogContext).pop();
                    }
                  } else {
                    if (context.mounted) {
                      scaffoldMessenger.showSnackBar(
                        SnackBar(
                          content: Text(
                            t.startScreen.renameListDialog.errorNameExists,
                          ),
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                      );
                    }
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final studyListsAsync = ref.watch(studyListsProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.startScreen.title), centerTitle: true),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: CenteredView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  t.startScreen.welcome,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    ref.invalidate(studyListFormNotifierProvider);
                    context.router.push(const InputRoute());
                  },
                  label: Text(t.startScreen.createNewList),
                ),
                const SizedBox(height: 40),
                Text(
                  t.startScreen.loadSavedList,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: studyListsAsync.when(
                    data: (lists) {
                      final localKeys = _localLists?.map((l) => l.name).toSet();
                      final providerKeys = lists.map((l) => l.name).toSet();

                      if (_localLists == null ||
                          !providerKeys.containsAll(localKeys!) ||
                          !localKeys.containsAll(providerKeys)) {
                        _localLists = lists;
                      }

                      final displayLists = _localLists!;

                      if (displayLists.isEmpty) {
                        return Center(child: Text(t.startScreen.noLists));
                      }
                      return ReorderableListView.builder(
                        buildDefaultDragHandles: false,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        itemCount: displayLists.length,
                        itemBuilder: (context, index) {
                          final list = displayLists[index];
                          return Hero(
                            key: ValueKey(list.name),
                            tag: list.name,
                            child: Card(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              child: Material(
                                type: MaterialType.transparency,
                                child: ListTile(
                                  leading: ReorderableDragStartListener(
                                    index: index,
                                    child: const Icon(Icons.drag_handle),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  title: Text(
                                    list.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    t.startScreen.termCount(
                                      count: list.terms.length,
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  onTap: () async {
                                    list.lastOpenedAt = DateTime.now();
                                    await ref
                                        .read(databaseServiceProvider)
                                        .saveStudyList(list);
                                    ref
                                        .read(
                                          activeStudyListIdProvider.notifier,
                                        )
                                        .set(list.name);
                                    if (context.mounted) {
                                      context.router.push(
                                        const ModeSelectionRoute(),
                                      );
                                    }
                                  },
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit_outlined),
                                        tooltip:
                                            t
                                                .startScreen
                                                .renameListDialog
                                                .rename,
                                        onPressed:
                                            () => _showRenameDialog(
                                              context,
                                              ref,
                                              list,
                                            ),
                                      ),
                                      IconButton(
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: colorScheme.error,
                                        ),
                                        tooltip: t.general.delete,
                                        onPressed: () async {
                                          final confirm = await showDialog<
                                            bool
                                          >(
                                            context: context,
                                            builder:
                                                (ctx) => AlertDialog(
                                                  title: Text(
                                                    t
                                                        .startScreen
                                                        .confirmDeleteDialog
                                                        .title,
                                                  ),
                                                  content: Text(
                                                    t
                                                        .startScreen
                                                        .confirmDeleteDialog
                                                        .content(
                                                          listName: list.name,
                                                        ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed:
                                                          () => Navigator.of(
                                                            ctx,
                                                          ).pop(false),
                                                      child: Text(
                                                        t.general.cancel,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed:
                                                          () => Navigator.of(
                                                            ctx,
                                                          ).pop(true),
                                                      child: Text(
                                                        t.general.delete,
                                                        style: TextStyle(
                                                          color:
                                                              colorScheme.error,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          );
                                          if (confirm == true) {
                                            if (ref.read(
                                                  activeStudyListIdProvider,
                                                ) ==
                                                list.name) {
                                              ref
                                                  .read(
                                                    activeStudyListIdProvider
                                                        .notifier,
                                                  )
                                                  .set(null);
                                            }
                                            await ref
                                                .read(databaseServiceProvider)
                                                .deleteStudyList(list.name);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        onReorder: (int oldIndex, int newIndex) {
                          setState(() {
                            if (oldIndex < newIndex) {
                              newIndex -= 1;
                            }

                            final currentLists = List<StudyList>.from(
                              displayLists,
                            );
                            final movedList = currentLists.removeAt(oldIndex);
                            currentLists.insert(newIndex, movedList);
                            _localLists = currentLists;

                            final newOrderOfKeys =
                                currentLists.map((l) => l.name).toList();
                            ref
                                .read(databaseServiceProvider)
                                .saveStudyListOrder(newOrderOfKeys);
                          });
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
                      return Center(
                        child: Text(
                          t.general.genericError(error: err.toString()),
                        ),
                      );
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
