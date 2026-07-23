import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:studycycle/features/authentication/screens/register/register_screen.dart';
import 'package:studycycle/features/class_room/class_room.dart';
//import 'package:studycycle/features/authentication/screens/verify_email/verify_email.dart';
import 'bindings/splash_binding.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';
import '../utils/constants/strings.dart';
//import '../features/authentication/screens/login/login_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: SStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: AppRoutes.splash,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => const ClassroomScreen(),
      ),
    );
  }
}
