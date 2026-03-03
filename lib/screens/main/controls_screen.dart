import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/widgets/centered_view.dart';

@RoutePage()
class ControlsScreen extends StatefulWidget {
  const ControlsScreen({super.key});

  @override
  State<ControlsScreen> createState() => _ControlsScreenState();
}

class _ControlsScreenState extends State<ControlsScreen> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(t.controlsScreen.title), centerTitle: true),
      body: SafeArea(
        child: CenteredView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              const double breakpoint = 600.0;
              final bool isWide = constraints.maxWidth >= breakpoint;

              return isWide ? const _WideLayout() : const _NarrowLayout();
            },
          ),
        ),
      ),
    );
  }
}

class _NarrowLayout extends StatelessWidget {
  const _NarrowLayout();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [_GesturesPanel(), SizedBox(height: 16), _KeyboardPanel()],
      ),
    );
  }
}

class _WideLayout extends StatelessWidget {
  const _WideLayout();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _GesturesPanel()),
          SizedBox(width: 24),
          Expanded(child: _KeyboardPanel()),
        ],
      ),
    );
  }
}

class _GesturesPanel extends StatelessWidget {
  const _GesturesPanel();

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Card(
      child: Column(
        children: [
          _SectionHeader(title: t.controlsScreen.gesturesTitle),
          const Divider(indent: 16, endIndent: 16),
          _ControlTile(
            icon: Icons.swipe_left_outlined,
            title: t.controlsScreen.nextCard,
            subtitle: t.controlsScreen.swipeLeft,
          ),
          _ControlTile(
            icon: Icons.swipe_right_outlined,
            title: t.controlsScreen.previousCard,
            subtitle: t.controlsScreen.swipeRight,
          ),
          _ControlTile(
            icon: Icons.swipe_up_outlined,
            title: t.controlsScreen.flipCard,
            subtitle: t.controlsScreen.swipeVertical,
          ),
        ],
      ),
    );
  }
}

class _KeyboardPanel extends StatelessWidget {
  const _KeyboardPanel();

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Card(
      child: Column(
        children: [
          _SectionHeader(title: t.controlsScreen.keyboardTitle),
          const Divider(indent: 16, endIndent: 16),
          _ControlTile(
            icon: Icons.arrow_forward,
            title: t.controlsScreen.nextCard,
            subtitle: t.controlsScreen.arrowRight,
          ),
          _ControlTile(
            icon: Icons.arrow_back,
            title: t.controlsScreen.previousCard,
            subtitle: t.controlsScreen.arrowLeft,
          ),
          _ControlTile(
            icon: Icons.space_bar_outlined,
            title: t.controlsScreen.flipCard,
            subtitle: t.controlsScreen.arrowVerticalOrSpace,
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: textTheme.titleLarge?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ControlTile extends StatelessWidget {
  const _ControlTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    return ListTile(
      leading: Icon(icon, color: colorScheme.primary),
      title: Text(title, style: textTheme.titleMedium),
      subtitle: Text(subtitle, style: textTheme.bodyMedium),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }
}
