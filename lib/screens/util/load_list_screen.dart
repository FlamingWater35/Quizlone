import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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

enum _SortOption { custom, name, lastOpened, createdAt, listLength }

extension _SortOptionExtension on _SortOption {
  String getDisplayName(Translations t) {
    switch (this) {
      case _SortOption.custom:
        return t.loadListScreen.sortOptions.none;
      case _SortOption.name:
        return t.loadListScreen.sortOptions.name;
      case _SortOption.lastOpened:
        return t.loadListScreen.sortOptions.lastOpened;
      case _SortOption.createdAt:
        return t.loadListScreen.sortOptions.createdAt;
      case _SortOption.listLength:
        return t.loadListScreen.sortOptions.listLength;
    }
  }
}

@RoutePage()
class LoadListScreen extends ConsumerStatefulWidget {
  const LoadListScreen({super.key});

  @override
  ConsumerState<LoadListScreen> createState() => _LoadListScreenState();
}

class _LoadListScreenState extends ConsumerState<LoadListScreen> {
  _SortOption _currentSort = _SortOption.custom;
  final Set<String> _expandedGroupIds = {};
  bool _isSelectMode = false;
  bool _isSortAscending = true;
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

  void _onSortChanged(_SortOption? newSort) {
    if (newSort != null) {
      setState(() {
        if (_currentSort == newSort && newSort != _SortOption.custom) {
          _isSortAscending = !_isSortAscending;
        } else {
          _currentSort = newSort;
          switch (newSort) {
            case _SortOption.name:
            case _SortOption.custom:
              _isSortAscending = true;
              break;
            case _SortOption.lastOpened:
            case _SortOption.createdAt:
            case _SortOption.listLength:
              _isSortAscending = false;
              break;
          }
        }
      });
    }
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
      padding: const EdgeInsets.symmetric(horizontal: 14),
      children: [
        _buildGroupExpansionTile(
          title: t.loadListScreen.ungrouped,
          lists: groupedMap[null] ?? [],
          t: t,
          isUngroupedOnlyGroup: sortedGroups.isEmpty,
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
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildGroupExpansionTile({
    required String title,
    String? groupId,
    required List<StudyList> lists,
    required Translations t,
    bool isUngroupedOnlyGroup = false,
  }) {
    final isExpanded = _expandedGroupIds.contains(groupId ?? 'ungrouped');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: ExpansionTile(
        key: ValueKey(groupId ?? 'ungrouped'),
        initiallyExpanded: isUngroupedOnlyGroup || isExpanded,
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
        children: [
          Column(
            children: lists.asMap().entries.map((entry) {
              final index = entry.key;
              final list = entry.value;
              return _buildListCard(
                list,
                t,
              ).animate().fadeIn(duration: 300.ms, delay: (100 * index).ms);
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildListCard(StudyList list, Translations t) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = _selectedListIds.contains(list.id);

    return Hero(
      key: ValueKey(list.id),
      tag: list.id,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        color: Theme.of(context).colorScheme.secondaryContainer.withAlpha(76),
        child: Material(
          type: MaterialType.transparency,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            leading: _isSelectMode
                ? Checkbox(
                    value: isSelected,
                    onChanged: (val) => _onListSelected(list.id, val),
                  )
                : const Icon(Icons.article_outlined),
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

  List<StudyList> _getSortedLists(List<StudyList> lists) {
    List<StudyList> processedLists = List.from(lists);

    final searchQuery = _searchController.text.toLowerCase();
    if (searchQuery.isNotEmpty) {
      processedLists = processedLists
          .where((list) => list.name.toLowerCase().contains(searchQuery))
          .toList();
    }

    if (_currentSort == _SortOption.custom) {
      return processedLists;
    }

    Comparator<StudyList> comparator;
    switch (_currentSort) {
      case _SortOption.name:
        comparator = (a, b) =>
            a.name.toLowerCase().compareTo(b.name.toLowerCase());
        break;
      case _SortOption.lastOpened:
        comparator = (a, b) => (b.lastOpenedAt ?? DateTime(1970)).compareTo(
          a.lastOpenedAt ?? DateTime(1970),
        );
        break;
      case _SortOption.createdAt:
        comparator = (a, b) => b.createdAt.compareTo(a.createdAt);
        break;
      case _SortOption.listLength:
        comparator = (a, b) => b.terms.length.compareTo(a.terms.length);
        break;
      case _SortOption.custom:
        return processedLists;
    }

    processedLists.sort(comparator);
    return _isSortAscending ? processedLists : processedLists.reversed.toList();
  }

  Widget _buildSortedOrSearchedListView(List<StudyList> lists, Translations t) {
    final sortedLists = _getSortedLists(lists);

    if (sortedLists.isEmpty) {
      return Center(child: Text(t.loadListScreen.noMatches));
    }

    return ImplicitlyAnimatedList<StudyList>(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      items: sortedLists,
      areItemsTheSame: (a, b) => a.id == b.id,
      itemBuilder: (context, animation, item, index) {
        return SizeFadeTransition(
          animation: animation,
          child: _buildListCard(item, t),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isSearching = _searchController.text.isNotEmpty;
    final isCustomSort = _currentSort == _SortOption.custom;
    final showGroupedView = !isSearching && isCustomSort;

    return Scaffold(
      appBar: _buildAppBar(context, t),
      body: SafeArea(
        child: CenteredView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
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
                Card(
                  margin: const EdgeInsets.only(bottom: 8.0),
                  color: Theme.of(
                    context,
                  ).colorScheme.secondaryContainer.withAlpha(76),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              t.loadListScreen.sortLabel,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            const SizedBox(width: 8),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<_SortOption>(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                focusColor: Colors.transparent,
                                value: _currentSort,
                                items: _SortOption.values
                                    .map(
                                      (option) => DropdownMenuItem(
                                        value: option,
                                        child: Text(option.getDisplayName(t)),
                                      ),
                                    )
                                    .toList(),
                                onChanged: _onSortChanged,
                              ),
                            ),
                            if (_currentSort != _SortOption.custom)
                              IconButton(
                                icon: AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder: (child, animation) {
                                    return ScaleTransition(
                                      scale: animation,
                                      child: child,
                                    );
                                  },
                                  child: Icon(
                                    _isSortAscending
                                        ? Icons.arrow_upward
                                        : Icons.arrow_downward,
                                    key: ValueKey<bool>(_isSortAscending),
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isSortAscending = !_isSortAscending;
                                  });
                                },
                              ),
                          ],
                        ),
                        if (!_isSelectMode)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: TextButton(
                              onPressed: _toggleSelectMode,
                              child: Text(t.loadListScreen.select),
                            ),
                          ),
                      ],
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
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                child: showGroupedView
                                    ? _buildGroupedListView(lists, groups, t)
                                    : _buildSortedOrSearchedListView(lists, t),
                              );
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
      floatingActionButton: !_isSelectMode && showGroupedView
          ? _buildFab(context, t)
          : null,
    );
  }
}
