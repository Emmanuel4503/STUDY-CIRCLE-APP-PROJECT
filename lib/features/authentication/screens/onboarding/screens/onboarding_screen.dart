import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/onboarding/screens/widgets/onboarding_page.dart';
import 'package:studycycle/features/authentication/screens/onboarding/screens/widgets/page_indicator.dart';

import '../../../../../../utils/constants/spacing.dart';
import '../../../../../../utils/constants/strings.dart';
import '../../../../../../utils/widgets/primary_button.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Obx(
                () => TextButton(
                  onPressed: controller.isLastPage ? null : controller.skip,
                  child: Opacity(
                    opacity: controller.isLastPage ? 0 : 1,
                    child: const Text(SStrings.skip),
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.pages.length,
                itemBuilder: (_, index) =>
                    OnboardingPage(data: controller.pages[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(SSpacing.lg),
              child: Column(
                children: [
                  Obx(
                    () => PageIndicator(
                      count: controller.pages.length,
                      currentIndex: controller.currentPage.value,
                    ),
                  ),
                  SSpacing.gapVlg,
                  Obx(
                    () => PrimaryButton(
                      label: controller.isLastPage
                          ? SStrings.getStarted
                          : SStrings.next,
                      onPressed: controller.next,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
