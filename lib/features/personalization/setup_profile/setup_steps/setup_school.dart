import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/personalization/setup_profile/controller/setup_profile_controller.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class SetupSchool extends GetView<SetupProfileController> {
  const SetupSchool({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Almost there!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),

          Text(
            'Enter the name of your school.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const SizedBox(height: SSizes.spaceBtwSections),

          /// Summary Card
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(SSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your Selection',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: SSizes.sm),

                  Text(
                    'Category: ${controller.selectedCategory.value?.category ?? ''}',
                  ),

                  if (controller.selectedInstitution.value != null)
                    Text(
                      'Institution: ${controller.selectedInstitution.value!.name}',
                    ),

                  Text(
                    'Level: ${controller.selectedLevel.value}',
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: SSizes.spaceBtwSections),

          TextField(
            controller: controller.schoolController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              labelText: 'School Name',
              hintText: 'e.g. Brilliant International Group of Schools, Akure',
              border: OutlineInputBorder(),
            ),
          ),

          const Spacer(),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (controller.schoolController.text.trim().isEmpty) {
                  Get.snackbar(
                    'School Required',
                    'Please enter your school name.',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                controller.finishSetup();
              },
              child: const Text('Finish Setup'),
            ),
          ),
        ],
      ),
    );
  }
}