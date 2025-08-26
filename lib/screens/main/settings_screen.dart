import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_html/html.dart' as html;

import '../../models/study_list.dart';
import '../../providers/core/core_providers.dart';
import '../../providers/core/settings_provider.dart';
import '../../widgets/centered_view.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    final dbService = ref.read(databaseServiceProvider);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final lists = await dbService.getAllStudyLists();

    if (lists.isEmpty) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('There is no data to export.')),
      );
      return;
    }

    final jsonString = jsonEncode(lists.map((l) => l.toJson()).toList());

    try {
      if (kIsWeb) {
        final bytes = utf8.encode(jsonString);
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor =
            html.document.createElement('a') as html.AnchorElement
              ..href = url
              ..style.display = 'none'
              ..download = 'quizlone_backup.json';
        html.document.body?.children.add(anchor);
        anchor.click();
        html.document.body?.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      } else if (Platform.isAndroid || Platform.isIOS) {
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/quizlone_backup.json';
        final file = File(filePath);
        await file.writeAsString(jsonString);
        await SharePlus.instance.share(
          ShareParams(
            files: [XFile(filePath)],
            text: 'Here is your Quizlone backup.',
          ),
        );
      } else {
        final String? outputFile = await FilePicker.platform.saveFile(
          dialogTitle: 'Please select an output file:',
          fileName: 'quizlone_backup.json',
        );

        if (outputFile != null) {
          final file = File(outputFile);
          await file.writeAsString(jsonString);
          scaffoldMessenger.showSnackBar(
            const SnackBar(content: Text('Data exported successfully!')),
          );
        }
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Error exporting data: $e')),
      );
    }
  }

  Future<void> _importData(BuildContext context, WidgetRef ref) async {
    final dbService = ref.read(databaseServiceProvider);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final bool? confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Import'),
            content: const Text(
              'This will import study lists from a file. Any existing lists with the same name will be overwritten. Continue?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Import'),
              ),
            ],
          ),
    );

    if (confirm != true) return;

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: kIsWeb,
    );

    if (result != null) {
      try {
        String jsonString;
        if (kIsWeb) {
          final bytes = result.files.single.bytes;
          if (bytes == null) {
            throw Exception("Could not read file bytes on web.");
          }
          jsonString = utf8.decode(bytes);
        } else {
          final path = result.files.single.path;
          if (path == null) {
            throw Exception("File path is null on a non-web platform.");
          }
          final file = File(path);
          jsonString = await file.readAsString();
        }

        final List<dynamic> jsonList = jsonDecode(jsonString);
        final studyLists =
            jsonList.map((json) => StudyList.fromJson(json)).toList();

        for (var list in studyLists) {
          await dbService.saveStudyList(list);
        }
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('${studyLists.length} lists imported successfully!'),
          ),
        );
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(content: Text('Error importing data: $e')),
        );
      }
    }
  }

  Future<void> _deleteAllData(BuildContext context, WidgetRef ref) async {
    final dbService = ref.read(databaseServiceProvider);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final bool? confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Deletion'),
            content: const Text(
              'Are you sure you want to delete ALL study lists? This action cannot be undone.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  'Delete All',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
    );

    if (confirm == true) {
      await dbService.deleteAllStudyLists();
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('All study lists have been deleted.')),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(appThemeProvider);
    final themeNotifier = ref.read(appThemeProvider.notifier);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final roundedShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: SafeArea(
        child: CenteredView(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 8.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          'Appearance',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      const Divider(),
                      RadioListTile<ThemeMode>(
                        shape: roundedShape,
                        title: const Text('System Default'),
                        value: ThemeMode.system,
                        groupValue: currentTheme,
                        onChanged: (value) => themeNotifier.setTheme(value!),
                      ),
                      RadioListTile<ThemeMode>(
                        shape: roundedShape,
                        title: const Text('Light'),
                        value: ThemeMode.light,
                        groupValue: currentTheme,
                        onChanged: (value) => themeNotifier.setTheme(value!),
                      ),
                      RadioListTile<ThemeMode>(
                        shape: roundedShape,
                        title: const Text('Dark'),
                        value: ThemeMode.dark,
                        groupValue: currentTheme,
                        onChanged: (value) => themeNotifier.setTheme(value!),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 8.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          'Data Management',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        shape: roundedShape,
                        leading: const Icon(Icons.file_download_outlined),
                        title: const Text('Export Data'),
                        subtitle: const Text('Save all lists to a file'),
                        onTap: () => _exportData(context, ref),
                      ),
                      ListTile(
                        shape: roundedShape,
                        leading: const Icon(Icons.file_upload_outlined),
                        title: const Text('Import Data'),
                        subtitle: const Text('Load lists from a file'),
                        onTap: () => _importData(context, ref),
                      ),
                      const Divider(),
                      ListTile(
                        shape: roundedShape,
                        leading: Icon(
                          Icons.delete_forever_outlined,
                          color: colorScheme.error,
                        ),
                        title: Text(
                          'Delete All Data',
                          style: TextStyle(color: colorScheme.error),
                        ),
                        onTap: () => _deleteAllData(context, ref),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
