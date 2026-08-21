import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/app/common/widgets/page_indicator.dart';
import 'package:studycycle/features/personalization/setup_profile/controller/setup_profile_controller.dart';
import 'package:studycycle/features/personalization/setup_profile/setup_steps/setup_academic_level.dart';
import 'package:studycycle/features/personalization/setup_profile/setup_steps/setup_institution.dart';
import 'package:studycycle/features/personalization/setup_profile/setup_steps/setup_level.dart';
import 'package:studycycle/features/personalization/setup_profile/setup_steps/setup_review.dart';
import 'package:studycycle/features/personalization/setup_profile/setup_steps/setup_school.dart';
import 'package:studycycle/utils/constants/sizes.dart';
import 'package:studycycle/utils/widgets/custom_appbar.dart';

class SSetupProfile extends StatelessWidget {
  const SSetupProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SetupProfileController());
    const pages = [
      SetupAcademicLevel(key: ValueKey('academic')),
      SetupInstitution(key: ValueKey('institution')),
      SetupLevel(key: ValueKey('level')),
      SetupSchool(key: ValueKey('school')),
      SetupReview(key: ValueKey('review')),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        title: "Complete Profile",
        onBack: () {
          if (controller.currentStep.value == 0) {
            Get.back();
            return;
          }
          controller.previousStep();
        },
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              PageIndicator(
                count: controller.totalSteps,
                currentIndex: controller.progressStep,
                onTap: controller.goToStep,
              ),
              const SizedBox(height: SSizes.spaceBtwSections),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: pages[controller.currentStep.value],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
