import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/models/update_info.dart';
import 'package:quizlone/providers/core/auth_provider.dart';
import 'package:quizlone/providers/core/core_providers.dart';
import 'package:quizlone/providers/study/study_list_providers.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/widgets/app_scaler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'providers/core/settings_provider.dart';
import 'providers/core/updater_provider.dart';
import 'services/database_service.dart';
import 'services/migration_service.dart';
import 'services/smooth_scroll.dart';
import 'services/window_manager.dart';

final _log = Logger('main');

/// Application entry point. Initializes core services, handles fatal startup errors,
/// and renders a safe fallback UI if the database or network setup fails.
Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  initLocaleSettings();
  _setupLogging();
  setupWindow();

  String? initError;
  try {
    await Supabase.initialize(
      url: const String.fromEnvironment('SUPABASE_URL'),
      publishableKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
    );
    await DatabaseService.init();
    await _runCleanupTasks();
    await runMigrations();

    final container = ProviderContainer();
    final dbService = container.read(databaseServiceProvider);

    final savedLangCode = dbService.getLanguage();
    AppLanguageExtension.fromCode(savedLangCode).applyLocale();

    SmoothScrollController.enabledGlobally = dbService.getSmoothScroll();
    container.dispose();
  } catch (e, s) {
    _log.severe("Fatal error during initialization", e, s);
    initError = "$e\nStackTrace:\n$s";
  }

  // Renders a safe, offline-capable error screen if core services fail to boot.
  // Prevents the user from seeing a generic white screen of death.
  if (initError != null) {
    FlutterNativeSplash.remove();
    final errorMessage = initError; // Non-null after check
    runApp(
      MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context) {
            final t = Translations.of(context);
            return Scaffold(
              backgroundColor: const Color(0xFF121212),
              body: SafeArea(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.redAccent,
                            size: 64,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            t.criticalError.title,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.white10),
                              ),
                              child: Scrollbar(
                                thumbVisibility: true,
                                child: SmoothSingleChildScrollView(
                                  primary: true,
                                  padding: const EdgeInsets.all(16.0),
                                  child: Text(
                                    errorMessage,
                                    style: const TextStyle(
                                      fontFamily: 'monospace',
                                      fontSize: 13,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            t.criticalError.message,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
    return;
  }

  runApp(ProviderScope(child: TranslationProvider(child: const MyApp())));
}

/// Cleans up leftover APK files from previous app updates on Android.
/// Prevents storage bloat by removing installers that are no longer needed.
Future<void> _runCleanupTasks() async {
  final container = ProviderContainer();
  final dbService = container.read(databaseServiceProvider);
  try {
    final apkPath = dbService.getApkPathForCleanup();
    if (apkPath != null) {
      _log.info("Found pending APK cleanup for: $apkPath");
      final file = File(apkPath);
      if (await file.exists()) {
        await file.delete();
        _log.info("Successfully deleted old APK file.");
      } else {
        _log.warning("Old APK file not found at path, skipping delete.");
      }
      await dbService.clearApkPathForCleanup();
    }
  } catch (e, s) {
    _log.severe("Error during APK cleanup task", e, s);
  } finally {
    container.dispose();
  }
}

/// Configures the global logging system to output debug info in dev and warnings in prod.
/// Ensures we don't flood production consoles while retaining crucial crash data.
void _setupLogging() {
  Logger.root.level = kDebugMode ? Level.ALL : Level.WARNING;
  Logger.root.onRecord.listen((record) {
    debugPrint(
      '${record.level.name}: ${record.time}: ${record.loggerName}: ${record.message}',
    );
    if (record.error != null) {
      debugPrint('Error: ${record.error}');
    }
    if (record.stackTrace != null) {
      debugPrint('StackTrace: ${record.stackTrace}');
    }
  });
}

/// Root widget that sets up routing, theming, localization, and global state listeners.
/// Acts as the bridge between Riverpod providers and the Flutter rendering tree.
class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  static final _appRouter = AppRouter();
  static final _log = Logger('MyApp');
  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    // Delay splash screen removal until after the first frame to prevent UI flickering.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    _log.info("Building MyApp widget");

    // Watch global providers to ensure they stay alive and react to state changes.
    ref.watch(authControllerProvider);
    final smoothScrollEnabled = ref.watch(smoothScrollProvider);
    final scrollSpeedValue = ref.watch(scrollSpeedProvider);
    final scrollDurationValue = ref.watch(scrollDurationProvider);

    // Keep the updater provider alive on every platform that supports the
    // update flow so the startup auto-check runs everywhere and can prompt
    // the user via snackbar when a new version is found.
    final bool updaterEnabled =
        !kIsWeb &&
        (Platform.isAndroid ||
            Platform.isWindows ||
            Platform.isMacOS ||
            Platform.isLinux);
    if (updaterEnabled) {
      ref.watch(updaterControllerProvider);
      ref.listen<UpdateState>(updaterControllerProvider, (previous, next) {
        if (next is UpdateAvailable && next.isAutomatic) {
          _maybeShowUpdateSnackbar(next.info);
        }
      });
    }

    final themeMode = ref.watch(appThemeProvider);
    final uiScale = ref.watch(uiScaleProvider);
    final systemTextScale = ref.watch(systemTextScaleProvider);
    final seedArgb = ref.watch(seedColorProvider);

    // Falls back to the app default when the user has not picked a custom
    // theme color in Settings → Appearance → Theme Color.
    final Color seedColor = seedArgb == null
        ? defaultSeedColor
        : Color(seedArgb);

    ColorScheme buildColorScheme(Brightness brightness) {
      return ColorScheme.fromSeed(seedColor: seedColor, brightness: brightness);
    }

    // Applies a subtle shadow and a soft border to all Cards so they stand out
    // against the surface background, especially at low brightness.
    CardThemeData buildCardTheme(ColorScheme colorScheme) {
      return CardThemeData(
        elevation: 2.0,
        shadowColor: Colors.black.withAlpha(40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(
            color: colorScheme.outlineVariant.withAlpha(
              colorScheme.brightness == Brightness.dark ? 80 : 50,
            ),
          ),
        ),
        clipBehavior: Clip.antiAlias,
      );
    }

    // Generates consistent Snackbar styling across both light and dark themes.
    SnackBarThemeData buildSnackBarTheme(ColorScheme colorScheme) {
      return SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: TextStyle(
          color: colorScheme.onInverseSurface,
          fontSize: 14,
        ),
        actionTextColor: colorScheme.inversePrimary,
        insetPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        elevation: 4.0,
      );
    }

    // Desktop builds (notably Windows) do not always pick up the implicit
    // click-cursor defaults for interactive widgets, so every interactive
    // component theme declares the pointer cursor explicitly. Disabled
    // controls fall back to the normal arrow.
    WidgetStateProperty<MouseCursor?> buildInteractiveCursor() {
      return WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return SystemMouseCursors.basic;
        }
        return SystemMouseCursors.click;
      });
    }

    ButtonStyle buildInteractiveButtonStyle() {
      return ButtonStyle(mouseCursor: buildInteractiveCursor());
    }

    return SmoothScrollScope(
      notifier: SmoothScrollData(
        enabled: smoothScrollEnabled,
        speed: scrollSpeedValue,
        durationMs: scrollDurationValue,
      ),
      child: MaterialApp.router(
        scaffoldMessengerKey: _scaffoldMessengerKey,
        title: t.appName,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          colorScheme: buildColorScheme(Brightness.light),
          useMaterial3: true,
          cardTheme: buildCardTheme(buildColorScheme(Brightness.light)),
          snackBarTheme: buildSnackBarTheme(buildColorScheme(Brightness.dark)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          textButtonTheme: TextButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          iconButtonTheme: IconButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          listTileTheme: ListTileThemeData(
            mouseCursor: buildInteractiveCursor(),
          ),
          switchTheme: SwitchThemeData(mouseCursor: buildInteractiveCursor()),
          checkboxTheme: CheckboxThemeData(
            mouseCursor: buildInteractiveCursor(),
          ),
          radioTheme: RadioThemeData(mouseCursor: buildInteractiveCursor()),
        ),
        darkTheme: ThemeData(
          colorScheme: buildColorScheme(Brightness.dark),
          useMaterial3: true,
          cardTheme: buildCardTheme(buildColorScheme(Brightness.dark)),
          snackBarTheme: buildSnackBarTheme(buildColorScheme(Brightness.light)),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          textButtonTheme: TextButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          iconButtonTheme: IconButtonThemeData(
            style: buildInteractiveButtonStyle(),
          ),
          listTileTheme: ListTileThemeData(
            mouseCursor: buildInteractiveCursor(),
          ),
          switchTheme: SwitchThemeData(mouseCursor: buildInteractiveCursor()),
          checkboxTheme: CheckboxThemeData(
            mouseCursor: buildInteractiveCursor(),
          ),
          radioTheme: RadioThemeData(mouseCursor: buildInteractiveCursor()),
        ),
        themeMode: themeMode,
        builder: (context, child) {
          return AppScaler(
            scale: uiScale,
            followSystemScale: systemTextScale,
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(
          deepLinkBuilder: (deepLink) {
            if (kIsWeb && deepLink.path != '/') {
              final activeListId = ref.read(activeStudyListIdProvider);
              return DeepLinkResolver.resolve(
                deepLink.path,
                activeListId: activeListId,
              );
            }
            return deepLink;
          },
        ),
      ),
    );
  }

  /// Shows a short-lived prompt when the startup auto-check finds an update.
  /// Mirrors the tinted icon + text styling of the error snackbar, but in the
  /// primary "info" tone. Offers a jump to the Update section in Settings and
  /// an option to suppress future prompts for the same version.
  void _maybeShowUpdateSnackbar(UpdateInfo info) {
    final skippedVersion = ref
        .read(databaseServiceProvider)
        .getSkippedUpdateVersion();
    if (skippedVersion == info.version) return;
    final messenger = _scaffoldMessengerKey.currentState;
    if (messenger == null) return;

    final theme = Theme.of(messenger.context);
    final colorScheme = theme.colorScheme;
    final Color backgroundColor = colorScheme.primaryContainer;
    final Color contentColor = colorScheme.onPrimaryContainer;
    final buttonStyle = TextButton.styleFrom(
      foregroundColor: contentColor,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      minimumSize: const Size(0, 36),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );

    messenger.showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 6),
        backgroundColor: backgroundColor,
        content: LayoutBuilder(
          builder: (context, constraints) {
            final icon = Icon(
              Icons.system_update_outlined,
              color: contentColor,
            );
            final message = Text(
              t.settingsScreen.updateAvailable(version: info.version),
              style: TextStyle(color: contentColor, fontSize: 15),
            );
            final buttons = Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: TextButton(
                    style: buttonStyle,
                    onPressed: () {
                      ref
                          .read(databaseServiceProvider)
                          .saveSkippedUpdateVersion(info.version);
                      messenger.removeCurrentSnackBar();
                    },
                    child: Text(t.settingsScreen.dontShowAgain),
                  ),
                ),
                TextButton(
                  style: buttonStyle,
                  onPressed: () {
                    messenger.removeCurrentSnackBar();
                    _appRouter.push(SettingsRoute(initialSection: 'update'));
                  },
                  child: Text(t.settingsScreen.update),
                ),
              ],
            );

            // Inline on wide layouts; drop the buttons to a second,
            // right-aligned row on narrow phones (this SDK's SnackBar has
            // no multi-action `actions` slot that would do this for us).
            if (constraints.maxWidth >= 400) {
              return Row(
                children: [
                  icon,
                  const SizedBox(width: 12),
                  Expanded(child: message),
                  buttons,
                ],
              );
            }
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    icon,
                    const SizedBox(width: 12),
                    Expanded(child: message),
                  ],
                ),
                const SizedBox(height: 4),
                Align(alignment: Alignment.centerRight, child: buttons),
              ],
            );
          },
        ),
      ),
    );
  }
}
