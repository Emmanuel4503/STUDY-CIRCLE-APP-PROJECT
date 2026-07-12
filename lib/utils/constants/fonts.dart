/// Font family names.
///
/// Register the actual font files in `pubspec.yaml` under `flutter > fonts`,
/// then reference the family here. If [primary] is left null, the app uses the
/// platform default font.
abstract class SFonts {
  SFonts._();

  /// Set to e.g. 'Poppins' once you add the font files and enable them in pubspec.
  static const String? primary = null;
}
