import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/widgets/error_snackbar.dart';

import '../../providers/core/core_providers.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';

final _log = Logger("LoadListScreen");

@RoutePage()
class LoadListScreen extends ConsumerStatefulWidget {
  const LoadListScreen({super.key});

  @override
  ConsumerState<LoadListScreen> createState() => _LoadListScreenState();
}

class _LoadListScreenState extends ConsumerState<LoadListScreen> {
  List<StudyList> _currentLists = [];
  final Set<String> _justAddedItemIds = {};
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _currentLists = ref.read(studyListsProvider).asData?.value ?? [];
    _searchController.addListener(() {
      setState(() {});
    });
  }

  Future<void> _showRenameDialog(
    BuildContext context,
    WidgetRef ref,
    StudyList list,
  ) async {
    final t = Translations.of(context);
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
                      .renameStudyList(list.id, newName);

                  if (success) {
                    if (context.mounted) {
                      Navigator.of(dialogContext).pop();
                    }
                  } else {
                    if (context.mounted) {
                      showErrorSnackBar(
                        context,
                        message: t.startScreen.renameListDialog.errorNameExists,
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
    ref.listen<AsyncValue<List<StudyList>>>(studyListsProvider, (
      previous,
      next,
    ) {
      final prevList = previous?.asData?.value ?? _currentLists;
      final newList = next.asData?.value ?? [];

      final prevIds = prevList.map((e) => e.id).toSet();
      final newIds = newList.map((e) => e.id).toSet();

      final addedIds = newIds.difference(prevIds);

      if (addedIds.isNotEmpty && mounted) {
        setState(() {
          _justAddedItemIds.addAll(addedIds);
        });
      }

      _currentLists = newList;
    });

    final studyListsAsync = ref.watch(studyListsProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.loadListScreen.title), centerTitle: true),
      body: SafeArea(
        child: CenteredView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: t.loadListScreen.searchHint,
                      prefixIcon: const Icon(Icons.search),
                      border: const OutlineInputBorder(),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: studyListsAsync.when(
                    data: (lists) {
                      final searchQuery = _searchController.text.toLowerCase();
                      final filteredLists = lists
                          .where(
                            (list) =>
                                list.name.toLowerCase().contains(searchQuery),
                          )
                          .toList();

                      if (lists.isEmpty) {
                        return Center(child: Text(t.startScreen.noLists));
                      }

                      if (filteredLists.isEmpty) {
                        return Center(child: Text(t.loadListScreen.noMatches));
                      }

                      return ReorderableListView.builder(
                        buildDefaultDragHandles: false,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        itemCount: filteredLists.length,
                        itemBuilder: (context, index) {
                          final list = filteredLists[index];
                          final isNew = _justAddedItemIds.contains(list.id);

                          final cardItem = Hero(
                            key: ValueKey(list.id),
                            tag: list.id,
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
                                  onTap: () {
                                    ref
                                        .read(
                                          activeStudyListIdProvider.notifier,
                                        )
                                        .set(list.id);
                                    if (context.mounted) {
                                      context.router.push(
                                        const ModeSelectionRoute(),
                                      );
                                    }

                                    list.lastOpenedAt = DateTime.now();
                                    ref
                                        .read(databaseServiceProvider)
                                        .saveStudyList(list)
                                        .catchError((e, s) {
                                          _log.severe(
                                            "Failed to save lastOpenedAt in background",
                                            e,
                                            s,
                                          );
                                          return list.id;
                                        });
                                  },
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.edit_outlined),
                                        tooltip: t
                                            .startScreen
                                            .renameListDialog
                                            .rename,
                                        onPressed: () => _showRenameDialog(
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
                                          final confirm =
                                              await showDialog<bool>(
                                                context: context,
                                                builder: (ctx) => AlertDialog(
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
                                                      onPressed: () =>
                                                          Navigator.of(
                                                            ctx,
                                                          ).pop(false),
                                                      child: Text(
                                                        t.general.cancel,
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.of(
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
                                                list.id) {
                                              ref
                                                  .read(
                                                    activeStudyListIdProvider
                                                        .notifier,
                                                  )
                                                  .set(null);
                                            }
                                            await ref
                                                .read(databaseServiceProvider)
                                                .deleteStudyList(list.id);
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );

                          if (isNew) {
                            return _AnimateInWrapper(
                              key: ValueKey('${list.id}_anim'),
                              onAnimationComplete: () {
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  if (mounted) {
                                    setState(() {
                                      _justAddedItemIds.remove(list.id);
                                    });
                                  }
                                });
                              },
                              child: cardItem,
                            );
                          }
                          return cardItem;
                        },
                        onReorder: (int oldIndex, int newIndex) {
                          final originalOldIndex = lists.indexOf(
                            filteredLists[oldIndex],
                          );
                          int originalNewIndex;

                          if (newIndex < filteredLists.length) {
                            originalNewIndex = lists.indexOf(
                              filteredLists[newIndex],
                            );
                          } else {
                            originalNewIndex = lists.length;
                          }

                          ref
                              .read(studyListsProvider.notifier)
                              .reorder(originalOldIndex, originalNewIndex);
                        },
                      );
                    },
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (err, stack) {
                      _log.severe(
                        "Error in studyListsProvider for LoadListScreen",
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

class _AnimateInWrapper extends StatefulWidget {
  const _AnimateInWrapper({
    super.key,
    required this.child,
    required this.onAnimationComplete,
  });

  final Widget child;
  final VoidCallback onAnimationComplete;

  @override
  State<_AnimateInWrapper> createState() => __AnimateInWrapperState();
}

class __AnimateInWrapperState extends State<_AnimateInWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimationComplete();
      }
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
