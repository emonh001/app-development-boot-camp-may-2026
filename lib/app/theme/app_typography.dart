import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  AppTypography._();

  static TextTheme get textTheme => TextTheme(
    // Headlines
    headlineLarge: GoogleFonts.inter(
      fontSize: 32,
      color: Color(0xFF312E81),
      fontWeight: FontWeight.w700,
      height: 40 / 32,
      letterSpacing: -0.02 * 32,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 32 / 24,
      letterSpacing: -0.01 * 24,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),

    // Titles
    titleLarge: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 28 / 20,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 24 / 16,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 20 / 14,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),

    // Body
    bodyLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 24 / 16,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 20 / 14,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 16 / 12,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),

    // Labels
    labelLarge: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 16 / 12,
      letterSpacing: 0.05 * 12,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 16 / 11,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 14 / 10,
      fontFeatures: const [
        FontFeature.tabularFigures(),
      ],
    ),
  );

  // Custom text styles for specific use cases
  static TextStyle get amountLarge => GoogleFonts.inter(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 40 / 32,
    letterSpacing: -0.02 * 32,
    fontFeatures: const [
      FontFeature.tabularFigures(),
    ],
  );

  static TextStyle get amountMedium => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 32 / 24,
    letterSpacing: -0.01 * 24,
    fontFeatures: const [
      FontFeature.tabularFigures(),
    ],
  );

  static TextStyle get transactionAmount => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 24 / 16,
    fontFeatures: const [
      FontFeature.tabularFigures(),
    ],
  );

  static TextStyle get buttonText => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
    letterSpacing: 0.05 * 14,
  );
}