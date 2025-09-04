import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/widgets/error_snackbar.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/settings_app_data.dart';
import '../../models/study_list.dart';
import '../../providers/core/core_providers.dart';
import '../../providers/core/settings_provider.dart';
import '../../providers/core/updater_provider.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';
import '../modes/match_leaderboard_screen.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  void _showLanguageMenu(BuildContext context, WidgetRef ref) {
    final languageNotifier = ref.read(appLanguageNotifierProvider.notifier);
    final currentLanguage = ref.read(appLanguageNotifierProvider);
    final t = Translations.of(context);
    final theme = Theme.of(context);

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SimpleDialog(
              title: Text(t.settingsScreen.languageDialogTitle),
              contentPadding: const EdgeInsets.all(8.0),
              children:
                  AppLanguage.values.map((lang) {
                    final isSelected = lang == currentLanguage;
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4.0,
                        horizontal: 8.0,
                      ),
                      child: Card(
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          title: Text(
                            lang.getDisplayName(t),
                            style: TextStyle(
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                          trailing:
                              isSelected
                                  ? Icon(
                                    Icons.check_circle,
                                    color: theme.colorScheme.primary,
                                  )
                                  : null,
                          onTap: () {
                            languageNotifier.setLanguage(lang);
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    );
                  }).toList(),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeOut)),
          child: child,
        );
      },
    );
  }

  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    final dbService = ref.read(databaseServiceProvider);
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final t = Translations.of(context);

    final lists = await dbService.getAllStudyLists();
    final records = await dbService.getAllMatchRecords();
    final order = dbService.getStudyListOrder();

    if (lists.isEmpty && records.isEmpty) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text(t.settingsScreen.snackbars.noDataToExport)),
      );
      return;
    }

    final appData = AppData(
      studyLists: lists,
      matchRecords: records,
      studyListOrder: order,
    );
    final jsonString = jsonEncode(appData.toJson());
    final bytes = utf8.encode(jsonString);
    const fileName = 'quizlone_backup.json';

    try {
      if (kIsWeb) {
        await FileSaver.instance.saveFile(
          name: 'quizlone_backup',
          bytes: bytes,
          fileExtension: 'json',
          mimeType: MimeType.json,
        );
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
                          text: t.settingsScreen.exportDialog.shareText,
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
            text: t.settingsScreen.exportDialog.shareText,
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
      if (context.mounted) {
        showErrorSnackBar(
          context,
          message: t.settingsScreen.snackbars.exportError(error: e.toString()),
        );
      }
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

        final dynamic jsonData = jsonDecode(jsonString);
        AppData appData;

        if (jsonData is Map<String, dynamic>) {
          appData = AppData.fromJson(jsonData);
        } else if (jsonData is List<dynamic>) {
          final studyLists =
              jsonData.map((json) => StudyList.fromJson(json)).toList();
          appData = AppData(
            studyLists: studyLists,
            matchRecords: [],
            studyListOrder: studyLists.map((list) => list.id).toList(),
          );
        } else {
          throw Exception("Invalid backup file format.");
        }

        await dbService.applyCloudData(appData);
        await dbService.triggerCloudUpload();

        ref.invalidate(studyListsProvider);
        ref.invalidate(matchRecordsProvider);

        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              t.settingsScreen.snackbars.importSuccess(
                count: appData.studyLists.length,
              ),
            ),
          ),
        );
      } catch (e) {
        if (context.mounted) {
          showErrorSnackBar(
            context,
            message: t.settingsScreen.snackbars.importError(
              error: e.toString(),
            ),
          );
        }
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
      await dbService.clearAllMatchRecords();

      await dbService.triggerCloudUpload();

      ref.invalidate(studyListsProvider);
      ref.invalidate(matchRecordsProvider);

      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text(t.settingsScreen.snackbars.allDeleted)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kIsWeb && !context.router.canPop()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.router.replaceAll([
            const StartRoute(),
            const SettingsRoute(),
          ]);
        }
      });
    }

    final currentTheme = ref.watch(appThemeProvider);
    final themeNotifier = ref.read(appThemeProvider.notifier);
    final currentLanguage = ref.watch(appLanguageNotifierProvider);
    final uiScale = ref.watch(uiScaleNotifierProvider);
    final uiScaleNotifier = ref.read(uiScaleNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final t = Translations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(t.settingsScreen.title), centerTitle: true),
      body: SafeArea(
        child: CenteredView(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _SettingsHeader(title: t.settingsScreen.appearance),
              Card(
                clipBehavior: Clip.antiAlias,
                child: RadioGroup<ThemeMode>(
                  groupValue: currentTheme,
                  onChanged: (value) => themeNotifier.setTheme(value!),
                  child: Column(
                    children: [
                      RadioListTile<ThemeMode>(
                        title: Text(t.settingsScreen.systemDefault),
                        value: ThemeMode.system,
                      ),
                      RadioListTile<ThemeMode>(
                        title: Text(t.settingsScreen.light),
                        value: ThemeMode.light,
                      ),
                      RadioListTile<ThemeMode>(
                        title: Text(t.settingsScreen.dark),
                        value: ThemeMode.dark,
                      ),
                    ],
                  ),
                ),
              ),
              _SettingsHeader(title: t.settingsScreen.language),
              Card(
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  leading: const Icon(Icons.translate_outlined),
                  title: Text(t.settingsScreen.language),
                  subtitle: Text(currentLanguage.getDisplayName(t)),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                  ),
                  onTap: () => _showLanguageMenu(context, ref),
                ),
              ),
              _SettingsHeader(title: t.settingsScreen.uiScaling),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.format_size_outlined),
                      title: Text(t.settingsScreen.uiScaling),
                      subtitle: Text(t.settingsScreen.uiScalingSubtitle),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Slider(
                              value: uiScale,
                              min: 0.8,
                              max: 1.5,
                              divisions: 7,
                              label: "${(uiScale * 100).toStringAsFixed(0)}%",
                              onChanged: (value) {
                                uiScaleNotifier.setScale(value);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            child: Text(
                              "${(uiScale * 100).toStringAsFixed(0)}%",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(width: 8),
                          OutlinedButton(
                            onPressed:
                                uiScale == 1.0
                                    ? null
                                    : () => uiScaleNotifier.setScale(1.0),
                            child: Text(t.general.reset),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!kIsWeb && Platform.isAndroid) ...[
                _SettingsHeader(title: t.settingsScreen.update),
                const _UpdaterCard(),
              ],
              _SettingsHeader(title: t.settingsScreen.dataManagement),
              Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
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
                    const Divider(indent: 16, endIndent: 16),
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
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsHeader extends StatelessWidget {
  const _SettingsHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class _UpdaterCard extends ConsumerWidget {
  const _UpdaterCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateState = ref.watch(updaterControllerProvider);
    final updaterNotifier = ref.read(updaterControllerProvider.notifier);
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: switch (updateState) {
        UpdateInitial() => ListTile(
          leading: const Icon(Icons.update),
          title: Text(t.settingsScreen.checkForUpdate),
          onTap: updaterNotifier.checkForUpdate,
        ),
        UpdateChecking() => ListTile(
          leading: const SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
          title: Text(t.settingsScreen.checkingForUpdate),
        ),
        UpdateNotAvailable() => ListTile(
          leading: Icon(
            Icons.check_circle_outline,
            color: theme.colorScheme.primary,
          ),
          title: Text(t.settingsScreen.upToDate),
          subtitle: Text(t.settingsScreen.noNewVersion),
          onTap: updaterNotifier.checkForUpdate,
        ),
        UpdateAvailable(info: final info) => Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.download_for_offline_outlined,
                color: theme.colorScheme.secondary,
              ),
              title: Text(
                t.settingsScreen.updateAvailable(version: info.version),
              ),
              subtitle: Text(t.settingsScreen.tapToInstall),
              onTap: updaterNotifier.downloadUpdate,
            ),
            if (info.releaseNotes != null && info.releaseNotes!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Card(
                  margin: EdgeInsets.zero,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    title: Text(t.settingsScreen.viewReleaseNotes),
                    childrenPadding: const EdgeInsets.all(8.0),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MarkdownBody(data: info.releaseNotes!),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
        UpdateDownloading(progress: final progress) => ListTile(
          title: Text(t.settingsScreen.downloadingUpdate),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(value: progress),
                const SizedBox(height: 4),
                Text("${(progress * 100).toStringAsFixed(0)}%"),
              ],
            ),
          ),
        ),
        UpdateError(message: final message) => ListTile(
          leading: Icon(Icons.error_outline, color: theme.colorScheme.error),
          title: Text(t.settingsScreen.updateCheckFailed),
          subtitle: Text(message),
          onTap: updaterNotifier.checkForUpdate,
        ),
      },
    );
  }
}
