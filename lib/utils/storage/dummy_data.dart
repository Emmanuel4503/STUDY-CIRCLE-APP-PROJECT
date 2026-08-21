import 'package:studycycle/features/authentication/screens/onboarding/models/onboarding_model.dart';
import 'package:studycycle/features/cycle/library/models/book_model.dart';
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
    title: 'Atomic Habits',
    author: 'James Clear',
    coverImage: 'assets/images/books/habits.jpg',
    rating: 4.8,
    category: 'Personal Development',
     totalPages: 312,
      currentPage: 40,
    
  ),

  BookModel(
    title: 'Deep Work',
    author: 'Cal Newport',
    coverImage: 'assets/images/books/deepwork.jpg',
    rating: 4.7,
    category: 'Productivity',
     totalPages: 288,
      currentPage: 120,
  ),

  BookModel(
    title: 'The Psychology of Money',
    author: 'Morgan Housel',
    coverImage: 'assets/images/books/pschomoney.jpg',
    rating: 4.9,
    category: 'Finance',
     totalPages: 256,
      currentPage: 80,
  ),

  BookModel(
    title: 'Rich Dad Poor Dad',
    author: 'Robert Kiyosaki',
    coverImage: 'assets/images/books/richdad.jpg',
    rating: 4.6,
    category: 'Finance',
    totalPages: 160,
    currentPage: 40,
  ),

  BookModel(
    title: 'Think and Grow Rich',
    author: 'Napoleon Hill',
    coverImage: 'assets/images/books/thinkgrowrich.jpg',
    rating: 4.8,
    category: 'Personal Development',
    totalPages: 238,
    currentPage: 135,
  ),

  BookModel(
    title: 'The 7 Habits of Highly Effective People',
    author: 'Stephen Covey',
    coverImage: 'assets/images/books/habits.jpg',
    rating: 4.7,
    category: 'Personal Development',
    totalPages: 224,
    currentPage: 100,
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
