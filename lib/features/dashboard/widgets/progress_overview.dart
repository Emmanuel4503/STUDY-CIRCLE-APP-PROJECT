import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/radius.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ProgressOverview extends StatelessWidget {
  const ProgressOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: SSizes.cardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: SRadius.allLg,
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
                        color: SColors.primary,
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
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation(
                SColors.primary,
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
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),

        const SizedBox(height: 4),

        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}