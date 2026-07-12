import 'package:flutter/material.dart';

import '../constants/spacing.dart';

/// A generic "coming soon" scaffold used by not-yet-built feature screens.
///
/// Lets the whole navigation flow work end-to-end while the real Auth,
/// Home, and Profile screens are still to be implemented.
class PlaceholderScreen extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? subtitle;

  const PlaceholderScreen({
    super.key,
    required this.title,
    this.icon = Icons.construction_rounded,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(SSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 64, color: Theme.of(context).colorScheme.primary),
              SSpacing.gapVmd,
              Text('$title Screen', style: textTheme.headlineSmall),
              SSpacing.gapVsm,
              Text(
                subtitle ?? 'This feature is a placeholder. Build it here.',
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
