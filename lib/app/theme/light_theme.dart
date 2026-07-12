import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/fonts.dart';
import 'button_theme.dart';
import 'card_theme.dart';
import 'input_theme.dart';
import 'text_theme.dart';

/// The complete light [ThemeData] for StudyCycle.
///
/// Composes the shared component themes (buttons, inputs, cards, text) with a
/// green-based Material 3 color scheme on a white background.
abstract class SLightTheme {
  SLightTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: SFonts.primary,
    scaffoldBackgroundColor: SColors.lightBackground,

    colorScheme: const ColorScheme.light(
      primary: SColors.primary,
      onPrimary: SColors.white,
      secondary: SColors.secondary,
      onSecondary: SColors.black,
      surface: SColors.lightSurface,
      onSurface: SColors.lightTextPrimary,
      error: SColors.error,
      onError: SColors.white,
    ),

    textTheme: STextTheme.light,
    elevatedButtonTheme: SButtonTheme.elevated,
    outlinedButtonTheme: SButtonTheme.outlined,
    textButtonTheme: SButtonTheme.text,
    inputDecorationTheme: SInputTheme.light,
    cardTheme: SCardTheme.light,

    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: SColors.lightBackground,
      foregroundColor: SColors.lightTextPrimary,
      iconTheme: IconThemeData(color: SColors.lightTextPrimary),
    ),

    dividerColor: SColors.lightBorder,
  );
}
