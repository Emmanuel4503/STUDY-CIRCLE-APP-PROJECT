import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/dashboard/widgets/upcoming_session_card.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class UpcomingSessions extends StatelessWidget {
  const UpcomingSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Upcoming Sessions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Text(
                    'See All',
                    style: TextStyle(
                      color: SColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Iconsax.arrow_right_3,
                    size: 16,
                    color: SColors.primary,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: SSizes.md),

        const UpcomingSessionCard(
          icon: Iconsax.receipt_item,
          subject: 'Accounting 101',
          time: '2:00 PM',
          topic: 'Chapter 5: Financial Statements',
          isToday: true,
        ),

        const SizedBox(height: SSizes.sm),

        const UpcomingSessionCard(
          icon: Iconsax.code,
          subject: 'Flutter Development',
          time: 'Tomorrow • 10:00 AM',
          topic: 'Build Dashboard UI',
        ),
      ],
    );
  }
}