import 'package:animated_list_plus/animated_list_plus.dart';
import 'package:animated_list_plus/transitions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/models/study_group.dart';
import 'package:quizlone/models/study_list.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/services/smooth_scroll.dart';
import 'package:quizlone/widgets/error_snackbar.dart';
import 'package:quizlone/widgets/web_aware_back_button.dart';

import '../../providers/core/core_providers.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';

final studyGroupsProvider = StreamProvider<List<StudyGroup>>((ref) {
  final dbService = ref.watch(databaseServiceProvider);
  return dbService.listenToStudyGroups();
});

enum _ListItemMenuAction { rename, move, delete }

enum _GroupMenuAction { rename, delete }

enum _SortOption { none, name, lastOpened, createdAt, listLength }

extension _SortOptionExtension on _SortOption {
  String getDisplayName(Translations t) {
    switch (this) {
      case _SortOption.none:
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
  _SortOption _currentSort = _SortOption.none;
  final Set<String> _expandedGroupIds = {};
  bool _isSelectMode = false;
  final _listScrollController = SmoothScrollController();
  final _searchController = TextEditingController();
  final Set<String> _selectedListIds = {};
  bool _sortAscending = true;

  @override
  void dispose() {
    _searchController.dispose();
    _listScrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  void _toggleSelectMode() {
    setState(() {
      _isSelectMode = !_isSelectMode;
      _selectedListIds.clear();
    });
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
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(t.general.delete),
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
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(t.general.delete),
          ),
        ],
      ),
    );

