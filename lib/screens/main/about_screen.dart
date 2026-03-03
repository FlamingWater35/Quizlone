import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/widgets/centered_view.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  String _version = '...';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();

    if (kIsWeb) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && !context.router.canPop()) {
          final currentRoutes = context.router.stack
              .map((e) => e.name)
              .toList();
          if (currentRoutes.isEmpty || currentRoutes.first != StartRoute.name) {
            context.router.replaceAll([const StartRoute(), const AboutRoute()]);
          }
        }
      });
    }
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    if (mounted) {
      setState(() {
        _version = info.version;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(t.drawer.about), centerTitle: true),
      body: SafeArea(
        child: CenteredView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset('assets/icon_transparent.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  t.appName,
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  t.aboutScreen.version(version: _version),
                  style: textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  t.drawer.aboutDialog.description,
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                OutlinedButton(
                  onPressed: () {
                    showLicensePage(
                      context: context,
                      applicationName: t.appName,
                      applicationVersion: _version,
                      applicationIcon: Image.asset(
                        'assets/icon_transparent.png',
                        width: 64,
                      ),
                    );
                  },
                  child: Text(t.aboutScreen.viewLicenses),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    t.drawer.aboutDialog.legalese,
                    style: textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.outline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
