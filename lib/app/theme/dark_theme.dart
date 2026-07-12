import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/fonts.dart';
import 'button_theme.dart';
import 'card_theme.dart';
import 'input_theme.dart';
import 'text_theme.dart';

/// The complete dark [ThemeData] for StudyCycle.
///
/// Keeps the green brand primary while switching surfaces to dark grey/black
/// and text to white for comfortable low-light viewing.
abstract class SDarkTheme {
  SDarkTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: SFonts.primary,
    scaffoldBackgroundColor: SColors.darkBackground,

    colorScheme: const ColorScheme.dark(
      primary: SColors.primary,
      onPrimary: SColors.white,
      secondary: SColors.secondary,
      onSecondary: SColors.black,
      surface: SColors.darkSurface,
      onSurface: SColors.darkTextPrimary,
      error: SColors.error,
      onError: SColors.white,
    ),

    textTheme: STextTheme.dark,
    elevatedButtonTheme: SButtonTheme.elevated,
    outlinedButtonTheme: SButtonTheme.outlined,
    textButtonTheme: SButtonTheme.text,
    inputDecorationTheme: SInputTheme.dark,
    cardTheme: SCardTheme.dark,

    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: SColors.darkBackground,
      foregroundColor: SColors.darkTextPrimary,
      iconTheme: IconThemeData(color: SColors.darkTextPrimary),
    ),

    dividerColor: SColors.darkBorder,
  );
}
