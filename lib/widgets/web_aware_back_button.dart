import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:quizlone/routing/app_router.dart';

class WebAwareBackButton extends StatelessWidget {
  const WebAwareBackButton({super.key, this.fallback});

  final PageRouteInfo? fallback;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () {
        final router = context.router;
        if (router.canPop()) {
          router.back();
        } else {
          router.replace(fallback ?? const StartRoute());
        }
      },
    );
  }
}
