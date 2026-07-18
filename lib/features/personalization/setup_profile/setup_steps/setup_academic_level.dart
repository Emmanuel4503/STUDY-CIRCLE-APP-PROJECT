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
          child: ListView(
            children: controller.setupProfileData.map((category) {
              return SetupOptionTile(
                title: category.category,
                onTap: () => controller.selectCategory(category),
              );
            }).toList(),
          ),
        ),
      ],
    );
    
  }
}

