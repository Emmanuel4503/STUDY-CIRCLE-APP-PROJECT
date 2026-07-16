import 'package:get/get.dart';
import 'package:studycycle/features/authentication/screens/splash/screens/splash_screen.dart';

import '../bindings/splash_binding.dart';
import '../bindings/onboarding_binding.dart';

import '../../features/authentication/screens/onboarding/screens/onboarding_screen.dart';
import '../../features/authentication/screens/login/login_screen.dart';

import 'app_routes.dart';

abstract class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),
  ];
}
