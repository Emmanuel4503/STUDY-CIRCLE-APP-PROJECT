import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'package:studycycle/features/dashboard/widgets/quick_action_card.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: QuickActionCard(
            icon: Iconsax.book,
            title: 'Courses',
            onTap: () {},
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: QuickActionCard(
            icon: Iconsax.calendar,
            title: 'Schedule',
            onTap: () {},
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: QuickActionCard(
            icon: Iconsax.people,
            title: 'Groups',
            onTap: () {},
          ),
        ),
      ],
    );
  }
}