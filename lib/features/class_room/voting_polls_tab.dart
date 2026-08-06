import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/widgets/archive_pool.dart';
import 'package:studycycle/features/class_room/widgets/voting_polls_options.dart';
import 'package:studycycle/utils/constants/colors.dart';
import 'package:studycycle/utils/constants/radius.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class VotingPollsTab extends StatelessWidget {
  const VotingPollsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Live Voting Poll
          Container(
            padding: const EdgeInsets.all(SSizes.md + 4),
            decoration: BoxDecoration(
              color: SColors.white,
              borderRadius: BorderRadius.circular(SRadius.md),
              border: Border.all(color: SColors.lightBorder, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Row with modern badges
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: SColors.primary.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          CircleAvatar(
                              radius: 3, backgroundColor: SColors.primary),
                          SizedBox(width: 6),
                          Text('LIVE POLL',
                              style: TextStyle(
                                  color: SColors.primary,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5)),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Iconsax.clock_copy,
                            size: 14,
                            color: SColors.darkGrey.withValues(alpha: 0.7)),
                        const SizedBox(width: 4),
                        const Text('Closes in 4h',
                            style: TextStyle(
                                color: SColors.darkGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: SSizes.spaceBtwItems),

                // Poll Question Statement
                Text(
                  'When should we hold the exam review sync session?',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: SColors.lightTextPrimary,
                        height: 1.3,
                      ),
                ),
                const SizedBox(height: SSizes.spaceBtwItems),

                // Mock Vote Option A
                const VotingPollsOptions(
                  optionText: 'Saturday, 4:00 PM',
                  progressValue: 0.65,
                  percentageText: '65%',
                ),
                const SizedBox(height: SSizes.spaceBtwInputFields),

                // Mock Vote Option B
                const VotingPollsOptions(
                  optionText: 'Sunday, 7:00 PM',
                  progressValue: 0.35,
                  percentageText: '35%',
                ),
                const SizedBox(height: 14),

                // Total Votes Meta Tracer
                Text(
                  'Total: 48 votes casted',
                  style: TextStyle(
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                      color: SColors.grey.withValues(alpha: 0.9)),
                ),
              ],
            ),
          ),
          const SizedBox(height: SSizes.spaceBtwSections),

          // Classroom Poll Decision History
          const Text(
            'Past Poll Results',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: SColors.lightTextPrimary),
          ),
          const SizedBox(height: 12),

          const ArchivePool(
            question: 'Which chapter was hardest in Advanced Computer Systems?',
            winnerOption: 'Chapter 4: Micro-kernels & Scheduling',
            totalVotes: 112,
          ),
        ],
      ),
    );
  }
}
