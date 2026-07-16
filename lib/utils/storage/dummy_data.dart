import 'package:studycycle/features/authentication/screens/onboarding/models/onboarding_model.dart';

import '../constants/images.dart';
import '../constants/strings.dart';


/// In-memory sample data used while building the UI before a backend exists.
///
/// Replace these with real API/data sources as features are implemented.
abstract class DummyData {
  DummyData._();

  /// Slides shown on the onboarding screen.
  static const List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      image: SImages.onboarding1,
      title: SStrings.onboardingTitle1,
      description: SStrings.onboardingBody1,
    ),
    OnboardingModel(
      image: SImages.onboarding2,
      title: SStrings.onboardingTitle2,
      description: SStrings.onboardingBody2,
    ),
    OnboardingModel(
      image: SImages.onboarding3,
      title: SStrings.onboardingTitle3,
      description: SStrings.onboardingBody3,
    ),
  ];
}
