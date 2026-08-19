import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/dashboard/widgets/dashboard_card.dart';

import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

import '../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final ActivityModel activity;

  const ActivityCard({
    super.key,
    required this.activity,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
  child: ListTile(
    contentPadding: EdgeInsets.zero,

    leading: CircleAvatar(
      backgroundColor: SColors.primary.withValues(alpha: 0.10),
      child: Icon(
        activity.icon,
        color: SColors.primary,
        size: SSizes.iconMd,
      ),
    ),

    title: Text(
      activity.title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
      fontWeight: FontWeight.w600,
),
    ),

    subtitle: Text(
      activity.description,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: SColors.grey,
      ),
    ),

    trailing: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          activity.time,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: SColors.grey,
          ),
        ),

        const SizedBox(height: SSizes.xs),

        const Icon(
          Iconsax.arrow_right_3,
          color: SColors.primary,
          size: SSizes.iconSm,
        ),
      ],
    ),
  ),
);
  }
}