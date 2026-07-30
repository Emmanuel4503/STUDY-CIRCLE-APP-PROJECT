import 'package:studycycle/features/authentication/screens/onboarding/models/onboarding_model.dart';
import 'package:studycycle/features/cycle/library/model/book_model.dart';
import 'package:studycycle/features/personalization/setup_profile/model/institution_type_model.dart';
import 'package:studycycle/features/personalization/setup_profile/model/setup_profile_model.dart';

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

  // Data for Library 
  static const List<BookModel> books = [
  BookModel(
    title: "Automated Gas Station",
    author: "Techtopsy",
    coverImage: "assets/images/books/book1.jpg",
    rating: 4.8,
  ),
  BookModel(
    title: "The creative Work",
    author: "Eniola",
    coverImage: "assets/images/books/book2.jpg",
    rating: 4.7,
  ),
  BookModel(
    title: "Solidarity",
    author: "Temidayo",
    coverImage: "assets/images/books/book3.jpg",
    rating: 4.6,
  ),
  BookModel(
    title: "Survival of the best price",
    author: "Emmanuel",
    coverImage: "assets/images/books/book4.jpg",
    rating: 4.9,
  ),
  BookModel(
    title: "Lets study together",
    author: "Ade",
    coverImage: "assets/images/books/book2.jpg",
    rating: 4.9,
  ),
  BookModel(
    title: "Fresh Produce",
    author: "Emma",
    coverImage: "assets/images/books/book3.jpg",
    rating: 4.9,
  ),
];

  // Data for setUp profile screen
   static const List<SetupProfileModel> setupProfileData = [

   SetupProfileModel(
    category: 'Primary School',
    levels: [
      'Primary 1',
      'Primary 2',
      'Primary 3',
      'Primary 4',
      'Primary 5',
      'Primary 6',
    ],
  ),

   SetupProfileModel(
    category: 'Secondary School',
    levels: [
      'JSS 1',
      'JSS 2',
      'JSS 3',
      'SS 1',
      'SS 2',
      'SS 3',
    ],
  ),

  SetupProfileModel(
    category: 'Tertiary',
    institutions: [

      InstitutionTypeModel(
        name: 'University',
        levels: [
          '100 Level',
          '200 Level',
          '300 Level',
          '400 Level',
          '500 Level',
          '600 Level',
        ],
      ),

      InstitutionTypeModel(
        name: 'Polytechnic',
        levels: [
          'ND 1',
          'ND 2',
          'HND 1',
          'HND 2',
        ],
      ),

      InstitutionTypeModel(
        name: 'College of Education',
        levels: [
          'NCE 1',
          'NCE 2',
          'NCE 3',
        ],
      ),

    ],
  ),

  SetupProfileModel(
    category: 'Postgraduate',
    levels: [
      'PGD',
      'Masters',
      'MPhil',
      'PhD',
    ],
  ),

];
}
