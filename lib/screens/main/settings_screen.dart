import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/core/settings_provider.dart';
import '../../widgets/centered_view.dart';

@RoutePage()
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(appThemeProvider);
    final themeNotifier = ref.read(appThemeProvider.notifier);
    final theme = Theme.of(context);
    final roundedShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: SafeArea(
        child: CenteredView(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 8.0,
                          bottom: 4.0,
                        ),
                        child: Text(
                          'Appearance',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      const Divider(),
                      RadioListTile<ThemeMode>(
                        shape: roundedShape,
                        title: const Text('System Default'),
                        value: ThemeMode.system,
                        groupValue: currentTheme,
                        onChanged: (value) => themeNotifier.setTheme(value!),
                      ),
                      RadioListTile<ThemeMode>(
                        shape: roundedShape,
                        title: const Text('Light'),
                        value: ThemeMode.light,
                        groupValue: currentTheme,
                        onChanged: (value) => themeNotifier.setTheme(value!),
                      ),
                      RadioListTile<ThemeMode>(
                        shape: roundedShape,
                        title: const Text('Dark'),
                        value: ThemeMode.dark,
                        groupValue: currentTheme,
                        onChanged: (value) => themeNotifier.setTheme(value!),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
