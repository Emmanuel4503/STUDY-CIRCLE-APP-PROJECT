import 'package:flutter/material.dart';

/// Central color palette for StudyCycle.
///
/// Themes (`light_theme.dart`, `dark_theme.dart`) reference these constants so
/// the entire app's look can be tuned from one place. Never hard-code a
/// `Color(0x...)` in a widget — add it here first.
abstract class SColors {
  SColors._();

  // ---- Brand / Primary (Green) ----
  static const Color primary = Color(0xFF2E7D32); // Green 800
  static const Color primaryLight = Color(0xFF60AD5E); // Light green variant
  static const Color primaryDark = Color(0xFF005005); // Deep green variant
  static const Color secondary = Color(0xFFA5D6A7); // Light Green
  static const Color accent = Color(0xFF2E7D32); // Accent = Green

  // ---- Neutrals ----
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF4F4F4F);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color lightGrey = Color(0xFFF4F4F4);

  // ---- Light theme surfaces ----
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCard = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFF000000);
  static const Color lightTextSecondary = Color(0xFF4F4F4F);
  static const Color lightBorder = Color(0xFFE0E0E0);
  static const Color lightInputFill = Color(0xFFF4F4F4);

  // ---- Dark theme surfaces ----
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFBDBDBD);
  static const Color darkBorder = Color(0xFF2C2C2C);
  static const Color darkInputFill = Color(0xFF1E1E1E);

  // ---- Feedback / status ----
  static const Color success = Color(0xFF2E7D32);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFF9A825);
  static const Color info = Color(0xFF1976D2);
}
