import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizlone/providers/core/settings_provider.dart';

class CenteredView extends ConsumerWidget {
  const CenteredView({super.key, required this.child, this.maxWidth = 800.0});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiScale = ref.watch(uiScaleNotifierProvider);
    final adjustedMaxWidth = maxWidth * (1 + (uiScale - 1) * 0.3);
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: adjustedMaxWidth),
        child: child,
      ),
    );
  }
}
