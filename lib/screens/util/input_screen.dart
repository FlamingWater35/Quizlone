import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/study/study_list_providers.dart';

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
    final initialFormState = ref.read(studyListFormNotifierProvider);
    _listNameController = TextEditingController(
      text: initialFormState.listNameInput,
    );
    _termsInputController = TextEditingController(
      text: initialFormState.rawTermsInput,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(studyListFormNotifierProvider);
    final formNotifier = ref.read(studyListFormNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("2. Enter Terms & Definitions"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: _listNameController,
                decoration: InputDecoration(
                  labelText: "List Name",
                  hintText: "e.g., Chapter 1 Vocabulary",
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
              const SizedBox(height: 24),
              Text(
                "Paste your terms below (Term on one line, Definition on the next):",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _termsInputController,
                decoration: InputDecoration(
                  hintText:
                      "Example:\nHTML\nHyperText Markup Language\nCSS\nCascading Style Sheets",
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
                      label: const Text("Back"),
                      onPressed:
                          formState.isLoading
                              ? null
                              : formNotifier.goBackToStart,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.save_alt),
                      label: const Text("Save and Continue"),
                      onPressed:
                          formState.isLoading
                              ? null
                              : () {
                                FocusScope.of(context).unfocus();
                                formNotifier.saveListAndContinue();
                              },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
