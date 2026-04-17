import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';
import 'package:quizlone/services/smooth_scroll.dart';
import 'package:quizlone/widgets/centered_view.dart';
import 'package:quizlone/widgets/web_aware_back_button.dart';

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
  final _scrollController = SmoothScrollController();
  String _version = '...';

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
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
      appBar: AppBar(
        leading: const WebAwareBackButton(fallback: StartRoute()),
        title: Text(t.drawer.about),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CenteredView(
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: SizedBox(
                      width: 128,
                      height: 128,
                      child: Image.asset('assets/icon.png'),
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
                        'assets/icon.png',
                        width: 64,
                      ),
                    );
                  },
                  child: Text(t.aboutScreen.viewLicenses),
                ),
                const SizedBox(height: 60),
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
