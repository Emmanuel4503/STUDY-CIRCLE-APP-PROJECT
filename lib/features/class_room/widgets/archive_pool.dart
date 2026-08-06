import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/radius.dart';

class ArchivePool extends StatelessWidget {
  const ArchivePool({
    super.key,
    required this.question,
    required this.winnerOption,
    required this.totalVotes,
  });

  final String question;
  final String winnerOption;
  final int totalVotes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: SColors.lightBackground,
        borderRadius: BorderRadius.circular(SRadius.md),
        border: Border.all(color: SColors.lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: SColors.lightTextPrimary),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: SColors.lightInputFill,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Iconsax.tick_circle_copy,
                    color: SColors.primary, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Winner: $winnerOption',
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: SColors.lightTextSecondary),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Final count: $totalVotes students voted',
            style: const TextStyle(fontSize: 11, color: SColors.grey),
          ),
        ],
      ),
    );
  }
}
