import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/radius.dart';
import '../../utils/constants/sizes.dart';

/// Button styling shared by both themes.
///
/// The brand green stays the same in light and dark mode, so a single set of
/// button themes works for both. Referenced from `light_theme.dart` and
/// `dark_theme.dart`.
abstract class SButtonTheme {
  SButtonTheme._();

  /// Filled primary button (green background, white text).
  static final ElevatedButtonThemeData elevated = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: SColors.primary,
      foregroundColor: SColors.white,
      disabledBackgroundColor: SColors.grey,
      disabledForegroundColor: SColors.white,
      minimumSize: const Size(double.infinity, SSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: SSizes.fontMd, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: SRadius.allMd),
    ),
  );

  /// Outlined secondary button (green border + text).
  static final OutlinedButtonThemeData outlined = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: SColors.primary,
      side: const BorderSide(color: SColors.primary, width: 1.5),
      minimumSize: const Size(double.infinity, SSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: SSizes.fontMd, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: SRadius.allMd),
    ),
  );

  /// Low-emphasis text button.
  static final TextButtonThemeData text = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: SColors.primary,
      textStyle: const TextStyle(fontSize: SSizes.fontMd, fontWeight: FontWeight.w600),
    ),
  );
}
