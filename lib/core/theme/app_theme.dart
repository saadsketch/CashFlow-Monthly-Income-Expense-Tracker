import 'package:cash_flow/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    cardColor: AppColors.lightSurface,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.lightAccent,
      surface: AppColors.lightSurface,
    ),
    textTheme: TextTheme(
      titleLarge: AppTextStyles.headline1.copyWith(
        color: AppColors.lightTextPrimary,
      ),
      titleMedium: AppTextStyles.headline2.copyWith(
        color: AppColors.lightTextPrimary,
      ),
      bodyLarge: AppTextStyles.bodyText.copyWith(
        color: AppColors.lightTextPrimary,
      ),
      bodyMedium: AppTextStyles.bodyTextSecondary.copyWith(
        color: AppColors.lightTextSecondary,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkSurface,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.darkAccent,
      surface: AppColors.darkSurface,
    ),
    textTheme: TextTheme(
      titleLarge: AppTextStyles.headline1.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      titleMedium: AppTextStyles.headline2.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      bodyLarge: AppTextStyles.bodyText.copyWith(
        color: AppColors.darkTextPrimary,
      ),
      bodyMedium: AppTextStyles.bodyTextSecondary.copyWith(
        color: AppColors.darkTextSecondary,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
  );
}
