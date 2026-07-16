import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/onboarding/models/onboarding_model.dart';

import '../../../../../../app/routes/app_routes.dart';
import '../../../../../../utils/services/storage_service.dart';
import '../../../../../../utils/storage/dummy_data.dart';

class OnboardingController extends GetxController {
  final _storage = StorageService.instance;

  final PageController pageController = PageController();

  final RxInt currentPage = 0.obs;

  /// The slides to display.
  List<OnboardingModel> get pages => DummyData.onboardingPages;

  bool get isLastPage => currentPage.value == pages.length - 1;

  void onPageChanged(int index) => currentPage.value = index;

  void next() {
    if (isLastPage) {
      finish();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Skip straight to the end of onboarding.
  void skip() => finish();

  Future<void> finish() async {
    await _storage.setOnboardingSeen(true);
    Get.offAllNamed(AppRoutes.login);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
