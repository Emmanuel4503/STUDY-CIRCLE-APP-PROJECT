import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/dashboard/widgets/dashboard_card.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class UpcomingSessionCard extends StatelessWidget {
  final IconData icon;
  final String subject;
  final String time;
  final String topic;
  final bool isToday;

  const UpcomingSessionCard({
    super.key,
    required this.icon,
    required this.subject,
    required this.time,
    required this.topic,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Session Icon
          CircleAvatar(
            radius: 28,
            backgroundColor: SColors.primary.withValues(alpha: 0.10),
            child: Icon(
              icon,
              color: SColors.primary,
              size: SSizes.iconMd,
            ),
          ),

          const SizedBox(width: SSizes.spaceBtwItems),

          // Session Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subject,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),

                const SizedBox(height: SSizes.xs),

                Row(
                  children: [
                    Text(
                      time,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),

                    if (isToday) ...[
                      const SizedBox(width: SSizes.sm),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.10),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Today',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: SSizes.xs),

                Text(
                  topic,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      ),
                ),
              ],
            ),
            ),

          const SizedBox(width: SSizes.sm),

          // Arrow
          Center(
            child: Icon(
              Iconsax.arrow_right_3,
              color: Theme.of(context).colorScheme.primary,
              size: SSizes.iconSm,
            ),
          ),
        ],
      ),
    );
  }
}