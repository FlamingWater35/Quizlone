import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
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

/// Top-level settings destinations. The visible set is dynamic:
/// "Update" only exists on Android/desktop, "Account" only while signed in.
enum _SettingsSection {
  appearance(Icons.palette_outlined),
  study(Icons.school_outlined),
  update(Icons.system_update_outlined),
  data(Icons.storage_outlined),
  account(Icons.person_outline);

  const _SettingsSection(this.icon);

  final IconData icon;
}

@RoutePage()
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  /// Above this width a persistent sidebar (NavigationRail) is shown;
  /// below it the screen falls back to a scrollable chip bar.
  static const double _wideBreakpoint = 680;

  final _scrollController = SmoothScrollController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // -------------------------------------------------------------------
  // Navigation
  // -------------------------------------------------------------------

  List<_SettingsSection> _availableSections({
    required bool isSignedIn,
    required bool showUpdates,
  }) {
    return [
      _SettingsSection.appearance,
      _SettingsSection.study,
      if (showUpdates) _SettingsSection.update,
      _SettingsSection.data,
      if (isSignedIn) _SettingsSection.account,
    ];
  }

  String _sectionLabel(_SettingsSection section, Translations t) {
    return switch (section) {
      _SettingsSection.appearance => t.settingsScreen.appearance,
      _SettingsSection.study => t.settingsScreen.study,
      _SettingsSection.update => t.settingsScreen.update,
      _SettingsSection.data => t.settingsScreen.dataManagement,
      _SettingsSection.account => t.settingsScreen.accountManagement,
    };
  }

  void _selectSection(int index) {
    setState(() => _selectedIndex = index);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && _scrollController.hasClients) {
        _scrollController.jumpTo(0);
      }
    });
  }

  // -------------------------------------------------------------------
  // Theme color picker (live preview, rollback on cancel)
  // -------------------------------------------------------------------

  Future<void> _showColorPickerDialog() async {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final notifier = ref.read(seedColorProvider.notifier);
    final int? original = ref.read(seedColorProvider);
    Color selected = original == null ? defaultSeedColor : Color(original);

    void applySeedColor(Color color) {
      if (color.toARGB32() == defaultSeedColor.toARGB32()) {
        notifier.set(null);
      } else {
        notifier.set(color.toARGB32());
      }
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (dialogContext, setDialogState) {
            return AlertDialog(
              title: Text(t.settingsScreen.themeColorDialog),
              content: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 460),
                child: SingleChildScrollView(
                  child: ColorPicker(
                    color: selected,
                    onColorChanged: (color) {
                      setDialogState(() => selected = color);
                      applySeedColor(color); // Live preview.
                    },
                    pickersEnabled: const <ColorPickerType, bool>{
                      ColorPickerType.primary: true,
                      ColorPickerType.accent: true,
                      ColorPickerType.bw: false,
                      ColorPickerType.custom: false,
                      ColorPickerType.wheel: true,
                    },
                    enableShadesSelection: true,
                    heading: Text(
                      t.settingsScreen.themeColor,
                      style: theme.textTheme.titleMedium,
                    ),
                    subheading: Text(
                      t.settingsScreen.themeColorSubtitle,
                      style: theme.textTheme.bodySmall,
                    ),
                    width: 36,
                    height: 36,
                    spacing: 6,
                    runSpacing: 6,
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext, false),
                  child: Text(t.general.cancel),
                ),
                FilledButton(
                  onPressed: () => Navigator.pop(dialogContext, true),
                  child: Text(t.general.ok),
                ),
              ],
            );
          },
        );
      },
    );

    // Barrier dismiss or Cancel → roll the live preview back.
    if (confirmed != true) {
      await notifier.set(original);
    }
  }

  // -------------------------------------------------------------------
  // Layout
  // -------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isSignedIn = ref.watch(authControllerProvider).value != null;
    final bool showUpdates = !kIsWeb &&
        (Platform.isAndroid ||
            Platform.isWindows ||
            Platform.isMacOS ||
            Platform.isLinux);
    final bool showExperimental =
        kIsWeb ||
        (!kIsWeb &&
            (Platform.isWindows || Platform.isMacOS || Platform.isLinux));

    final sections = _availableSections(
      isSignedIn: isSignedIn,
      showUpdates: showUpdates,
    );
    // Clamp in case the section list shrank (e.g. user signed out).
    final selectedIndex = _selectedIndex.clamp(0, sections.length - 1);
    final content = _animatedSection(
      sections,
      selectedIndex,
      t,
      showExperimental,
    );

    return Scaffold(
      appBar: AppBar(
        leading: const WebAwareBackButton(fallback: StartRoute()),
        title: Text(t.settingsScreen.title),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isWide = constraints.maxWidth >= _wideBreakpoint;
            return isWide
                ? _wideLayout(sections, selectedIndex, t, content)
                : _narrowLayout(sections, selectedIndex, t, content);
          },
        ),
      ),
    );
  }

  Widget _wideLayout(
    List<_SettingsSection> sections,
    int selectedIndex,
    Translations t,
    Widget content,
  ) {
    return Row(
      children: [
        NavigationRail(
          selectedIndex: selectedIndex,
          onDestinationSelected: _selectSection,
          labelType: NavigationRailLabelType.all,
          groupAlignment: -1.0,
          destinations: [
            for (final section in sections)
              NavigationRailDestination(
                icon: Icon(section.icon),
                label: Text(_sectionLabel(section, t)),
              ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: content),
      ],
    );
  }

  Widget _narrowLayout(
    List<_SettingsSection> sections,
    int selectedIndex,
    Translations t,
    Widget content,
  ) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: [
              for (int i = 0; i < sections.length; i++)
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    avatar: Icon(sections[i].icon, size: 18),
                    label: Text(_sectionLabel(sections[i], t)),
                    selected: i == selectedIndex,
                    onSelected: (_) => _selectSection(i),
                  ),
                ),
            ],
          ),
        ),
        const Divider(height: 1),
        Expanded(child: content),
      ],
    );
  }

  Widget _animatedSection(
    List<_SettingsSection> sections,
    int selectedIndex,
    Translations t,
    bool showExperimental,
  ) {
    final section = sections[selectedIndex];
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOutCubic,
      switchOutCurve: Curves.easeInCubic,
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: CenteredView(
        key: ValueKey(section),
        child: SmoothSingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(16.0),
          child: _sectionContent(section, t, showExperimental),
        ),
      ),
    );
  }

  Widget _sectionContent(
    _SettingsSection section,
    Translations t,
    bool showExperimental,
  ) {
    return switch (section) {
      _SettingsSection.appearance => _appearanceContent(t),
      _SettingsSection.study =>
        _studyContent(t, showExperimental: showExperimental),
      _SettingsSection.update => _updateContent(t),
      _SettingsSection.data => _dataContent(t),
      _SettingsSection.account => _accountContent(t),
    };
  }

  // -------------------------------------------------------------------
  // Section content
  // -------------------------------------------------------------------

  Widget _appearanceContent(Translations t) {
    final theme = Theme.of(context);
    final currentTheme = ref.watch(appThemeProvider);
    final themeNotifier = ref.read(appThemeProvider.notifier);
    final currentLanguage = ref.watch(appLanguageProvider);
    final uiScale = ref.watch(uiScaleProvider);
    final uiScaleNotifier = ref.read(uiScaleProvider.notifier);
    final seedArgb = ref.watch(seedColorProvider);
    final seedNotifier = ref.read(seedColorProvider.notifier);
    final activeSeedColor =
        seedArgb == null ? defaultSeedColor : Color(seedArgb);

    return Column(
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
        Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: const Icon(Icons.palette_outlined),
            title: Text(t.settingsScreen.themeColor),
            subtitle: Text(t.settingsScreen.themeColorSubtitle),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 26,
                  height: 26,
                  decoration: BoxDecoration(
                    color: activeSeedColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: theme.colorScheme.outlineVariant,
                      width: 2,
                    ),
                  ),
                ),
                if (seedArgb != null)
                  IconButton(
                    icon: const Icon(Icons.restart_alt),
                    tooltip: t.general.reset,
                    onPressed: () => seedNotifier.set(null),
                  ),
              ],
            ),
            onTap: _showColorPickerDialog,
          ),
        ),
        Card(
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            leading: const Icon(Icons.translate_outlined),
            title: Text(t.settingsScreen.language),
            subtitle: Text(currentLanguage.getDisplayName(t)),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
            onTap: () => _showLanguageMenu(context, ref),
          ),
        ),
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
                        onChanged: (value) => uiScaleNotifier.setScale(value),
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
      ],
    );
  }

  Widget _studyContent(Translations t, {required bool showExperimental}) {
    final disableFlashcardAnimations =
        ref.watch(disableFlashcardAnimationsProvider);
    final smoothScrollEnabled = ref.watch(smoothScrollProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SettingsHeader(title: t.settingsScreen.study),
        Card(
          clipBehavior: Clip.antiAlias,
          child: SwitchListTile(
            title: Text(t.settingsScreen.disableFlashcardAnimations),
            subtitle: Text(t.settingsScreen.disableFlashcardAnimationsSubtitle),
            secondary: const Icon(Icons.animation),
            value: disableFlashcardAnimations,
            onChanged: (val) => ref
                .read(disableFlashcardAnimationsProvider.notifier)
                .toggle(val),
          ),
        ),
        if (showExperimental) ...[
          _SettingsHeader(title: t.settingsScreen.experimental),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                SwitchListTile(
                  title: Text(t.settingsScreen.smoothScrolling),
                  subtitle: Text(t.settingsScreen.smoothScrollingSubtitle),
                  secondary: const Icon(Icons.mouse_outlined),
                  value: smoothScrollEnabled,
                  onChanged: (val) =>
                      ref.read(smoothScrollProvider.notifier).toggle(val),
                ),
                if (smoothScrollEnabled) ...[
                  const Divider(indent: 16, endIndent: 16),
                  ListTile(
                    leading: const Icon(Icons.speed_outlined),
                    title: Text(t.settingsScreen.scrollSpeed),
                    subtitle: Text(t.settingsScreen.scrollSpeedSubtitle),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
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
                          onPressed: ref.watch(scrollSpeedProvider) == 1.1
                              ? null
                              : () => ref
                                  .read(scrollSpeedProvider.notifier)
                                  .set(1.1),
                          child: Text(t.general.reset),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.timer_outlined),
                    title: Text(t.settingsScreen.scrollDuration),
                    subtitle: Text(t.settingsScreen.scrollDurationSubtitle),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Slider(
                            value:
                                ref.watch(scrollDurationProvider).toDouble(),
                            min: 400,
                            max: 3000,
                            divisions: 13,
                            label: "${ref.watch(scrollDurationProvider)}ms",
                            onChanged: (value) => ref
                                .read(scrollDurationProvider.notifier)
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
                          onPressed: ref.watch(scrollDurationProvider) == 1400
                              ? null
                              : () => ref
                                  .read(scrollDurationProvider.notifier)
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
    );
  }

  Widget _updateContent(Translations t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SettingsHeader(title: t.settingsScreen.update),
        const _UpdaterCard(),
      ],
    );
  }

  Widget _dataContent(Translations t) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
            ],
          ),
        ),
      ],
    );
  }

  Widget _accountContent(Translations t) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
    );
  }

  // -------------------------------------------------------------------
  // Kept unchanged from the previous file:
  //   - _showLanguageMenu(...)
  //   - _exportData(...)
  //   - _importData(...)
  //   - _deleteAllData(...)
  //   - _confirmDeleteAccount(...)
  // -------------------------------------------------------------------

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