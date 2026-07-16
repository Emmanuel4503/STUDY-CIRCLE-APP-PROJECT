import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/routes/app_routes.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/spacing.dart';
import '../../../../../utils/constants/strings.dart';
import '../../../../../utils/services/storage_service.dart';
import 'widgets/animated_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startSplash();
    });
  }

  Future<void> _startSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    final hasSeenOnboarding = StorageService.instance.hasSeenOnboarding;
    debugPrint('SplashScreen hasSeenOnboarding=$hasSeenOnboarding');

    if (hasSeenOnboarding) {
      debugPrint('SplashScreen navigating to ${AppRoutes.login}');
      Get.offAllNamed(AppRoutes.login);
    } else {
      debugPrint('SplashScreen navigating to ${AppRoutes.onboarding}');
      Get.offAllNamed(AppRoutes.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: SColors.primary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedLogo(),
            SSpacing.gapVlg,
            Text(
              SStrings.appName,
              style: TextStyle(
                color: SColors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SSpacing.gapVxs,
            Text(
              SStrings.appTagline,
              style: TextStyle(color: SColors.secondary, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
