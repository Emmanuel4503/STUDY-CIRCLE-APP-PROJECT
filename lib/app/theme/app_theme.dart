import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

/// Single entry point for the app's themes.
///
/// `app.dart` reads [lightTheme] and [darkTheme] from here. This indirection
/// means the rest of the app never needs to know how the themes are built.
abstract class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => SLightTheme.theme;
  static ThemeData get darkTheme => SDarkTheme.theme;
}
