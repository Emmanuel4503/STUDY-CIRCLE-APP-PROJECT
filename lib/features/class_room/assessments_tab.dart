import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/widgets/classroom_task_card.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/constants/colors.dart'; // Utilizing your color palette

class AssessmentsTab extends StatelessWidget {
  const AssessmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // URGENT ACTION & INSIGHTS BANNER
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: SColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  color: SColors.warning.withValues(alpha: 0.3), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: SColors.warning.withValues(alpha: 0.06),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: SColors.warning.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Iconsax.timer_1_copy,
                      color: SColors.warning, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Urgent Assessment Due',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: SColors.lightTextPrimary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Your Data Architecture Quiz closes in less than 36 hours.',
                        style: TextStyle(
                            fontSize: 12,
                            color: SColors.lightTextSecondary
                                .withValues(alpha: 0.9)),
                      ),
                    ],
                  ),
                ),
                Icon(Iconsax.arrow_right_3_copy,
                    size: 16, color: SColors.darkGrey.withValues(alpha: 0.6)),
              ],
            ),
          ),
          const SizedBox(height: SSizes.spaceBtwSections),

          // SECTION HEADER 1
          const Text(
            'Your Open Tasks',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: SColors.lightTextPrimary),
          ),
          const SizedBox(height: 12),

          // ASSESSMENTS TASKS
          const ClassroomTaskCard(
            title: 'Quiz 2: Data Architecture',
            course: 'Advanced Computer Systems',
            deadline: 'Due: Tomorrow, 11:59 PM',
            statusText: 'Pending',
            statusColor: SColors.warning, // Tied directly to theme color
            icon: Iconsax.task_square_copy,
          ),
          const SizedBox(height: 12), // Tighter card spacing for cleaner view

          const ClassroomTaskCard(
            title: 'Assignment 1: Literature Review',
            course: 'Postgraduate Research Methodology',
            deadline: 'Due: Friday, Oct 24',
            statusText: 'Submitted',
            statusColor: SColors.success, // Tied directly to theme color
            icon: Iconsax.document_text_1_copy,
          ),
          const SizedBox(height: 12),

          const ClassroomTaskCard(
            title: 'Assignment 2: Data Architecture',
            course: 'Postgraduate Codex Delivery',
            deadline: 'Due: Thursday, Oct 23',
            statusText: 'Pending',
            statusColor: SColors.warning, // Tied directly to theme color
            icon: Iconsax.document_copy,
          ),
          const SizedBox(height: SSizes.spaceBtwSections),

          // PEER REVIEW EXCHANGE INTERACTIVE PANEL
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  SColors.primary.withValues(alpha: 0.03),
                  SColors.primary.withValues(alpha: 0.08)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                  color: SColors.primary.withValues(alpha: 0.15), width: 1.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Iconsax.people_copy, color: SColors.primary, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Anonymous Peer Review',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: SColors.primary),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Submit an early draft of your assignment to get anonymous feedback from your StudyCircle classmates before grading.',
                  style: TextStyle(
                      fontSize: 12, color: SColors.lightTextSecondary),
                ),
                const SizedBox(height: 14),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: SColors.primary,
                    foregroundColor: SColors.white,
                    elevation: 2,
                    shadowColor: SColors.primary.withValues(alpha: 0.3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                  icon: const Icon(Iconsax.document_upload_copy, size: 16),
                  label: const Text('Drop a Draft File',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
