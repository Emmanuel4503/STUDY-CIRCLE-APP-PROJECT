import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/radius.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ProgressOverview extends StatelessWidget {
  const ProgressOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: SRadius.allLg,
        side: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(SSizes.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Progress Overview',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  '65%',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),

            const SizedBox(height: SSizes.sm),

            LinearProgressIndicator(
              value: 0.65,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.12),
              valueColor: AlwaysStoppedAnimation(
                Theme.of(context).colorScheme.primary,
              ),
            ),

            const SizedBox(height: SSizes.sm),

            Text(
              "Keep up the great work! You're making steady progress.",
              style: Theme.of(context).textTheme.bodySmall,
            ),

            const SizedBox(height: SSizes.md),

            const Divider(),

            const SizedBox(height: SSizes.sm),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _ProgressItem(
                  title: "Courses",
                  value: "12",
                ),
                _ProgressItem(
                  title: "Streak",
                  value: "15 Days",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final String title;
  final String value;

  const _ProgressItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        const SizedBox(height: 2),

        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              ),
        ),
      ],
    );
  }
}
