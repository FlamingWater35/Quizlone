import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quizlone/i18n/translations.g.dart';
import 'package:quizlone/widgets/centered_view.dart';

@RoutePage()
class ControlsScreen extends StatelessWidget {
  const ControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    Widget buildControlTile(IconData icon, String title, String subtitle) {
      return ListTile(
        leading: Icon(icon, color: colorScheme.primary),
        title: Text(title, style: textTheme.titleMedium),
        subtitle: Text(subtitle, style: textTheme.bodyMedium),
        contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      );
    }

    Widget buildSectionHeader(String title) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
        child: Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(t.controlsScreen.title), centerTitle: true),
      body: SafeArea(
        child: CenteredView(
          child: ListView(
            children: [
              buildSectionHeader(t.controlsScreen.gesturesTitle),
              const Divider(indent: 24, endIndent: 24),
              buildControlTile(
                Icons.swipe_left_outlined,
                t.controlsScreen.nextCard,
                t.controlsScreen.swipeLeft,
              ),
              buildControlTile(
                Icons.swipe_right_outlined,
                t.controlsScreen.previousCard,
                t.controlsScreen.swipeRight,
              ),
              buildControlTile(
                Icons.swipe_up_outlined,
                t.controlsScreen.flipCard,
                t.controlsScreen.swipeVertical,
              ),
              buildSectionHeader(t.controlsScreen.keyboardTitle),
              const Divider(indent: 24, endIndent: 24),
              buildControlTile(
                Icons.arrow_forward,
                t.controlsScreen.nextCard,
                t.controlsScreen.arrowRight,
              ),
              buildControlTile(
                Icons.arrow_back,
                t.controlsScreen.previousCard,
                t.controlsScreen.arrowLeft,
              ),
              buildControlTile(
                Icons.space_bar_outlined,
                t.controlsScreen.flipCard,
                t.controlsScreen.arrowVerticalOrSpace,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
