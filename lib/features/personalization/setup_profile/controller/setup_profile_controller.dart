import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/cycle/Profile/profile.dart';
import 'package:studycycle/features/personalization/setup_profile/model/institution_type_model.dart';
import 'package:studycycle/features/personalization/setup_profile/model/setup_profile_model.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';

class SetupProfileController extends GetxController {
  static SetupProfileController get instance => Get.find();

  /// Current page being displayed
  final currentStep = 0.obs;

  /// Data
  final setupProfileData = DummyData.setupProfileData;

  /// Selected values
  final selectedCategory = Rxn<SetupProfileModel>();
  final selectedInstitution = Rxn<InstitutionTypeModel>();
  final selectedLevel = ''.obs;

  final schoolController = TextEditingController();

  /// Furthest page the user has reached
  final highestPageReached = 0.obs;

  //==================================================
  // CATEGORY
  //==================================================

  void selectCategory(SetupProfileModel category) {
    selectedCategory.value = category;

    selectedInstitution.value = null;
    selectedLevel.value = '';
    schoolController.clear();

    if (category.institutions != null) {
      currentStep.value = 1;
    } else {
      currentStep.value = 2;
    }

    _updateHighestPage();
  }

  //==================================================
  // INSTITUTION
  //==================================================

  void selectInstitution(InstitutionTypeModel institution) {
    selectedInstitution.value = institution;

    selectedLevel.value = '';

    currentStep.value = 2;

    _updateHighestPage();
  }

  //==================================================
  // LEVEL
  //==================================================

  void selectLevel(String level) {
    selectedLevel.value = level;

    currentStep.value = 3;

    _updateHighestPage();
  }

  //==================================================
  // BACK
  //==================================================

  void previousStep() {
    if (currentStep.value == 3) {
      currentStep.value = 2;
    } else if (currentStep.value == 2) {
      if (selectedCategory.value?.institutions != null) {
        currentStep.value = 1;
      } else {
        currentStep.value = 0;
      }
    } else if (currentStep.value == 1) {
      currentStep.value = 0;
    }
  }

  //==================================================
  // PAGE INDICATOR
  //==================================================

  /// Number of visible steps
  int get totalSteps {
    return selectedCategory.value?.institutions != null ? 4 : 3;
  }

  /// Current indicator index
  int get progressStep {
    if (selectedCategory.value?.institutions != null) {
      return currentStep.value;
    }

    switch (currentStep.value) {
      case 0:
        return 0;
      case 2:
        return 1;
      case 3:
        return 2;
      default:
        return 0;
    }
  }

  /// Highest indicator reached
  int get highestCompletedIndicator {
    if (selectedCategory.value?.institutions != null) {
      return highestPageReached.value;
    }

    switch (highestPageReached.value) {
      case 0:
        return 0;
      case 2:
        return 1;
      case 3:
        return 2;
      default:
        return 0;
    }
  }

  void goToStep(int indicatorStep) {
    if (indicatorStep > highestCompletedIndicator) return;

    if (selectedCategory.value?.institutions != null) {
      currentStep.value = indicatorStep;
      return;
    }

    switch (indicatorStep) {
      case 0:
        currentStep.value = 0;
        break;
      case 1:
        currentStep.value = 2;
        break;
      case 2:
        currentStep.value = 3;
        break;
    }
  }

  void _updateHighestPage() {
    if (currentStep.value > highestPageReached.value) {
      highestPageReached.value = currentStep.value;
    }
  }

  //==================================================
  // FINISH
  //==================================================

  void finishSetup() {
    Get.offAll(() => const ProfileScreen());
  }

  @override
  void onClose() {
    schoolController.dispose();
    super.onClose();
  }
}