import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:studycycle/features/dashboard/widgets/dashboard_card.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class RecommendedResourceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String type;

  const RecommendedResourceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      child: ListTile(
        contentPadding: EdgeInsets.zero,

        leading: CircleAvatar(
          backgroundColor: SColors.secondary,
          child: Icon(
            icon,
            color: SColors.primary,
            size: SSizes.iconMd,
          ),
        ),

        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),

        subtitle: Text(
          type,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: SColors.grey,
              ),
        ),

        trailing: const Icon(
          Iconsax.arrow_right_3,
          size: SSizes.iconSm,
          color: SColors.primary,
        ),
      ),
    );
  }
}