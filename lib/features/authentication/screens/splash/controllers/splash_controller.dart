import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../../../app/routes/app_routes.dart';
import '../../../../../../utils/services/storage_service.dart';

class SplashController extends GetxController {
  final _storage = StorageService.instance;

  @override
  void onReady() {
    super.onReady();
    debugPrint('SplashController.onReady called');
    _decideNextRoute();
  }

  Future<void> _decideNextRoute() async {
    await Future.delayed(const Duration(seconds: 2));

    final hasSeenOnboarding = _storage.hasSeenOnboarding;
    debugPrint(
        'SplashController._decideNextRoute hasSeenOnboarding=$hasSeenOnboarding');

    if (hasSeenOnboarding) {
      debugPrint('SplashController navigating to ${AppRoutes.login}');
      Get.offAllNamed(AppRoutes.login);
    } else {
      debugPrint('SplashController navigating to ${AppRoutes.onboarding}');
      Get.offAllNamed(AppRoutes.onboarding);
    }
  }
}
