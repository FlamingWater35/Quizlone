import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/providers/immutables/study_list_form_state.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/services/navigation_service.dart';
import 'package:quizlone/services/smooth_scroll.dart';

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

  Future<void> _showGroupSelectionDialog(
    BuildContext context,
    StudyListFormState formState,
    List<StudyGroup> groups,
    StudyListFormNotifier formNotifier,
  ) async {
    final t = Translations.of(context);
    final String? selectedId = await showDialog<String?>(
      context: context,
      builder: (context) {
        final dialogScrollController = SmoothScrollController();
        return AlertDialog(
          title: Text(t.inputScreen.assignToGroup),
          contentPadding: const EdgeInsets.only(top: 16, bottom: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Scrollbar(
              controller: dialogScrollController,
              thumbVisibility: true,
              child: ListView(
                controller: dialogScrollController,
                shrinkWrap: true,
                children: [
                  ListTile(
                    leading: const Icon(Icons.folder_off_outlined),
                    title: Text(t.loadListScreen.ungrouped),
                    selected: formState.selectedGroupId == null,
                    onTap: () {
                      Navigator.pop(context, "ungrouped");
                      dialogScrollController.dispose();
                    },
                  ),
                  if (groups.isNotEmpty) const Divider(height: 1),
                  ...groups.map(
                    (group) => ListTile(
                      leading: const Icon(Icons.folder_outlined),
                      title: Text(group.name),
                      selected: formState.selectedGroupId == group.id,
                      onTap: () {
                        Navigator.pop(context, group.id);
                        dialogScrollController.dispose();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                dialogScrollController.dispose();
              },
              child: Text(t.general.cancel),
            ),
          ],
        );
      },
    );

    if (selectedId != null && mounted) {
      formNotifier.setGroupId(selectedId == "ungrouped" ? null : selectedId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(studyListFormProvider);
    final formNotifier = ref.read(studyListFormProvider.notifier);
    final textTheme = Theme.of(context).textTheme;
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
            onPressed: () {
              ref.read(activeStudyListIdProvider.notifier).set(null);
              context.router.popUntilRoot();
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: SafeArea(
        child: CenteredView(
          child: SingleChildScrollView(
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
                    if (groups.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    return InkWell(
                      onTap: formState.isLoading
                          ? null
                          : () => _showGroupSelectionDialog(
                              context,
                              formState,
                              groups,
                              formNotifier,
                            ),
                      borderRadius: BorderRadius.circular(4),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: t.inputScreen.assignToGroup,
                          border: const OutlineInputBorder(),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              formState.selectedGroupId == null
                                  ? t.loadListScreen.ungrouped
                                  : groups
                                            .firstWhereOrNull(
                                              (g) =>
                                                  g.id ==
                                                  formState.selectedGroupId,
                                            )
                                            ?.name ??
                                        t.loadListScreen.ungrouped,
                              style: textTheme.bodyLarge,
                            ),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    );
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (err, stack) => const SizedBox.shrink(),
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
                            : () {
                                NavigationService.back(context);
                              },
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
                                  context.router.replace(
                                    const ModeSelectionRoute(),
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
