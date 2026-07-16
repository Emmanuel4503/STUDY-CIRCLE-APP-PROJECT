import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ProgressOverview extends StatelessWidget {
  const ProgressOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Progress Overview',
              style: Theme.of(context).textTheme.headlineSmall,
            ),

            const SizedBox(height: 20),

            Text(
              'Overall Progress',
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(height: 12),

            LinearProgressIndicator(
              value: 0.65,
              minHeight: 8,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation(
                SColors.primary,
              ),
            ),

            const SizedBox(height: 10),

            const Text("65% Completed"),

            const SizedBox(height: 24),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 4),
        Text(title),
      ],
    );
  }
}