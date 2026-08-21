import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studycycle/bottom_navigation_bar.dart' as study_nav;
import 'package:studycycle/features/personalization/setup_profile/model/institution_type_model.dart';
import 'package:studycycle/features/personalization/setup_profile/model/setup_profile_model.dart';
import 'package:studycycle/utils/services/storage_service.dart';
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
  final selectedSchool = ''.obs;

  final schoolController = TextEditingController();

  bool get requiresSchoolSelection {
    final category = selectedCategory.value?.category ?? '';
    return category == 'Tertiary' || category == 'Postgraduate';
  }

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
    selectedSchool.value = '';
    schoolController.clear();

    if (requiresSchoolSelection) {
      currentStep.value = 3;
    } else {
      finishSetup();
      return;
    }

    _updateHighestPage();
  }

  void selectSchool(String school) {
    selectedSchool.value = school;
    schoolController.text = school;
    if (requiresSchoolSelection) {
      currentStep.value = 4;
      _updateHighestPage();
    }
  }

  //==================================================
  // BACK
  //==================================================

  void previousStep() {
    if (currentStep.value == 4) {
      currentStep.value = 3;
    } else if (currentStep.value == 3) {
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
    if (!requiresSchoolSelection) {
      return 3;
    }

    return selectedCategory.value?.institutions != null ? 5 : 4;
  }

  /// Current indicator index
  int get progressStep {
    if (!requiresSchoolSelection) {
      switch (currentStep.value) {
        case 0:
          return 0;
        case 2:
          return 1;
        default:
          return 0;
      }
    }

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
      case 4:
        return 3;
      default:
        return 0;
    }
  }

  /// Highest indicator reached
  int get highestCompletedIndicator {
    if (!requiresSchoolSelection) {
      switch (highestPageReached.value) {
        case 0:
          return 0;
        case 2:
          return 1;
        default:
          return 0;
      }
    }

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
      case 4:
        return 3;
      default:
        return 0;
    }
  }

  void goToStep(int indicatorStep) {
    if (indicatorStep > highestCompletedIndicator) return;

    if (!requiresSchoolSelection) {
      currentStep.value = indicatorStep == 0 ? 0 : 2;
      return;
    }

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
      case 3:
        currentStep.value = 4;
        break;
    }
  }

  void updateHighestPage() {
    if (currentStep.value > highestPageReached.value) {
      highestPageReached.value = currentStep.value;
    }
  }

  void _updateHighestPage() {
    updateHighestPage();
  }

  //==================================================
  // FINISH
  //==================================================

  Future<void> finishSetup() async {
    await StorageService.instance.setProfileSetupCompleted(true);

    final navController = Get.isRegistered<study_nav.NavigationMenuController>()
        ? Get.find<study_nav.NavigationMenuController>()
        : Get.put(study_nav.NavigationMenuController());

    navController.selectedIndex.value = 0;
    Get.offAll(() => const study_nav.BottomNavigationBar());
  }

  @override
  void onClose() {
    schoolController.dispose();
    super.onClose();
  }
}