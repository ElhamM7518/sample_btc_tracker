import 'package:flutter/material.dart';
import 'package:sample_btc_tracker/core/presentation/theme/app_colors.dart';
import 'package:sample_btc_tracker/gen/fonts.gen.dart';

TextTheme appTextTheme(bool isDarkMode) {
  final color = isDarkMode ? AppColors.lightestGray : AppColors.mainBlack;
  return TextTheme(
    displayLarge: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w700,
      fontSize: 20,
      letterSpacing: 0,
      height: 30 / 20,
      color: color,
    ),
    displayMedium: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w500,
      fontSize: 16, // Corrected font size
      letterSpacing: 0,
      height: 20 / 16,
      color: color,
    ),
    displaySmall: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0,
      height: 15 / 14,
      color: color,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w600, // SemiBold
      fontSize: 16,
      letterSpacing: 0,
      height: 25 / 16,
      color: color,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w600,
      fontSize: 14,
      letterSpacing: 0,
      height: 20 / 14,
      color: color,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      letterSpacing: 0,
      height: 18 / 12,
      color: color,
    ),
    titleLarge: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w500, // Medium
      fontSize: 30,
      letterSpacing: 1,
      height: 35 / 30,
      color: color,
    ),
    titleMedium: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w500,
      fontSize: 20,
      letterSpacing: 1,
      height: 25 / 20,
      color: color,
    ),
    titleSmall: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      letterSpacing: 1,
      height: 20 / 18,
      color: color,
    ),
    labelLarge: const TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0,
      height: 30 / 16,
      color: AppColors.lightGray,
    ),
    labelMedium: const TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0,
      height: 25 / 14,
      color: AppColors.lightGray,
    ),
    labelSmall: const TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0,
      height: 20 / 12,
      color: AppColors.lightGray,
    ),
    bodyLarge: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w400, // Regular
      fontSize: 16,
      letterSpacing: 0,
      height: 30 / 16,
      color: color,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0,
      height: 25 / 14,
      color: color,
    ),
    bodySmall: TextStyle(
      fontFamily: FontFamily.roboto,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0,
      height: 20 / 12,
      color: color,
    ),
  );
}
