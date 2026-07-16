import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/radius.dart';

/// Text field / input decoration theming.
///
/// Provides a light and dark variant. Both use a filled style with a green
/// focus border to match the brand.
abstract class SInputTheme {
  SInputTheme._();

  static final InputDecorationTheme light = _build(
    fill: SColors.lightInputFill,
    border: SColors.lightBorder,
    hint: SColors.grey,
    label: SColors.lightTextSecondary,
  );

  static final InputDecorationTheme dark = _build(
    fill: SColors.darkInputFill,
    border: SColors.darkBorder,
    hint: SColors.grey,
    label: SColors.darkTextSecondary,
  );

  static InputDecorationTheme _build({
    required Color fill,
    required Color border,
    required Color hint,
    required Color label,
  }) {
    OutlineInputBorder outline(Color color, [double width = 1]) => OutlineInputBorder(
          borderRadius: SRadius.allMd,
          borderSide: BorderSide(color: color, width: width),
        );

    return InputDecorationTheme(
      filled: true,
      fillColor: fill,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: TextStyle(color: hint),
      labelStyle: TextStyle(color: label),
      enabledBorder: outline(border),
      focusedBorder: outline(SColors.primary, 1.5),
      errorBorder: outline(SColors.error),
      focusedErrorBorder: outline(SColors.error, 1.5),
    );
  }
}
