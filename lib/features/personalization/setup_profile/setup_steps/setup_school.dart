import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/college_of_edu/college_of_edu.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/polytechnic/polytechnic.dart';
import 'package:studycycle/features/authentication/screens/register/undergraduate/university/university.dart';
import 'package:studycycle/features/personalization/setup_profile/controller/setup_profile_controller.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class SetupSchool extends GetView<SetupProfileController> {
  const SetupSchool({super.key});

  List<String> getSchoolOptions() {
    final institutionName = controller.selectedInstitution.value?.name ?? 'University';

    switch (institutionName) {
      case 'Polytechnic':
        return polytechnicOptions;
      case 'College of Education':
        return collegeOfEducationOptions;
      case 'University':
      default:
        return universityOptions;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (!controller.requiresSchoolSelection) {
          return const SizedBox.shrink();
        }

        final schoolOptions = getSchoolOptions();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Almost there!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Search and choose your school.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: SSizes.spaceBtwSections),
            TextField(
              onChanged: (value) {
                final normalized = value.trim().toLowerCase();
                if (normalized.isEmpty) {
                  controller.selectedSchool.value = '';
                  return;
                }

                String? match;
                for (final school in schoolOptions) {
                  if (school.toLowerCase().contains(normalized)) {
                    match = school;
                    break;
                  }
                }

                if (match != null) {
                  controller.selectSchool(match);
                }
              },
              decoration: const InputDecoration(
                labelText: 'Search school',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: SSizes.spaceBtwSections),
            Expanded(
              child: ListView.separated(
                itemCount: schoolOptions.length,
                separatorBuilder: (_, __) => const SizedBox(height: SSizes.spaceBtwItems),
                itemBuilder: (context, index) {
                  final school = schoolOptions[index];
                  final selected = controller.selectedSchool.value == school;

                  return InkWell(
                    borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                    onTap: () {
                      controller.selectSchool(school);
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(SSizes.md),
                      decoration: BoxDecoration(
                        color: selected
                            ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.08)
                            : Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(SSizes.borderRadiusMd),
                        border: Border.all(
                          color: selected
                              ? Theme.of(context).colorScheme.primary
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              school,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: selected
                                        ? Theme.of(context).colorScheme.primary
                                        : null,
                                  ),
                            ),
                          ),
                          if (selected)
                            Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}