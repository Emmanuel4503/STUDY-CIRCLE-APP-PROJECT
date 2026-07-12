import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

/// Typography for StudyCycle.
///
/// Provides a light and dark [TextTheme]. The two are identical in size/weight
/// and only differ in color, so headings/body text read correctly on either
/// background. Sizes follow the Material 3 type scale.
abstract class STextTheme {
  STextTheme._();

  static TextTheme light = _build(
    primary: SColors.lightTextPrimary,
    secondary: SColors.lightTextSecondary,
  );

  static TextTheme dark = _build(
    primary: SColors.darkTextPrimary,
    secondary: SColors.darkTextSecondary,
  );

  static TextTheme _build({required Color primary, required Color secondary}) {
    return TextTheme(
      // Display / headline
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: primary),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: primary),
      headlineSmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: primary),

      // Titles
      titleLarge: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: primary),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: primary),
      titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: secondary),

      // Body
      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: primary),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: secondary),
      bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: secondary),

      // Labels (buttons, chips)
      labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primary),
      labelMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: secondary),
    );
  }
}
