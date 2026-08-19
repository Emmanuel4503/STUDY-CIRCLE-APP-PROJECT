import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/dashboard/models/group_model.dart';
import 'package:studycycle/features/dashboard/screens/group_details_screen.dart';
import 'package:studycycle/features/dashboard/widgets/group_card.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/icons.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/constants/spacing.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';
import 'package:studycycle/utils/widgets/filter_list.dart';

class SCirclePage extends StatelessWidget {
  const SCirclePage({super.key});

  @override
  Widget build(BuildContext context) {
    final activeGroups = [
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
    ];

    final discoverGroups = [
      const GroupModel(
        title: 'Data Science',
        members: '20 Members',
        icon: Iconsax.chart_2,
        color: SColors.success,
      ),
      const GroupModel(
        title: 'Web Development',
        members: '16 Members',
        icon: Iconsax.global,
        color: SColors.info,
      ),
    ];

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Circle',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SSizes.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// My Groups
            const Text(
              'My Groups',
              style: TextStyle(
                fontSize: SSizes.fontLg,
                fontWeight: FontWeight.bold,
                color: SColors.lightTextPrimary,
              ),
            ),

            SSpacing.gapVxs,

            Text(
              'Study and collaborate with your groups.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: SColors.lightTextSecondary,
                  ),
            ),

            SSpacing.gapVmd,

            Column(
              children: activeGroups.map((group) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: SSizes.sm,
                  ),
                  child: GroupCard(
                    group: group,
                    isJoined: true,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => GroupDetailsScreen(
                            group: group,
                          ),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: SSizes.lg),

            /// Discover Groups
            const Text(
              'Discover Groups',
              style: TextStyle(
                fontSize: SSizes.fontLg,
                fontWeight: FontWeight.bold,
                color: SColors.lightTextPrimary,
              ),
            ),

            SSpacing.gapVxs,

            Text(
              'Find groups that match your learning interests.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: SColors.lightTextSecondary,
                  ),
            ),

            SSpacing.gapVmd,

            /// Search
             Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search study groups...",
                      prefixIcon: const Icon(SIcons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: SSpacing.sm),
                IconButton(
                  icon: const Icon(Icons.filter_list),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return const FilterList();
                      },
                    );
                  },
                ),
              ],
            ),
            SSpacing.gapVmd,

            Column(
              children: discoverGroups.map((group) {
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: SSizes.sm,
                  ),
                  child: GroupCard(
                    group: group,
                    isJoined: false,
                    onTap: () {},
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: SSizes.lg),
          ],
        ),
      ),
    );
  }
}