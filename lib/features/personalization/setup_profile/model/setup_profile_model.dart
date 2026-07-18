import 'package:studycycle/features/personalization/setup_profile/model/institution_type_model.dart';

class SetupProfileModel {
  final String category;

  /// Used by Primary, Secondary, Postgraduate
  final List<String>? levels;

  /// Used by Tertiary
  final List<InstitutionTypeModel>? institutions;

  const SetupProfileModel({
    required this.category,
    this.levels,
    this.institutions,
  });
}