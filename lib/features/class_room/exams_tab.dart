import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/widgets/classroom_task_card.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class ExamsTab extends StatelessWidget {
  const ExamsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(SSizes.defaultSpace),
      children: [
        const ClassroomTaskCard(
          title: '1st Semester Mock Examination',
          course: 'General Studies (GST 101)',
          deadline: 'Scheduled: Oct 28, 9:00AM',
          statusText: 'Locked',
          statusColor: Colors.blueGrey,
          icon: Iconsax.note_2_copy,
        ),
        const SizedBox(height: SSizes.spaceBtwItems),
        const ClassroomTaskCard(
          title: 'Postgraduate Comprehensive Assessment',
          course: 'Research Core Module',
          deadline: 'Completed on: Oct 12',
          statusText: 'Graded (A)',
          statusColor: Colors.purple,
          icon: Iconsax.award_copy,
        ),
      ],
    );
  }
}
