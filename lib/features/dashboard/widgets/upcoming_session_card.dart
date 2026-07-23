import 'package:flutter/material.dart';
import 'package:studycycle/features/dashboard/widgets/dashboard_card.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class UpcomingSessionCard extends StatelessWidget {
  final IconData icon;
  final String subject;
  final String time;
  final String topic;

  const UpcomingSessionCard({
    super.key,
    required this.icon,
    required this.subject,
    required this.time,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Row(
        children: [
          CircleAvatar(
            radius: SSizes.iconLg,
            backgroundColor: SColors.primary.withValues(alpha: 0.1),
            child: Icon(
              icon,
              color: SColors.primary,
              size: SSizes.iconMd,
            ),
          ),

          const SizedBox(width: SSizes.spaceBtwItems),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                const SizedBox(height: SSizes.xs),

                Text(
                  time,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: SColors.grey,
                  ),
                ),

                const SizedBox(height: SSizes.xs),

                Text(
                  topic,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: SColors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}