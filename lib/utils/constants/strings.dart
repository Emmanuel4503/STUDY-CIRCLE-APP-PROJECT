/// App-wide static text.
///
/// Keeping copy here (rather than inline) makes it easy to review wording and
/// is a good stepping stone toward full localization later.
abstract class SStrings {
  SStrings._();

  static const String appName = 'StudyCycle';
  static const String appTagline = 'Study smarter, in cycles.';

  // Onboarding
  static const String onboardingTitle1 = 'Plan Your Study Cycles';
  static const String onboardingBody1 =
      'Organize your subjects and sessions into focused, repeatable study cycles.';

  static const String onboardingTitle2 = 'Track Your Progress';
  static const String onboardingBody2 =
      'Stay on top of your goals with clear insights into what you have learned.';

  static const String onboardingTitle3 = 'Never Miss a Review';
  static const String onboardingBody3 =
      'Smart reminders bring topics back at the right time so knowledge sticks.';

  // Common actions
  static const String next = 'Next';
  static const String skip = 'Skip';
  static const String getStarted = 'Get Started';
  static const String back = 'Back';
  static const String login = 'Login';
}
