import 'package:flutter/material.dart';

/// Central registry of icons used in the app.
///
/// Uses Material icons by default. If you later add custom SVG/PNG icons,
/// register their paths here (see `ASSETS.md` for the custom-icon checklist).
abstract class SIcons {
  SIcons._();

  // Material icons (no asset files required).
  static const IconData home = Icons.home_rounded;
  static const IconData profile = Icons.person_rounded;
  static const IconData settings = Icons.settings_rounded;
  static const IconData back = Icons.arrow_back_rounded;
  static const IconData forward = Icons.arrow_forward_rounded;
  static const IconData check = Icons.check_circle_rounded;
  static const IconData error = Icons.error_outline_rounded;

  // Example custom icon path (add the file under assets/icons/).
  static const String customBookIcon = 'assets/icons/book.png';
}
