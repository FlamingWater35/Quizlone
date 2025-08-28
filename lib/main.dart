import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:quizlone/i18n/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';

import 'providers/core/settings_provider.dart';
import 'services/database_service.dart';
import 'services/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupLogging();
  await DatabaseService.init();

  final dbService = DatabaseService();
  final savedLangCode = dbService.getLanguage();
  AppLanguageExtension.fromCode(savedLangCode).applyLocale();

  setupWindow();
  runApp(ProviderScope(child: TranslationProvider(child: const MyApp())));
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

  static final _log = Logger('MyApp');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = AppRouter(ref);
    MyApp._log.info("Building MyApp widget");
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
      routerConfig: appRouter.config(),
    );
  }
}
