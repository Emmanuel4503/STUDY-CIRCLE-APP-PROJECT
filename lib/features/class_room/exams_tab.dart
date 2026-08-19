import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/widgets/exam_card.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/constants/colors.dart';

class ExamsTab extends StatelessWidget {
  const ExamsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // MASTER SYLLABUS ENGAGEMENT HEADER
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: SColors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: SColors.lightBorder, width: 1.2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.03),
                  blurRadius: 15,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Iconsax.radar_2_copy,
                            color: SColors.error, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          'UPCOMING REVIEWS',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: SColors.error.withValues(alpha: 0.9),
                              fontSize: 11,
                              letterSpacing: 1),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: const BoxDecoration(
                          color: SColors.lightGrey,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Text('2 Active Units',
                          style: TextStyle(
                              color: SColors.darkGrey,
                              fontSize: 11,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Text(
                  'Examination Portal',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: SColors.lightTextPrimary),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Track certified institutional benchmarks, take automated mock papers, and monitor grading metrics.',
                  style: TextStyle(
                      fontSize: 12, color: SColors.lightTextSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: SSizes.spaceBtwSections),

          // SECTION TITLE
          const Text(
            'Your Assigned Exams',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: SColors.lightTextPrimary),
          ),
          const SizedBox(height: 12),

          // EXAM CARDS
          const ExamCard(
            title: '1st Semester Mock Examination',
            course: 'General Studies (GST 101)',
            timeDetail: 'Scheduled: Oct 28, 9:00AM',
            statusText: 'Coming Soon',
            statusColor: Color(0xFF607D8B), // Smooth BlueGrey accent
            icon: Iconsax.note_2_copy,
            isInteractive: false,
            metaLabel: 'Time Limit: 120 Mins',
          ),

          const ExamCard(
            title: 'Postgraduate Comprehensive Assessment',
            course: 'Research Core Module',
            timeDetail: 'Completed on: Oct 12',
            statusText: 'Graded (A)',
            statusColor: SColors.exam1,
            icon: Iconsax.award_copy,
            isInteractive: true,
            metaLabel: 'Score: 92/100',
          ),
        ],
      ),
    );
  }
}
