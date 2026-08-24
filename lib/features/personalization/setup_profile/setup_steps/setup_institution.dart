import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/personalization/setup_profile/controller/setup_profile_controller.dart';
import 'package:studycycle/features/personalization/setup_profile/widgets/setup_option_tile.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class SetupInstitution extends GetView<SetupProfileController> {
  const SetupInstitution({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final institutions =
          controller.selectedCategory.value?.institutions ?? [];

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select your institution type',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Choose the type of institution you currently attend.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),

          Expanded(
            child: GridView.builder(
              itemCount: institutions.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: SSizes.spaceBtwItems,
                mainAxisSpacing: SSizes.spaceBtwItems,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                final institution = institutions[index];

                return SetupOptionTile(
                  title: institution.name,
                  isSelected:
                      controller.selectedInstitution.value == institution,
                  onTap: () => controller.selectInstitution(institution),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}