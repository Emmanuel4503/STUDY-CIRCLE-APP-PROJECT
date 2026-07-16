import 'package:flutter/material.dart';

import '../constants/icons.dart';
import '../constants/spacing.dart';

/// A friendly, reusable error state with an optional retry action.
///
/// Named `AppErrorView` to avoid clashing with Flutter's built-in
/// `ErrorWidget`.
class AppErrorView extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const AppErrorView({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(SSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(SIcons.error, size: 48, color: Theme.of(context).colorScheme.error),
            SSpacing.gapVmd,
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (onRetry != null) ...[
              SSpacing.gapVmd,
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Retry'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
