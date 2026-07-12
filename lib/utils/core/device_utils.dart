import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Device / screen helpers for building responsive UIs.
///
/// These read from a [BuildContext] rather than a global, so they always
/// reflect the current window size (important for tablets & foldables).
abstract class DeviceUtils {
  DeviceUtils._();

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  /// Common responsive breakpoints.
  static bool isMobile(BuildContext context) => screenWidth(context) < 600;
  static bool isTablet(BuildContext context) =>
      screenWidth(context) >= 600 && screenWidth(context) < 1024;
  static bool isDesktop(BuildContext context) => screenWidth(context) >= 1024;

  /// True when the current theme is dark.
  static bool isDarkMode(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;

  /// Hides the on-screen keyboard.
  static void hideKeyboard(BuildContext context) => FocusScope.of(context).unfocus();

  /// Locks orientation to portrait (call from `main` if desired).
  static Future<void> lockPortrait() {
    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
