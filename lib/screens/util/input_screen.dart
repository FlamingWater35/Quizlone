import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';

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
  late TextEditingController _termsInputController;

  @override
  void dispose() {
    _listNameController.dispose();
    _termsInputController.dispose();
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

    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !context.router.canPop()) {
          final currentRoutes = context.router.stack
              .map((e) => e.name)
              .toList();
          if (currentRoutes.isEmpty || currentRoutes.first != StartRoute.name) {
            context.router.replaceAll([const StartRoute(), const InputRoute()]);
          }
        }
      });
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
      ),
      body: SafeArea(
        child: CenteredView(
          child: SingleChildScrollView(
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
                    return DropdownButtonFormField<String?>(
                      initialValue: formState.selectedGroupId,
                      decoration: InputDecoration(
                        labelText: t.inputScreen.assignToGroup,
                        border: const OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem<String?>(
                          value: null,
                          child: Text(t.loadListScreen.ungrouped),
                        ),
                        ...groups.map((StudyGroup group) {
                          return DropdownMenuItem<String?>(
                            value: group.id,
                            child: Text(group.name),
                          );
                        }),
                      ],
                      onChanged: formState.isLoading
                          ? null
                          : (String? newValue) {
                              formNotifier.setGroupId(newValue);
                            },
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
                                context.router.pop();
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
