import 'package:flutter/material.dart';
import 'package:studycycle/features/dashboard/widgets/upcoming_session_card.dart';

class UpcomingSessions extends StatelessWidget {
  const UpcomingSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Upcoming Sessions',
          style: Theme.of(context).textTheme.headlineSmall,
        ),

        const SizedBox(height: 16),

        const UpcomingSessionCard(
          icon: Icons.calculate,
          subject: 'Accounting 101',
          time: 'Today • 2:00 PM',
          topic: 'Chapter 5: Financial Statements',
        ),

        const UpcomingSessionCard(
          icon: Icons.flutter_dash,
          subject: 'Flutter Development',
          time: 'Tomorrow • 10:00 AM',
          topic: 'Build Dashboard UI',
        ),
      ],
    );
  }
}