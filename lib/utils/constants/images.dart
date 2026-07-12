/// Central registry of image asset paths.
///
/// IMPORTANT: These files do NOT exist yet. See `ASSETS.md` at the project root
/// for the full checklist of images you need to add. Drop the files into the
/// matching folders under `assets/` and the app will pick them up.
///
/// Referencing paths through these constants means a renamed/moved asset is a
/// one-line fix instead of a project-wide search.
abstract class SImages {
  SImages._();

  // ---- Logos ----
  static const String logo = 'assets/logos/studycycle_logo.png';
  static const String logoDark = 'assets/logos/studycycle_logo_dark.png';

  // ---- Splash ----
  static const String splashBackground = 'assets/images/splash_bg.png';

  // ---- Onboarding illustrations ----
  static const String onboarding1 = 'assets/images/onboarding/onboarding_1.png';
  static const String onboarding2 = 'assets/images/onboarding/onboarding_2.png';
  static const String onboarding3 = 'assets/images/onboarding/onboarding_3.png';

  // ---- Misc / placeholders ----
  static const String placeholder = 'assets/images/placeholder.png';
}
