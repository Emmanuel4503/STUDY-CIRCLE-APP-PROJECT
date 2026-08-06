import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

import '../models/activity_model.dart';
import 'activity_card.dart';

class RecentActivity extends StatelessWidget {
  RecentActivity({super.key});

  final List<ActivityModel> activities = [
      const ActivityModel(
    title: "Accounting 101",
    description: "Completed Chapter 5",
    time: "Today",
    icon: Iconsax.book_1,
  ),
    const ActivityModel(
      title: "Study Group",
      description: "Joined Mathematics Group",
      time: "Yesterday",
      icon: Iconsax.people,
    ),
    const ActivityModel(
      title: "Quiz",
      description: "Scored 18/20",
      time: "2 days ago",
      icon: Iconsax.note,
    ),
    const ActivityModel(
      title: "Study Streak",
      description: "5 Days in a row",
      time: "This Week",
      icon: Iconsax.flash_1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recent Activity",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Text(
                    "See All",
                    style: TextStyle(
                      color: SColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Iconsax.arrow_right_3,
                    size: SSizes.iconSm,
                    color: SColors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activities.length,
          itemBuilder: (context, index) {
            return ActivityCard(
              activity: activities[index],
            );
          },
        ),
      ],
    );
  }
}