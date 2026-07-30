import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/dashboard/models/group_model.dart';
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Active Groups',
              style: TextStyle(
                fontSize: SSizes.fontLg,
                fontWeight: FontWeight.bold,
                color: SColors.lightTextPrimary,
              ),
            ),

            TextButton(
              onPressed: () {},
              child: const Text('See All'),
            ),
          ],
        ),

        SSpacing.gapVmd,

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: groups.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: SSizes.md,
            mainAxisSpacing: SSizes.md,
            childAspectRatio: 1.15,
          ),
          itemBuilder: (context, index) {
            return ActiveGroupCard(
              group: groups[index],
            );
          },
        ),
      ],
    );
  }
}