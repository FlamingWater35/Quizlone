import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/providers/core/auth_provider.dart';
import 'package:quizlone/providers/core/core_providers.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'providers/core/settings_provider.dart';
import 'providers/core/updater_provider.dart';
import 'services/database_service.dart';
import 'services/migration_service.dart';
import 'services/window_manager.dart';

final _log = Logger('main');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  await DatabaseService.init();
  await _runCleanupTasks();
  await runMigrations();

  final container = ProviderContainer();
  final dbService = container.read(databaseServiceProvider);
  final savedLangCode = dbService.getLanguage();
  AppLanguageExtension.fromCode(savedLangCode).applyLocale();
  container.dispose();

  setupWindow();
  runApp(ProviderScope(child: TranslationProvider(child: const MyApp())));
}

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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  static final _appRouter = AppRouter();
  static final _log = Logger('MyApp');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyApp._log.info("Building MyApp widget");

    ref.watch(authControllerProvider);

    if (!kIsWeb && Platform.isAndroid) {
      ref.watch(updaterControllerProvider);
    }

    final themeMode = ref.watch(appThemeProvider);
    final uiScale = ref.watch(uiScaleNotifierProvider);
    const seedColor = Colors.deepPurple;

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
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.linear(uiScale)),
          child: child!,
        );
      },
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
