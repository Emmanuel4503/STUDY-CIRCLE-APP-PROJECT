import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:studycycle/features/class_room/widgets/classroom_task_card.dart';
import 'package:studycycle/utils/constants/sizes.dart';
//import 'package:studycycle/utils/helpers/helper_functions.dart';

class AssessmentsTab extends StatelessWidget {
  const AssessmentsTab({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = SHelperFunctions.isDarkMode(context);

    return ListView(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        children: [
          const ClassroomTaskCard(
            title: 'Quiz 2: Data Architecture',
            course: 'Advanced Computer Systems',
            deadline: 'Due: Tomorrow, 11:59 PM',
            statusText: 'Pending',
            statusColor: Colors.orange,
            icon: Iconsax.task_square,
          ),
          const SizedBox(height: SSizes.spaceBtwSections),
          const ClassroomTaskCard(
            title: 'Assignment 1: Literature Review',
            course: 'Postgraduate Research Methodology',
            deadline: 'Due: Friday, Oct 24',
            statusText: 'Submitted',
            statusColor: Colors.green,
            icon: Iconsax.document,
          ),
          const SizedBox(height: SSizes.spaceBtwSections),
          const ClassroomTaskCard(
            title: 'Assignment 2: Data Architecture',
            course: 'Postgraduate Codex Delivery',
            deadline: 'Due: Thursday, Oct 23',
            statusText: 'Pending',
            statusColor: Colors.orange,
            icon: Iconsax.document,
          ),
        ]);
  }
}
