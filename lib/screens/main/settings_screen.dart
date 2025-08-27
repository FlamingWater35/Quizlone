import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizlone/i18n/translations.g.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_html/html.dart' as html;

import '../../models/study_list.dart';
import '../../providers/core/core_providers.dart';
import '../../providers/core/settings_provider.dart';
import '../../widgets/centered_view.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  String _getCurrentLanguageName(AppLanguage lang, Translations t) {
    switch (lang) {
      case AppLanguage.en:
        return t.settingsScreen.english;
      case AppLanguage.fi:
        return t.settingsScreen.finnish;
      case AppLanguage.system:
      default:
        return t.settingsScreen.systemDefault;
    }
  }

  void _showLanguagePicker(BuildContext context, WidgetRef ref) {
    final languageNotifier = ref.read(appLanguageNotifierProvider.notifier);
    final currentLanguage = ref.read(appLanguageNotifierProvider);
    final t = Translations.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(t.settingsScreen.languageDialogTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:
                  AppLanguage.values.map((lang) {
                    return RadioListTile<AppLanguage>(
                      title: Text(_getCurrentLanguageName(lang, t)),
                      value: lang,
                      groupValue: currentLanguage,
                      onChanged: (AppLanguage? newLang) {
                        if (newLang != null) {
                          languageNotifier.setLanguage(newLang);
                          Navigator.of(context).pop();
                        }
                      },
                    );
                  }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(t.general.cancel),
            ),
          ],
        );
      },
    );
  }

  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    final dbService = ref.read(databaseServiceProvider);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final t = Translations.of(context);
    final lists = await dbService.getAllStudyLists();

    if (lists.isEmpty) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text(t.settingsScreen.snackbars.noDataToExport)),
      );
      return;
    }

    final jsonString = jsonEncode(lists.map((l) => l.toJson()).toList());
    final bytes = utf8.encode(jsonString);
    const fileName = 'quizlone_backup.json';

    try {
      if (kIsWeb) {
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor =
            html.document.createElement('a') as html.AnchorElement
              ..href = url
              ..style.display = 'none'
              ..download = fileName;
        html.document.body?.children.add(anchor);
        anchor.click();
        html.document.body?.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      } else if (Platform.isAndroid && context.mounted) {
        await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                title: Text(t.settingsScreen.exportDialog.title),
                content: Text(t.settingsScreen.exportDialog.content),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      final tempDir = await getTemporaryDirectory();
                      final filePath = '${tempDir.path}/$fileName';
                      await File(filePath).writeAsBytes(bytes);
                      await SharePlus.instance.share(
                        ShareParams(
                          files: [XFile(filePath)],
                          text: 'Here is your Quizlone backup.',
                        ),
                      );
                    },
                    child: Text(t.settingsScreen.exportDialog.share),
                  ),
                  TextButton(
                    onPressed: () async {
                      Navigator.of(context).pop();
                      final filePath = await FlutterFileDialog.saveFile(
                        params: SaveFileDialogParams(
                          data: bytes,
                          fileName: fileName,
                        ),
                      );
                      if (filePath != null) {
                        scaffoldMessenger.showSnackBar(
                          SnackBar(
                            content: Text(t.settingsScreen.snackbars.fileSaved),
                          ),
                        );
                      }
                    },
                    child: Text(t.settingsScreen.exportDialog.save),
                  ),
                ],
              ),
        );
      } else if (Platform.isIOS) {
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/$fileName';
        await File(filePath).writeAsBytes(bytes);
        await SharePlus.instance.share(
          ShareParams(
            files: [XFile(filePath)],
            text: 'Here is your Quizlone backup.',
          ),
        );
      } else {
        final String? outputFile = await FilePicker.platform.saveFile(
          dialogTitle: 'Please select an output file:',
          fileName: fileName,
        );
        if (outputFile != null) {
          await File(outputFile).writeAsBytes(bytes);
          scaffoldMessenger.showSnackBar(
            SnackBar(content: Text(t.settingsScreen.snackbars.exportSuccess)),
          );
        }
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            t.settingsScreen.snackbars.exportError(error: e.toString()),
          ),
        ),
      );
    }
  }

  Future<void> _importData(BuildContext context, WidgetRef ref) async {
    final dbService = ref.read(databaseServiceProvider);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final t = Translations.of(context);

    final bool? confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(t.settingsScreen.importDialog.title),
            content: Text(t.settingsScreen.importDialog.content),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(t.general.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(t.settingsScreen.importDialog.import),
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
            content: Text(
              t.settingsScreen.snackbars.importSuccess(
                count: studyLists.length,
              ),
            ),
          ),
        );
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              t.settingsScreen.snackbars.importError(error: e.toString()),
            ),
          ),
        );
      }
    }
  }

  Future<void> _deleteAllData(BuildContext context, WidgetRef ref) async {
    final dbService = ref.read(databaseServiceProvider);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final t = Translations.of(context);

    final bool? confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(t.settingsScreen.deleteDialog.title),
            content: Text(t.settingsScreen.deleteDialog.content),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(t.general.cancel),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  t.settingsScreen.deleteDialog.deleteAll,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ],
          ),
    );

    if (confirm == true) {
      await dbService.deleteAllStudyLists();
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text(t.settingsScreen.snackbars.allDeleted)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(appThemeProvider);
    final themeNotifier = ref.read(appThemeProvider.notifier);
    final currentLanguage = ref.watch(appLanguageNotifierProvider);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.settingsScreen.title), centerTitle: true),
      body: SafeArea(
        child: CenteredView(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _SettingsGroup(
                title: t.settingsScreen.appearance,
                children: [
                  RadioListTile<ThemeMode>(
                    title: Text(t.settingsScreen.systemDefault),
                    value: ThemeMode.system,
                    groupValue: currentTheme,
                    onChanged: (value) => themeNotifier.setTheme(value!),
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text(t.settingsScreen.light),
                    value: ThemeMode.light,
                    groupValue: currentTheme,
                    onChanged: (value) => themeNotifier.setTheme(value!),
                  ),
                  RadioListTile<ThemeMode>(
                    title: Text(t.settingsScreen.dark),
                    value: ThemeMode.dark,
                    groupValue: currentTheme,
                    onChanged: (value) => themeNotifier.setTheme(value!),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _SettingsGroup(
                title: t.settingsScreen.language,
                children: [
                  ListTile(
                    leading: const Icon(Icons.language_outlined),
                    title: Text(t.settingsScreen.language),
                    subtitle: Text(_getCurrentLanguageName(currentLanguage, t)),
                    onTap: () => _showLanguagePicker(context, ref),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _SettingsGroup(
                title: t.settingsScreen.dataManagement,
                children: [
                  ListTile(
                    leading: const Icon(Icons.file_download_outlined),
                    title: Text(t.settingsScreen.exportData),
                    subtitle: Text(t.settingsScreen.exportDataSubtitle),
                    onTap: () => _exportData(context, ref),
                  ),
                  ListTile(
                    leading: const Icon(Icons.file_upload_outlined),
                    title: Text(t.settingsScreen.importData),
                    subtitle: Text(t.settingsScreen.importDataSubtitle),
                    onTap: () => _importData(context, ref),
                  ),
                  const Divider(),
                  ListTile(
                    leading: Icon(
                      Icons.delete_forever_outlined,
                      color: colorScheme.error,
                    ),
                    title: Text(
                      t.settingsScreen.deleteAllData,
                      style: TextStyle(color: colorScheme.error),
                    ),
                    onTap: () => _deleteAllData(context, ref),
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

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.title, required this.children});

  final List<Widget> children;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final roundedShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    return Card(
      shape: roundedShape,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(title, style: theme.textTheme.titleLarge),
          ),
          const Divider(),
          ...children,
        ],
      ),
    );
  }
}
