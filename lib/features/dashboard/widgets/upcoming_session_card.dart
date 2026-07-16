import 'package:flutter/material.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class UpcomingSessionCard extends StatelessWidget {
  final IconData icon;
  final String subject;
  final String time;
  final String topic;

  const UpcomingSessionCard({
    super.key,
    required this.icon,
    required this.subject,
    required this.time,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: SColors.primary.withValues(alpha: 0.1),
              child: Icon(
                icon,
                color: SColors.primary,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 4),

                  Text(time),

                  const SizedBox(height: 4),

                  Text(
                    topic,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}