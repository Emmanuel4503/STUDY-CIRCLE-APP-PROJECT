import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/dashboard/models/group_model.dart';
import 'package:studycycle/features/dashboard/screens/group_details_screen.dart';
import 'package:studycycle/features/dashboard/screens/groups_screen.dart';
import 'package:studycycle/features/dashboard/widgets/active_group_card.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/constants/spacing.dart';

class ActiveGroups extends StatelessWidget {
  const ActiveGroups({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = [
      const GroupModel(
        title: 'Accounting 101',
        members: '24 Members',
        icon: Iconsax.receipt_item,
        color: SColors.primary,
      ),
      const GroupModel(
        title: 'Mathematics',
        members: '18 Members',
        icon: Iconsax.calculator,
        color: SColors.info,
      ),
      const GroupModel(
        title: 'Flutter Development',
        members: '15 Members',
        icon: Iconsax.code,
        color: SColors.warning,
      ),
      const GroupModel(
        title: 'Data Science',
        members: '20 Members',
        icon: Iconsax.chart_2,
        color: SColors.success,
      ),
    ];

    final displayedGroups = groups.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Active Groups',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: SSizes.fontLg,
                    fontWeight: FontWeight.bold,
                  ),
            ),

            TextButton.icon(
              onPressed: () {
                Get.to(() => const GroupsScreen());
              },
              icon: const Text(
                'See All',
                style: TextStyle(
                  color: SColors.primary,
                ),
              ),
              label: const Icon(
                Iconsax.arrow_right_3,
                size: 16,
                color: SColors.primary,
              ),
            ),
          ],
        ),

        SSpacing.gapVmd,

        Column(
          children: displayedGroups.map((group) {
            return Padding(
              padding: const EdgeInsets.only(
                bottom: SSizes.sm,
              ),
              child: ActiveGroupCard(
                group: group,
                onTap: () {
                  Get.to(
                    () => GroupDetailsScreen(
                      group: group,
                    ),
                  );
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
