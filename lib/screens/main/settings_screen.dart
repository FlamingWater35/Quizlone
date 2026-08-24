import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/providers/core/auth_provider.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/services/migration_service.dart';
import 'package:quizlone/services/smooth_scroll.dart';
import 'package:quizlone/widgets/error_snackbar.dart';
import 'package:quizlone/widgets/web_aware_back_button.dart';

import '../../models/settings_app_data.dart';
import '../../models/study_list.dart';
import '../../providers/core/core_providers.dart';
import '../../providers/core/settings_provider.dart';
import '../../providers/core/updater_provider.dart';
import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';
import '../modes/match_leaderboard_screen.dart';

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final _scrollController = SmoothScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _showLanguageMenu(BuildContext context, WidgetRef ref) {
    final languageNotifier = ref.read(appLanguageProvider.notifier);
    final currentLanguage = ref.read(appLanguageProvider);

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return _LanguageDialog(
          currentLanguage: currentLanguage,
          notifier: languageNotifier,
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
    final groups = await dbService.getAllStudyGroups();

    if (lists.isEmpty && records.isEmpty) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text(t.settingsScreen.snackbars.noDataToExport)),
      );
      return;
    }

    final appData = AppData(
      studyLists: lists,
      matchRecords: records,
      studyGroups: groups,
    );
    final jsonString = jsonEncode(appData.toJson());
    final bytes = utf8.encode(jsonString);
    final fileName = '${t.settingsScreen.exportDialog.backupFileName}.json';

    try {
      String? savedPath;

      if (kIsWeb) {
        await FileSaver.instance.saveFile(
          name: fileName.split('.').first,
          bytes: bytes,
          fileExtension: 'json',
          mimeType: MimeType.json,
        );
        savedPath = 'downloaded';
      } else if (Platform.isAndroid || Platform.isIOS) {
        savedPath = await FlutterFileDialog.saveFile(
          params: SaveFileDialogParams(data: bytes, fileName: fileName),
        );
      } else {
        savedPath = (await FilePicker.saveFile(
          dialogTitle: t.settingsScreen.exportDialog.saveFileTitle,
          fileName: fileName,
          bytes: bytes,
        ))?.path;
      }

      if (savedPath != null && context.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(content: Text(t.settingsScreen.snackbars.exportSuccess)),
        );
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
      builder: (context) => AlertDialog(
        title: Text(t.settingsScreen.importDialog.title),
        content: Text(t.settingsScreen.importDialog.content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(t.general.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(t.settingsScreen.importDialog.import),
          ),
        ],
      ),
    );

    if (confirm != true) return;

    try {
      String? filePath;
      Uint8List? fileBytes;

      if (kIsWeb) {
        final result = await FilePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['json'],
        );
        if (result.isNotEmpty) {
          final platformFile = result.single;
          fileBytes = await platformFile.readAsBytes();
        }
      } else if (Platform.isAndroid || Platform.isIOS) {
        final params = OpenFileDialogParams(
          dialogType: OpenFileDialogType.document,
          fileExtensionsFilter: ['json'],
          mimeTypesFilter: ['application/json'],
        );
        filePath = await FlutterFileDialog.pickFile(params: params);
      } else {
        final result = await FilePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['json'],
        );
        if (result.isNotEmpty) {
          filePath = result.single.path;
        }
      }

      if (filePath == null && fileBytes == null) return;

      String jsonString;
      if (fileBytes != null) {
        jsonString = utf8.decode(fileBytes);
      } else if (filePath != null) {
        jsonString = await File(filePath).readAsString();
      } else {
        throw Exception("No file selected.");
      }

      final dynamic jsonData = jsonDecode(jsonString);
      AppData appData;

      if (jsonData is Map<String, dynamic>) {
        appData = AppData.fromJson(jsonData);
      } else if (jsonData is List<dynamic>) {
        final studyLists = jsonData
            .map((json) => StudyList.fromJson(json))
            .toList();
        appData = AppData(studyLists: studyLists, matchRecords: []);
      } else {
        throw Exception("Invalid backup file format.");
      }

      await dbService.applyCloudData(appData);
      await runMigrations();
      await dbService.triggerCloudUpload();

      ref.invalidate(studyListsProvider);
      ref.invalidate(matchRecordsProvider);

      if (context.mounted) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text(
              t.settingsScreen.snackbars.importSuccess(
                count: appData.studyLists.length,
              ),
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        showErrorSnackBar(
          context,
          message: t.settingsScreen.snackbars.importError(error: e.toString()),
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
      builder: (context) => AlertDialog(
        title: Text(t.settingsScreen.deleteDialog.title),
        content: Text(t.settingsScreen.deleteDialog.content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(t.general.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
            child: Text(t.settingsScreen.deleteDialog.deleteAll),
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

  Future<void> _confirmDeleteAccount(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final t = Translations.of(context);
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.settingsScreen.deleteAccountDialog.title),
        content: Text(t.settingsScreen.deleteAccountDialog.content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(t.general.cancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: Text(t.settingsScreen.deleteAccountDialog.confirm),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await ref.read(authControllerProvider.notifier).deleteAccount();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(t.settingsScreen.snackbars.accountDeleted)),
          );
        }
      } catch (e) {
        if (context.mounted) {
          showErrorSnackBar(context, message: e.toString());
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(appThemeProvider);
    final themeNotifier = ref.read(appThemeProvider.notifier);
    final currentLanguage = ref.watch(appLanguageProvider);
    final uiScale = ref.watch(uiScaleProvider);
    final uiScaleNotifier = ref.read(uiScaleProvider.notifier);
    final smoothScrollEnabled = ref.watch(smoothScrollProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final t = Translations.of(context);

    final bool showExperimental =
        kIsWeb ||
        (!kIsWeb &&
            (Platform.isWindows || Platform.isMacOS || Platform.isLinux));

    return Scaffold(
      appBar: AppBar(
        leading: const WebAwareBackButton(fallback: StartRoute()),
        title: Text(t.settingsScreen.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CenteredView(
          child: SmoothSingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                              onPressed: uiScale == 1.0
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
                if (!kIsWeb &&
                    (Platform.isAndroid ||
                        Platform.isWindows ||
                        Platform.isMacOS ||
                        Platform.isLinux)) ...[
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
                if (ref.watch(authControllerProvider).value != null) ...[
                  _SettingsHeader(title: t.settingsScreen.accountManagement),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      leading: Icon(
                        Icons.person_remove_outlined,
                        color: colorScheme.error,
                      ),
                      title: Text(
                        t.settingsScreen.deleteAccount,
                        style: TextStyle(color: colorScheme.error),
                      ),
                      subtitle: Text(t.settingsScreen.deleteAccountSubtitle),
                      onTap: () => _confirmDeleteAccount(context, ref),
                    ),
                  ),
                ],
                if (showExperimental) ...[
                  _SettingsHeader(title: t.settingsScreen.experimental),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        SwitchListTile(
                          title: Text(t.settingsScreen.smoothScrolling),
                          subtitle: Text(
                            t.settingsScreen.smoothScrollingSubtitle,
                          ),
                          secondary: const Icon(Icons.mouse_outlined),
                          value: smoothScrollEnabled,
                          onChanged: (val) => ref
                              .read(smoothScrollProvider.notifier)
                              .toggle(val),
                        ),
                        if (smoothScrollEnabled) ...[
                          const Divider(indent: 16, endIndent: 16),
                          ListTile(
                            leading: const Icon(Icons.speed_outlined),
                            title: Text(t.settingsScreen.scrollSpeed),
                            subtitle: Text(
                              t.settingsScreen.scrollSpeedSubtitle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              16.0,
                              0,
                              16.0,
                              8.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Slider(
                                    value: ref.watch(scrollSpeedProvider),
                                    min: 0.5,
                                    max: 2.0,
                                    divisions: 15,
                                    label:
                                        "${ref.watch(scrollSpeedProvider).toStringAsFixed(1)}x",
                                    onChanged: (value) => ref
                                        .read(scrollSpeedProvider.notifier)
                                        .set(value),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    "${ref.watch(scrollSpeedProvider).toStringAsFixed(1)}x",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                OutlinedButton(
                                  onPressed: ref.watch(scrollSpeedProvider) ==
                                          1.1
                                      ? null
                                      : () => ref
                                          .read(
                                            scrollSpeedProvider.notifier,
                                          )
                                          .set(1.1),
                                  child: Text(t.general.reset),
                                ),
                              ],
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.timer_outlined),
                            title: Text(t.settingsScreen.scrollDuration),
                            subtitle: Text(
                              t.settingsScreen.scrollDurationSubtitle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              16.0,
                              0,
                              16.0,
                              8.0,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Slider(
                                    value: ref
                                            .watch(scrollDurationProvider)
                                            .toDouble(),
                                    min: 400,
                                    max: 3000,
                                    divisions: 13,
                                    label:
                                        "${ref.watch(scrollDurationProvider)}ms",
                                    onChanged: (value) => ref
                                        .read(
                                          scrollDurationProvider.notifier,
                                        )
                                        .set(value.round()),
                                  ),
                                ),
                                SizedBox(
                                  width: 55,
                                  child: Text(
                                    "${ref.watch(scrollDurationProvider)}ms",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                OutlinedButton(
                                  onPressed:
                                      ref.watch(scrollDurationProvider) == 1400
                                          ? null
                                          : () => ref
                                              .read(
                                                scrollDurationProvider
                                                    .notifier,
                                              )
                                              .set(1400),
                                  child: Text(t.general.reset),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ],
            ),
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

class _LanguageDialog extends StatefulWidget {
  const _LanguageDialog({required this.currentLanguage, required this.notifier});
  final AppLanguage currentLanguage;
  final AppLanguageNotifier notifier;

  @override
  State<_LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<_LanguageDialog> {
  final _scrollController = SmoothScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);

    return SafeArea(
      child: Align(
        alignment: Alignment.centerRight,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Dialog(
            insetPadding: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      t.settingsScreen.languageDialogTitle,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      child: SmoothSingleChildScrollView(
                        controller: _scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: AppLanguage.values.map((lang) {
                            final isSelected = lang == widget.currentLanguage;
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 4.0,
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
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                  ),
                                  trailing: isSelected
                                      ? Icon(
                                          Icons.check_circle,
                                          color: theme.colorScheme.primary,
                                        )
                                      : null,
                                  onTap: () {
                                    widget.notifier.setLanguage(lang);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                Platform.isAndroid
                    ? Icons.download_for_offline_outlined
                    : Icons.open_in_browser_outlined,
                color: theme.colorScheme.secondary,
              ),
              title: Text(
                t.settingsScreen.updateAvailable(version: info.version),
              ),
              subtitle: Text(
                Platform.isAndroid
                    ? t.settingsScreen.tapToInstall
                    : t.settingsScreen.clickToDownload,
              ),
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
          subtitle: Text(t.settingsScreen.updateErrorDetails(error: message)),
          onTap: updaterNotifier.checkForUpdate,
        ),
      },
    );
  }
}
