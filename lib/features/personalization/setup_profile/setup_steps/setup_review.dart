import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/personalization/setup_profile/controller/setup_profile_controller.dart';
import 'package:studycycle/utils/constants/sizes.dart';

class SetupReview extends GetView<SetupProfileController> {
  const SetupReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Review your details',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Please confirm your selections before finishing setup.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: SSizes.spaceBtwSections),
          Card(
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(SSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ReviewRow(
                    label: 'Category',
                    value: controller.selectedCategory.value?.category ?? '-',
                  ),
                  const SizedBox(height: SSizes.md),
                  if (controller.selectedInstitution.value != null)
                    _ReviewRow(
                      label: 'Institution',
                      value: controller.selectedInstitution.value!.name,
                    ),
                  if (controller.selectedInstitution.value != null)
                    const SizedBox(height: SSizes.md),
                  _ReviewRow(
                    label: 'Level',
                    value: controller.selectedLevel.value.isEmpty
                        ? '-'
                        : controller.selectedLevel.value,
                  ),
                  const SizedBox(height: SSizes.md),
                  _ReviewRow(
                    label: 'School',
                    value: controller.selectedSchool.value.isEmpty
                        ? '-'
                        : controller.selectedSchool.value,
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.finishSetup(),
              child: const Text('Finish Setup'),
            ),
          ),
        ],
      ),
    );
  }
}

class _ReviewRow extends StatelessWidget {
  const _ReviewRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey.shade600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
