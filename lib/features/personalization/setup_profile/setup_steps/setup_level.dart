import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/personalization/setup_profile/controller/setup_profile_controller.dart';
import 'package:studycycle/features/personalization/widgets/setup_option_tile.dart';

class SetupLevel extends GetView<SetupProfileController> {
  const SetupLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final levels = controller.selectedInstitution.value?.levels ??
          controller.selectedCategory.value?.levels ??
          [];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select your level',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Choose your current academic level.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          Expanded(
            child: ListView(
              children: levels.map((level) {
                return SetupOptionTile(
                  title: level,
                  isSelected: controller.selectedLevel.value == level,
                  onTap: () => controller.selectLevel(level),
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}