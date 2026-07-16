/// Standard sizing values (heights, icon sizes, font sizes).
///
/// Using named constants keeps sizing consistent across the app and makes
/// global tweaks trivial.
abstract class SSizes {
  SSizes._();

  // Font sizes
  static const double fontSm = 14.0;
  static const double fontMd = 16.0;
  static const double fontLg = 18.0;
  static const double fontXl = 24.0;

  // Icon sizes
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  // Component heights
  static const double buttonHeight = 52.0;
  static const double inputFieldHeight = 56.0;
  static const double appBarHeight = 56.0;

  // Image / avatar sizes
  static const double logoHeight = 120.0;
  static const double onboardingImageHeight = 300.0;
  static const double avatar = 56.0;

  // Elevation
  static const double cardElevation = 2.0;

  // Default spacing between sections
  static const double defaultSpace = 24.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;

  // Border radius
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;

  // Padding and margin sizes
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // Input field
  static const double inputFieldRadius = 12.0;
  static const double spaceBtwInputFields = 16.0;
}
