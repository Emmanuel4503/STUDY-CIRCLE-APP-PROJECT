import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/features/cycle/Profile/profile.dart';
import 'package:studycycle/features/personalization/setup_profile/model/institution_type_model.dart';
import 'package:studycycle/features/personalization/setup_profile/model/setup_profile_model.dart';
import 'package:studycycle/utils/storage/dummy_data.dart';

class SetupProfileController extends GetxController {
  static SetupProfileController get instance => Get.find();

  final currentStep = 0.obs;
  final progressStep = 0.obs;

  final setupProfileData = DummyData.setupProfileData;

  final selectedCategory = Rxn<SetupProfileModel>();
  final selectedInstitution = Rxn<InstitutionTypeModel>();
  final selectedLevel = ''.obs;

  final schoolController = TextEditingController();
  final highestCompletedStep = 0.obs;

  void _updateCompletedStep() {
  if (currentStep.value > highestCompletedStep.value) {
    highestCompletedStep.value = currentStep.value;
  }
}

  void selectCategory(SetupProfileModel category) {
    selectedCategory.value = category;

    // Clear previous selections
    selectedInstitution.value = null;
    selectedLevel.value = '';
    schoolController.clear();

    // If category has institutions (e.g Tertiary) show Institution page.
    if (category.institutions != null) {
      currentStep.value = 1;
      progressStep.value = 1;
    } else {
      // Otherwise skip to Level page.
      currentStep.value = 2;
      progressStep.value = 1;
    }

    _updateCompletedStep();
  
  }

  void selectInstitution(InstitutionTypeModel institution) {
    selectedInstitution.value = institution;
    selectedLevel.value = '';

    currentStep.value = 2;
     progressStep.value = 2;

    _updateCompletedStep();
  }

  // -----------------------------
  void selectLevel(String level) {
    selectedLevel.value = level;
    currentStep.value = 3;

    if (selectedCategory.value?.institutions != null) {
    progressStep.value = 3;
  } else {
    progressStep.value = 2;
  }

    _updateCompletedStep();
  }

 void previousStep() {
  if (currentStep.value == 3) {
    currentStep.value = 2;

    if (selectedCategory.value?.institutions != null) {
      progressStep.value = 2;
    } else {
      progressStep.value = 1;
    }
  } else if (currentStep.value == 2) {
    if (selectedCategory.value?.institutions != null) {
      currentStep.value = 1;
      progressStep.value = 1;
    } else {
      currentStep.value = 0;
      progressStep.value = 0;
    }
  } else if (currentStep.value == 1) {
    currentStep.value = 0;
    progressStep.value = 0;
  }
}
  int get totalSteps {
    if (selectedCategory.value?.institutions != null) {
      return 4;
    }
    return 3;
  }

  void goToStep(int step) {
  if (step <= highestCompletedStep.value) {
    currentStep.value = step;
  }
}

  void finishSetup() {
    Get.offAll(() => const ProfileScreen());
  }

  @override
  void onClose() {
    schoolController.dispose();
    super.onClose();
  }
}
