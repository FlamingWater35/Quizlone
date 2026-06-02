import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
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
      anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
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
                                child: SingleChildScrollView(
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
    ref.watch(smoothScrollProvider);

    if (!kIsWeb && Platform.isAndroid) {
      ref.watch(updaterControllerProvider);
    }

    final themeMode = ref.watch(appThemeProvider);
    final uiScale = ref.watch(uiScaleProvider);
    const seedColor = Colors.deepPurple;

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

    return MaterialApp.router(
      title: t.appName,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        snackBarTheme: buildSnackBarTheme(
          ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.dark,
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        snackBarTheme: buildSnackBarTheme(
          ColorScheme.fromSeed(
            seedColor: seedColor,
            brightness: Brightness.light,
          ),
        ),
      ),
      themeMode: themeMode,
      builder: (context, child) {
        // Applies global UI scaling factor defined in user settings.
        return AppScaler(scale: uiScale, child: child!);
      },
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        deepLinkBuilder: (deepLink) {
          // Reconstructs navigation stack for web deep links to prevent blank screens.
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
    );
  }
}
