import 'package:flutter/material.dart';

import '../services/navigation_service.dart';

class WebAwareBackButton extends StatelessWidget {
  const WebAwareBackButton({super.key, this.color, this.onPressed});

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      color: color,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ?? () => NavigationService.back(context),
    );
  }
}
