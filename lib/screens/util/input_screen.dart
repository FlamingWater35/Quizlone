import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/providers/immutables/study_list_form_state.dart';
import 'package:quizlone/routing/app_navigator.dart';
import 'package:quizlone/services/smooth_scroll.dart';
import 'package:quizlone/widgets/error_snackbar.dart';

import '../../models/study_group.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';
import 'load_list_screen.dart';

@RoutePage()
class InputScreen extends ConsumerStatefulWidget {
  const InputScreen({super.key});
  @override
  ConsumerState<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends ConsumerState<InputScreen> {
  late TextEditingController _listNameController;
  final _scrollController = SmoothScrollController();
  late TextEditingController _termsInputController;

  @override
  void dispose() {
    _listNameController.dispose();
    _termsInputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    final initialFormState = ref.read(studyListFormProvider);
    _listNameController = TextEditingController(
      text: initialFormState.listNameInput,
    );
    _termsInputController = TextEditingController(
      text: initialFormState.rawTermsInput,
    );
  }

  /// Displays a modal to assign the new study list to an existing group or leave it ungrouped.
  Future<void> _showGroupSelectionDialog(
    BuildContext context,
    StudyListFormState formState,
    List<StudyGroup> groups,
    StudyListFormNotifier formNotifier,
  ) async {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    final String? selectedId = await showDialog<String?>(
      context: context,
      builder: (context) {
        final dialogScrollController = SmoothScrollController();
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      t.inputScreen.assignToGroup,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: Scrollbar(
                      controller: dialogScrollController,
                      thumbVisibility: true,
                      child: SmoothSingleChildScrollView(
                        controller: dialogScrollController,
                        child: Column(
                          children: [
                            _buildDialogOption(
                              context: context,
                              title: t.loadListScreen.ungrouped,
                              icon: Icons.folder_off_outlined,
                              isSelected: formState.selectedGroupId == null,
                              onTap: () => Navigator.pop(context, "ungrouped"),
                            ),
                            if (groups.isNotEmpty)
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 8,
                                ),
                                child: Divider(height: 1),
                              ),
                            ...groups.map(
                              (group) => _buildDialogOption(
                                context: context,
                                title: group.name,
                                icon: Icons.folder_outlined,
                                isSelected: formState.selectedGroupId == group.id,
                                onTap: () => Navigator.pop(context, group.id),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(t.general.cancel),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    if (selectedId != null && mounted) {
      formNotifier.setGroupId(selectedId == "ungrouped" ? null : selectedId);
    }
  }

  Widget _buildDialogOption({
    required BuildContext context,
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.onSurfaceVariant,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.onSurface,
          ),
        ),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: theme.colorScheme.primary)
            : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        tileColor: isSelected
            ? theme.colorScheme.primaryContainer.withAlpha(40)
            : null,
        onTap: onTap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(studyListFormProvider);
    final formNotifier = ref.read(studyListFormProvider.notifier);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final t = Translations.of(context);
    final groupsAsync = ref.watch(studyGroupsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(t.inputScreen.title),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            tooltip: t.modeSelectionScreen.returnToWelcome,
            onPressed: () => AppNavigator.navigateHome(context),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: CenteredView(
          child: SmoothSingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextField(
                  controller: _listNameController,
                  decoration: InputDecoration(
                    labelText: t.inputScreen.listName,
                    hintText: t.inputScreen.listNameHint,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.label_outline),
                    errorText:
                        (formState.errorMessage != null &&
                            formState.errorMessage!.toLowerCase().contains(
                              "list name",
                            ))
                        ? formState.errorMessage
                        : null,
                  ),
                  onChanged: formNotifier.setListName,
                  enabled: !formState.isLoading,
                ),
                const SizedBox(height: 16),
                groupsAsync.when(
                  data: (groups) {
                    if (groups.isEmpty) return const SizedBox.shrink();
                    final currentGroupName = formState.selectedGroupId == null
                        ? t.loadListScreen.ungrouped
                        : groups
                                  .firstWhereOrNull(
                                    (g) => g.id == formState.selectedGroupId,
                                  )
                                  ?.name ??
                              t.loadListScreen.ungrouped;

                    return InkWell(
                      onTap: formState.isLoading
                          ? null
                          : () => _showGroupSelectionDialog(
                              context,
                              formState,
                              groups,
                              formNotifier,
                            ),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.colorScheme.outline),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.folder_outlined,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    t.inputScreen.assignToGroup,
                                    style: textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                  Text(
                                    currentGroupName,
                                    style: textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (err, stack) =>
                      const SizedBox.shrink(), // Graceful degradation: hide group selector if groups fail to load
                ),
                const SizedBox(height: 24),
                Text(t.inputScreen.pasteTerms, style: textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  t.inputScreen.pasteTermsHint,
                  style: textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _termsInputController,
                  decoration: InputDecoration(
                    hintText: t.inputScreen.termsHint,
                    border: const OutlineInputBorder(),
                    alignLabelWithHint: true,
                    errorText:
                        (formState.errorMessage != null &&
                            !formState.errorMessage!.toLowerCase().contains(
                              "list name",
                            ))
                        ? formState.errorMessage
                        : null,
                  ),
                  maxLines: 10,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  onChanged: formNotifier.setRawTerms,
                  enabled: !formState.isLoading,
                ),
                const SizedBox(height: 24),
                if (formState.isLoading)
                  const Center(child: CircularProgressIndicator())
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      OutlinedButton.icon(
                        icon: const Icon(Icons.arrow_back),
                        label: Text(t.general.back),
                        onPressed: formState.isLoading
                            ? null
                            : () => AppNavigator.goBack(context),
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.save_alt),
                        label: Text(t.inputScreen.saveList),
                        onPressed: formState.isLoading
                            ? null
                            : () async {
                                FocusScope.of(context).unfocus();
                                final success = await formNotifier
                                    .saveListAndContinue();
                                if (success && context.mounted) {
                                  AppNavigator.replaceWithModeSelection(
                                    context,
                                  );
                                } else if (context.mounted &&
                                    formState.errorMessage != null) {
                                  // Fallback UI feedback if the notifier caught a non-validation DB error
                                  showErrorSnackBar(
                                    context,
                                    message: formState.errorMessage!,
                                  );
                                }
                              },
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
