import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/models/study_group.dart';
import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/widgets/error_snackbar.dart';

import '../../providers/core/core_providers.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';

final _log = Logger("LoadListScreen");

final studyGroupsProvider = StreamProvider<List<StudyGroup>>((ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.listenToStudyGroups();
});

enum _ListItemMenuAction { rename, move, delete }

enum _GroupMenuAction { delete }

@RoutePage()
class LoadListScreen extends ConsumerStatefulWidget {
  const LoadListScreen({super.key});

  @override
  ConsumerState<LoadListScreen> createState() => _LoadListScreenState();
}

class _LoadListScreenState extends ConsumerState<LoadListScreen> {
  final Set<String> _expandedGroupIds = {};
  bool _isSelectMode = false;
  final _searchController = TextEditingController();
  final Set<String> _selectedListIds = {};

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  Future<void> _handleBulkDelete() async {
    final t = Translations.of(context);
    final count = _selectedListIds.length;
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.loadListScreen.deleteListsDialog.title(count: count)),
        content: Text(t.loadListScreen.deleteListsDialog.content(count: count)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(t.general.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              t.general.delete,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      final db = ref.read(databaseServiceProvider);
      await db.deleteStudyLists(_selectedListIds.toList());
      _toggleSelectMode();
    }
  }

  Future<void> _handleGroupDelete(StudyGroup group) async {
    final t = Translations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.loadListScreen.deleteGroupDialog.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(t.loadListScreen.deleteGroupDialog.content(name: group.name)),
            const SizedBox(height: 16),
            Text(
              t.loadListScreen.deleteGroupDialog.warning,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(t.general.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(
              t.general.delete,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      await ref.read(databaseServiceProvider).deleteStudyGroup(group.id);
    }
  }

  void _onListSelected(String listId, bool? isSelected) {
    setState(() {
      if (isSelected == true) {
        _selectedListIds.add(listId);
      } else {
        _selectedListIds.remove(listId);
      }
    });
  }

  Future<void> _showCreateGroupDialog() async {
    final t = Translations.of(context);
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(t.loadListScreen.createGroupDialog.title),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: t.loadListScreen.createGroupDialog.hint,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return t.loadListScreen.createGroupDialog.errorEmpty;
                }
                return null;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(t.general.cancel),
              onPressed: () => Navigator.of(dialogContext).pop(),
            ),
            FilledButton(
              child: Text(t.loadListScreen.createGroupDialog.create),
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  final newGroup = StudyGroup(name: controller.text.trim());
                  await ref
                      .read(databaseServiceProvider)
                      .saveStudyGroup(newGroup);
                  if (dialogContext.mounted) Navigator.of(dialogContext).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMoveDialog(List<String> listIds) async {
    final t = Translations.of(context);
    final allGroups = ref.read(studyGroupsProvider).asData?.value ?? [];

    final String? destinationGroupId = await showDialog<String?>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            t.loadListScreen.moveToGroupDialog.title(count: listIds.length),
          ),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "ungrouped"),
              child: Text(t.loadListScreen.ungrouped),
            ),
            ...allGroups.map(
              (group) => SimpleDialogOption(
                onPressed: () => Navigator.pop(context, group.id),
                child: Text(group.name),
              ),
            ),
          ],
        );
      },
    );

    if (destinationGroupId != null && mounted) {
      final db = ref.read(databaseServiceProvider);
      await db.moveStudyListsToGroup(
        listIds,
        destinationGroupId == "ungrouped" ? null : destinationGroupId,
      );
      _toggleSelectMode();
    }
  }

  Future<void> _showRenameDialog(BuildContext context, StudyList list) async {
    final t = Translations.of(context);
    final controller = TextEditingController(text: list.name);
    final formKey = GlobalKey<FormState>();

    final didFail = await showDialog<bool>(
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
              onPressed: () => Navigator.of(dialogContext).pop(false),
            ),
            FilledButton(
              child: Text(t.startScreen.renameListDialog.rename),
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  final success = await ref
                      .read(databaseServiceProvider)
                      .renameStudyList(list.id, controller.text.trim());
                  if (dialogContext.mounted) {
                    Navigator.of(dialogContext).pop(!success);
                  }
                }
              },
            ),
          ],
        );
      },
    );

    if (didFail == true && context.mounted) {
      showErrorSnackBar(
        context,
        message: t.startScreen.renameListDialog.errorNameExists,
      );
    }
  }

  void _toggleSelectMode() {
    setState(() {
      _isSelectMode = !_isSelectMode;
      _selectedListIds.clear();
    });
  }

  AppBar _buildAppBar(BuildContext context, Translations t) {
    return AppBar(
      title: _isSelectMode
          ? Text(t.loadListScreen.itemsSelected(count: _selectedListIds.length))
          : Text(t.loadListScreen.title),
      centerTitle: true,
      leading: _isSelectMode
          ? IconButton(
              icon: const Icon(Icons.close),
              onPressed: _toggleSelectMode,
            )
          : null,
      actions: [
        if (!_isSelectMode)
          TextButton(
            onPressed: _toggleSelectMode,
            child: Text(t.loadListScreen.select),
          ),
      ],
    );
  }

  Widget _buildBottomActionBar(BuildContext context, Translations t) {
    final hasSelection = _selectedListIds.isNotEmpty;
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton.icon(
            icon: const Icon(Icons.drive_file_move_outline),
            label: Text(t.loadListScreen.move),
            onPressed: hasSelection
                ? () => _showMoveDialog(_selectedListIds.toList())
                : null,
          ),
          TextButton.icon(
            icon: Icon(
              Icons.delete_outline,
              color: hasSelection ? Theme.of(context).colorScheme.error : null,
            ),
            label: Text(
              t.general.delete,
              style: TextStyle(
                color: hasSelection
                    ? Theme.of(context).colorScheme.error
                    : null,
              ),
            ),
            onPressed: hasSelection ? _handleBulkDelete : null,
          ),
        ],
      ),
    );
  }

  Widget _buildFab(BuildContext context, Translations t) {
    return FloatingActionButton.extended(
      onPressed: _showCreateGroupDialog,
      label: Text(t.loadListScreen.createGroup),
      icon: const Icon(Icons.create_new_folder_outlined),
    );
  }

  Widget _buildGroupedListView(
    List<StudyList> lists,
    List<StudyGroup> groups,
    Translations t,
  ) {
    final groupedMap = lists.groupListsBy((list) => list.groupId);

    final List<StudyGroup> sortedGroups = List.from(groups)
      ..sort((a, b) => a.name.compareTo(b.name));

    return ListView(
      children: [
        _buildGroupExpansionTile(
          title: t.loadListScreen.ungrouped,
          lists: groupedMap[null] ?? [],
          t: t,
        ),
        ...sortedGroups.map((group) {
          return _buildGroupExpansionTile(
            title: group.name,
            groupId: group.id,
            lists: groupedMap[group.id] ?? [],
            t: t,
          );
        }),
      ],
    );
  }

  Widget _buildGroupExpansionTile({
    required String title,
    String? groupId,
    required List<StudyList> lists,
    required Translations t,
  }) {
    return ExpansionTile(
      key: ValueKey(groupId ?? 'ungrouped'),
      initiallyExpanded: _expandedGroupIds.contains(groupId ?? 'ungrouped'),
      onExpansionChanged: (isExpanded) {
        setState(() {
          if (isExpanded) {
            _expandedGroupIds.add(groupId ?? 'ungrouped');
          } else {
            _expandedGroupIds.remove(groupId ?? 'ungrouped');
          }
        });
      },
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (groupId != null)
            PopupMenuButton<_GroupMenuAction>(
              onSelected: (action) {
                final group = ref
                    .read(studyGroupsProvider)
                    .value!
                    .firstWhere((g) => g.id == groupId);
                if (action == _GroupMenuAction.delete) {
                  _handleGroupDelete(group);
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: _GroupMenuAction.delete,
                  child: Text(t.general.delete),
                ),
              ],
            ),
        ],
      ),
      children: lists
          .map((list) => _buildListCard(list, t, isDraggable: false))
          .toList(),
    );
  }

  Widget _buildListCard(
    StudyList list,
    Translations t, {
    bool isDraggable = true,
    int index = 0,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = _selectedListIds.contains(list.id);

    return Hero(
      key: ValueKey(list.id),
      tag: list.id,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Material(
          type: MaterialType.transparency,
          child: ListTile(
            leading: isDraggable
                ? ReorderableDragStartListener(
                    index: index,
                    child: const Icon(Icons.drag_handle),
                  )
                : (_isSelectMode
                      ? Checkbox(
                          value: isSelected,
                          onChanged: (val) => _onListSelected(list.id, val),
                        )
                      : const Icon(Icons.article_outlined)),
            onTap: () {
              if (_isSelectMode) {
                _onListSelected(list.id, !isSelected);
              } else {
                ref.read(activeStudyListIdProvider.notifier).set(list.id);
                context.router.push(const ModeSelectionRoute());
                list.lastOpenedAt = DateTime.now();
                ref.read(databaseServiceProvider).saveStudyList(list).ignore();
              }
            },
            title: Text(
              list.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(t.startScreen.termCount(count: list.terms.length)),
            trailing: _isSelectMode
                ? null
                : PopupMenuButton<_ListItemMenuAction>(
                    onSelected: (action) {
                      switch (action) {
                        case _ListItemMenuAction.rename:
                          _showRenameDialog(context, list);
                          break;
                        case _ListItemMenuAction.move:
                          _showMoveDialog([list.id]);
                          break;
                        case _ListItemMenuAction.delete:
                          ref
                              .read(databaseServiceProvider)
                              .deleteStudyList(list.id);
                          break;
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: _ListItemMenuAction.rename,
                        child: Text(t.startScreen.renameListDialog.rename),
                      ),
                      PopupMenuItem(
                        value: _ListItemMenuAction.move,
                        child: Text(t.loadListScreen.move),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem(
                        value: _ListItemMenuAction.delete,
                        child: Text(
                          t.general.delete,
                          style: TextStyle(color: colorScheme.error),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResultsView(List<StudyList> lists, Translations t) {
    final searchQuery = _searchController.text.toLowerCase();
    final filteredLists = lists
        .where((list) => list.name.toLowerCase().contains(searchQuery))
        .toList();

    if (filteredLists.isEmpty) {
      return Center(child: Text(t.loadListScreen.noMatches));
    }

    return ReorderableListView.builder(
      buildDefaultDragHandles: false,
      itemCount: filteredLists.length,
      itemBuilder: (context, index) {
        final list = filteredLists[index];
        return _buildListCard(
          list,
          t,
          index: index,
          isDraggable: !_isSelectMode,
        );
      },
      onReorder: (int oldIndex, int newIndex) {
        final originalOldIndex = lists.indexOf(filteredLists[oldIndex]);
        final originalNewIndex = newIndex < filteredLists.length
            ? lists.indexOf(filteredLists[newIndex])
            : lists.length;
        ref
            .read(studyListsProvider.notifier)
            .reorder(originalOldIndex, originalNewIndex);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && !context.router.canPop()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.router.replaceAll([
            const StartRoute(),
            const LoadListRoute(),
          ]);
        }
      });
    }

    final t = Translations.of(context);
    final isSearching = _searchController.text.isNotEmpty;

    return Scaffold(
      appBar: _buildAppBar(context, t),
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
                  child: Consumer(
                    builder: (context, ref, child) {
                      final listsAsync = ref.watch(studyListsProvider);
                      final groupsAsync = ref.watch(studyGroupsProvider);

                      return listsAsync.when(
                        data: (lists) {
                          return groupsAsync.when(
                            data: (groups) {
                              if (lists.isEmpty) {
                                return Center(
                                  child: Text(t.startScreen.noLists),
                                );
                              }
                              if (isSearching) {
                                return _buildSearchResultsView(lists, t);
                              } else {
                                return _buildGroupedListView(lists, groups, t);
                              }
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (err, stack) {
                              _log.severe("Error loading groups", err, stack);
                              return Center(
                                child: Text(
                                  t.general.genericError(error: err.toString()),
                                ),
                              );
                            },
                          );
                        },
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                        error: (err, stack) {
                          _log.severe("Error loading lists", err, stack);
                          return Center(
                            child: Text(
                              t.general.genericError(error: err.toString()),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _isSelectMode
          ? _buildBottomActionBar(context, t)
          : null,
      floatingActionButton: !_isSelectMode && !isSearching
          ? _buildFab(context, t)
          : null,
    );
  }
}
