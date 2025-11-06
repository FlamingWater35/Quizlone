import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/i18n/generated/translations.g.dart';
import 'package:quizlone/routing/app_router.dart';

import '../../providers/study/study_list_providers.dart';
import '../../widgets/centered_view.dart';
import '../../widgets/sidebar_widget.dart';

@RoutePage()
class StartScreen extends ConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(t.startScreen.title), centerTitle: true),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: CenteredView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  t.startScreen.welcome,
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    ref.invalidate(studyListFormProvider);
                    context.router.push(const InputRoute());
                  },
                  label: Text(t.startScreen.createNewList),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: textTheme.titleLarge,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  icon: const Icon(Icons.folder_open_outlined),
                  onPressed: () {
                    context.router.push(const LoadListRoute());
                  },
                  label: Text(t.startScreen.openSavedList),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: textTheme.titleLarge,
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