    if (confirm == true && mounted) {
      await ref.read(databaseServiceProvider).deleteStudyGroup(group.id);
    }
  }

  Future<void> _showCreateGroupDialog() async {
    final t = Translations.of(context);
    final controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    await showDialog<void>(
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
                border: const OutlineInputBorder(),
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

  Future<void> _showRenameGroupDialog(StudyGroup group) async {
    final t = Translations.of(context);
    final controller = TextEditingController(text: group.name);
    final formKey = GlobalKey<FormState>();

    await showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(t.startScreen.renameListDialog.rename),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: t.loadListScreen.createGroupDialog.hint,
                border: const OutlineInputBorder(),
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
              child: Text(t.startScreen.renameListDialog.rename),
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  await ref
                      .read(databaseServiceProvider)
                      .renameStudyGroup(group.id, controller.text.trim());
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
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(t.loadListScreen.ungrouped),
              ),
            ),
            if (allGroups.isNotEmpty) const Divider(),
            ...allGroups.map(
              (group) => SimpleDialogOption(
                onPressed: () => Navigator.pop(context, group.id),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(group.name),
                ),
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
      if (_isSelectMode) _toggleSelectMode();
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
              decoration: InputDecoration(
                labelText: t.inputScreen.listName,
                border: const OutlineInputBorder(),
              ),
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

  PreferredSizeWidget _buildAppBar(BuildContext context, Translations t) {
    if (_isSelectMode) {
      return AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(
          t.loadListScreen.itemsSelected(count: _selectedListIds.length),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          onPressed: _toggleSelectMode,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: Theme.of(context).colorScheme.error,
            ),
            tooltip: t.general.delete,
            onPressed: _selectedListIds.isNotEmpty
                ? () => _handleBulkDelete()
                : null,
          ),
          IconButton(
            icon: Icon(
              Icons.drive_file_move_outline,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            tooltip: t.loadListScreen.move,
            onPressed: _selectedListIds.isNotEmpty
                ? () => _showMoveDialog(_selectedListIds.toList())
                : null,
          ),
          const SizedBox(width: 4)
        ],
      );
    }

    return AppBar(
      leading: const WebAwareBackButton(fallback: StartRoute()),
      title: Text(t.loadListScreen.title),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.create_new_folder_outlined),
          tooltip: t.loadListScreen.createGroup,
          onPressed: _showCreateGroupDialog,
        ),
        IconButton(
          icon: const Icon(Icons.checklist),
          tooltip: t.loadListScreen.select,
          onPressed: _toggleSelectMode,
        ),
        const SizedBox(width: 4)
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context, Translations t) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: t.loadListScreen.searchHint,
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_searchController.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
              PopupMenuButton<_SortOption>(
                icon: Icon(
                  _currentSort == _SortOption.none
                      ? Icons.sort
                      : Icons.filter_list,
                  color: _currentSort != _SortOption.none
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                tooltip: t.loadListScreen.sortLabel,
                onSelected: (option) {
                  setState(() {
                    if (_currentSort == option && option != _SortOption.none) {
                      _sortAscending = !_sortAscending;
                    } else {
                      _currentSort = option;
                      switch (option) {
                        case _SortOption.name:
                          _sortAscending = true;
                          break;
                        default:
                          _sortAscending = false;
                      }
                    }
                  });
                },
                itemBuilder: (context) {
                  return _SortOption.values.map((option) {
                    final isSelected = _currentSort == option;
                    return CheckedPopupMenuItem(
                      value: option,
                      checked: isSelected,
                      child: Row(
                        children: [
                          Text(option.getDisplayName(t)),
                          if (isSelected && option != _SortOption.none) ...[
                            const SizedBox(width: 8),
                            Icon(
                              _sortAscending
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              size: 16,
                            ),
                          ],
                        ],
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildListTile(StudyList list, Translations t, {bool fade = false}) {
    final colorScheme = Theme.of(context).colorScheme;
    final isSelected = _selectedListIds.contains(list.id);

    final card = Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: isSelected ? 2 : 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? BorderSide(color: colorScheme.primary, width: 2)
            : BorderSide.none,
      ),
      color: isSelected
          ? colorScheme.primaryContainer.withAlpha(50)
          : colorScheme.surfaceContainerLow,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
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
        onLongPress: () {
          if (!_isSelectMode) {
            _toggleSelectMode();
            _onListSelected(list.id, true);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              if (_isSelectMode)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Checkbox(
                    value: isSelected,
                    onChanged: (val) => _onListSelected(list.id, val),
                  ),
                )
              else
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.article_outlined,
                    color: colorScheme.onPrimaryContainer,
                    size: 20,
                  ),
                ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      t.startScreen.termCount(count: list.terms.length),
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              if (!_isSelectMode)
                PopupMenuButton<_ListItemMenuAction>(
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
                      child: Row(
                        children: [
                          const Icon(Icons.edit_outlined, size: 20),
                          const SizedBox(width: 12),
                          Text(t.startScreen.renameListDialog.rename),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: _ListItemMenuAction.move,
                      child: Row(
                        children: [
                          const Icon(Icons.drive_file_move_outline, size: 20),
                          const SizedBox(width: 12),
                          Text(t.loadListScreen.move),
                        ],
                      ),
                    ),
                    const PopupMenuDivider(),
                    PopupMenuItem(
                      value: _ListItemMenuAction.delete,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: colorScheme.error,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            t.general.delete,
                            style: TextStyle(color: colorScheme.error),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );

    return fade ? card.animate().fadeIn(duration: 300.ms) : card;
  }

  Widget _buildGroupTile(
    String title,
    String? groupId,
    List<StudyList> lists,
    Translations t,
  ) {
    final bool isUngrouped = groupId == null;
    final String uniqueKey = groupId ?? 'ungrouped';
    final bool isExpanded = _expandedGroupIds.contains(uniqueKey);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: PageStorageKey(uniqueKey),
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              if (expanded) {
                _expandedGroupIds.add(uniqueKey);
              } else {
                _expandedGroupIds.remove(uniqueKey);
              }
            });
          },
          controlAffinity: ListTileControlAffinity.leading,
          title: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  lists.length.toString(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
              const Spacer(),
              if (!isUngrouped && !_isSelectMode)
                PopupMenuButton<_GroupMenuAction>(
                  onSelected: (action) async {
                    final group = ref
                        .read(studyGroupsProvider)
                        .value!
                        .firstWhere((g) => g.id == groupId);

                    if (action == _GroupMenuAction.rename) {
                      _showRenameGroupDialog(group);
                    } else if (action == _GroupMenuAction.delete) {
                      _handleGroupDelete(group);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: _GroupMenuAction.rename,
                      child: Row(
                        children: [
                          const Icon(Icons.edit_outlined, size: 20),
                          const SizedBox(width: 12),
                          Text(t.startScreen.renameListDialog.rename),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: _GroupMenuAction.delete,
                      child: Row(
                        children: [
                          Icon(
                            Icons.delete_outline,
                            color: Theme.of(context).colorScheme.error,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            t.general.delete,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
          children: lists.map((list) => _buildListTile(list, t)).toList(),
        ),
      ),
    );
  }

  List<StudyList> _processLists(List<StudyList> allLists) {
    List<StudyList> result = List.from(allLists);
    final query = _searchController.text.trim().toLowerCase();

    if (query.isNotEmpty) {
      result = result
          .where((l) => l.name.toLowerCase().contains(query))
          .toList();
    }

    if (_currentSort != _SortOption.none) {
      result.sort((a, b) {
        switch (_currentSort) {
          case _SortOption.name:
            return a.name.toLowerCase().compareTo(b.name.toLowerCase());
          case _SortOption.lastOpened:
            final dateA = a.lastOpenedAt ?? DateTime(1970);
            final dateB = b.lastOpenedAt ?? DateTime(1970);
            return dateA.compareTo(dateB);
          case _SortOption.createdAt:
            return a.createdAt.compareTo(b.createdAt);
          case _SortOption.listLength:
            return a.terms.length.compareTo(b.terms.length);
          case _SortOption.none:
            return 0;
        }
      });
      if (!_sortAscending) {
        result = result.reversed.toList();
      }
    }

    return result;
  }

  Widget _buildGroupedView(
    List<StudyList> allLists,
    List<StudyGroup> groups,
    Translations t,
  ) {
    final grouped = allLists.groupListsBy((l) => l.groupId);
    final sortedGroups = List.from(groups)
      ..sort((a, b) => a.name.compareTo(b.name));

    return ListView(
      controller: _listScrollController,
      padding: const EdgeInsets.only(bottom: 80),
      children: [
        if (grouped[null]?.isNotEmpty ?? false)
          _buildGroupTile(
            t.loadListScreen.ungrouped,
            null,
            grouped[null]!,
            t,
          ).animate().fadeIn(duration: 300.ms),
        ...sortedGroups.map((group) {
          final groupLists = grouped[group.id] ?? [];
          return _buildGroupTile(
            group.name,
            group.id,
            groupLists,
            t,
          ).animate().fadeIn(duration: 300.ms);
        }),
      ],
    );
  }

  Widget _buildFlatView(List<StudyList> processedLists, Translations t) {
    if (processedLists.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 48,
              color: Theme.of(context).disabledColor,
            ),
            const SizedBox(height: 16),
            Text(
              t.loadListScreen.noMatches,
              style: TextStyle(color: Theme.of(context).disabledColor),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                "${processedLists.length} results",
                style: Theme.of(
                  context,
                ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (_currentSort != _SortOption.none)
                Text(
                  "${_currentSort.getDisplayName(t)} (${_sortAscending ? 'Asc' : 'Desc'})",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
            ],
          ),
        ),
        Expanded(
          child: ImplicitlyAnimatedList<StudyList>(
            controller: _listScrollController,
            padding: const EdgeInsets.only(bottom: 80),
            items: processedLists,
            areItemsTheSame: (a, b) => a.id == b.id,
            itemBuilder: (context, animation, item, index) {
              return SizeFadeTransition(
                animation: animation,
                child: _buildListTile(item, t),
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    final isSearching = _searchController.text.isNotEmpty;
    final isSorting = _currentSort != _SortOption.none;
    final isFlatMode = isSearching || isSorting;

    return Scaffold(
      appBar: _buildAppBar(context, t),
      body: SafeArea(
        child: CenteredView(
          child: Column(
            children: [
              _buildSearchBar(context, t),
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    final listsAsync = ref.watch(studyListsProvider);
                    final groupsAsync = ref.watch(studyGroupsProvider);

                    return listsAsync.when(
                      data: (allLists) {
                        return groupsAsync.when(
                          data: (groups) {
                            if (allLists.isEmpty) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.folder_open,
                                      size: 48,
                                      color: Theme.of(context).disabledColor,
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      t.startScreen.noLists,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                              );
                            }

                            if (isFlatMode) {
                              final processed = _processLists(allLists);
                              return _buildFlatView(processed, t);
                            } else {
                              return _buildGroupedView(allLists, groups, t);
                            }
                          },
                          loading: () =>
                              const Center(child: CircularProgressIndicator()),
                          error: (e, s) => Center(
                            child: Text(
                              t.general.genericError(error: e.toString()),
                            ),
                          ),
                        );
                      },
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (e, s) => Center(
                        child: Text(
                          t.general.genericError(error: e.toString()),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
