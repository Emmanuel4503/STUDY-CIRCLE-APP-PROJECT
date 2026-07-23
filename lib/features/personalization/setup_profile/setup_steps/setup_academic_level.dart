import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/personalization/setup_profile/controller/setup_profile_controller.dart';
import 'package:studycycle/features/personalization/widgets/setup_option_tile.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class SetupAcademicLevel extends GetView<SetupProfileController> {
  const SetupAcademicLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'What is your academic level?',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 8),
        Text(
          'Choose the option that best describes you.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: SSizes.defaultSpace),

        Expanded(
          child: GridView.builder(
            itemCount: controller.setupProfileData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.3,
            ),
            itemBuilder: (context, index) {
              final category = controller.setupProfileData[index];

              return Obx(
                () => SetupOptionTile(
                  title: category.category,
                  isSelected:
                      controller.selectedCategory.value == category,
                  onTap: () => controller.selectCategory(category),
                ),
              );
            },
          ),
        ),
      ],
    );
    
  }
}

