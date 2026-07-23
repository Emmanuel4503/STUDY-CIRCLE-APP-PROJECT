import 'package:flutter/material.dart';
import 'package:studycycle/features/class_room/widgets/voting_polls_options.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/radius.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class VotingPollsTab extends StatelessWidget {
  const VotingPollsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      children: [
        // Live custom voting poll panel item blueprint
        Container(
          padding: const EdgeInsets.all(SSizes.md),
          decoration: BoxDecoration(
            border: Border.all(color: SColors.grey),
            borderRadius: BorderRadius.circular(SRadius.sm),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text('LIVE POLL',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 10,
                            fontWeight: FontWeight.bold)),
                  ),
                  const Text('Closes in 4h',
                      style: TextStyle(color: SColors.darkGrey, fontSize: 12)),
                ],
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
              Text('When should we hold the exam review sync session?',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: SSizes.spaceBtwItems),

              // Mock Vote Option A
              const VotingPollsOptions(
                  optionText: 'Saturday, 4:00 PM',
                  progressValue: 0.65,
                  percentageText: '65%'),
              const SizedBox(height: SSizes.spaceBtwInputFields / 2),

              // Mock Vote Option B
              const VotingPollsOptions(
                  optionText: 'Sunday, 7:00 PM',
                  progressValue: 0.35,
                  percentageText: '35%'),
            ],
          ),
        ),
      ],
    );
  }
}
