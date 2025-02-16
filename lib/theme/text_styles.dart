import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test1/theme/app_colors.dart';

class AppTextStyles {
  // * HEADLINES
  static TextStyle headlineLarge = GoogleFonts.montserrat(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle headlineMedium = GoogleFonts.montserrat(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle headlineSmall = GoogleFonts.montserrat(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  // * BODY TEXT
  static TextStyle bodyLarge = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static TextStyle bodyMedium = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  static TextStyle bodySmall = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );

  // * BUTTON
  static TextStyle buttonText = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  // * CAPTIONS
  static TextStyle caption = GoogleFonts.montserrat(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.black,
  );
}
