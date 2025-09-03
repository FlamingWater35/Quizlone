import 'package:flutter/material.dart';

void showErrorSnackBar(BuildContext context, {required String message}) {
  final theme = Theme.of(context);
  final colorScheme = theme.colorScheme;
  final isDarkMode = theme.brightness == Brightness.dark;

  final Color backgroundColor =
      isDarkMode ? Colors.red.shade900 : colorScheme.errorContainer;
  final Color contentColor =
      isDarkMode ? Colors.red.shade100 : colorScheme.onErrorContainer;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Row(
        children: [
          Icon(Icons.error_outline, color: contentColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: contentColor, fontSize: 15),
            ),
          ),
        ],
      ),
    ),
  );
}
