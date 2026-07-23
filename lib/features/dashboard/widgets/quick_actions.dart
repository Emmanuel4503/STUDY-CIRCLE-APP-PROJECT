import 'package:flutter/material.dart';
import 'package:studycycle/features/dashboard/widgets/quick_action_card.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        QuickActionCard(
          icon: Icons.menu_book,
          title: 'My Courses',
          onTap: () {},
        ),
        QuickActionCard(
          icon: Icons.calendar_month,
          title: 'Schedule',
          onTap: () {},
        ),
        QuickActionCard(
          icon: Icons.show_chart,
          title: 'Progress',
          onTap: () {},
        ),
        QuickActionCard(
          icon: Icons.groups,
          title: 'Study Groups',
          onTap: () {},
        ),
      ],
    );
  }
}