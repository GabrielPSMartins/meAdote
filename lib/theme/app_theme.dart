import 'package:flutter/material.dart';

class AppColors {
  static const Color black90 = Color(0xFF1E1E1E);
  static const Color brown = Color(0xFF7A513B);
  static const Color orange = Color(0xFFF67D2C);
  static const Color coral = Color(0xFFFF5F57);
  static const Color green = Color(0xFF3CB841);
  static const Color blueDeep = Color(0xFF016AAA);
  static const Color cream = Color(0xFFFEF6EE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color teal = Color(0xFF007299);
  static const Color yellow = Color(0xFFFBBC05);
  static const Color taupe = Color(0xFFA9907F);
  static const Color peach = Color(0xFFE4BDA3);
  static const Color pureBlack = Color(0xFF000000);
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.teal,
    scaffoldBackgroundColor: AppColors.cream,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.black90,
      foregroundColor: AppColors.white,
      elevation: 2,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.teal,
      secondary: AppColors.orange,
      background: AppColors.cream,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
    ),
    
    textTheme: TextTheme(
  titleLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.black90,
  ),
  bodyLarge: TextStyle(
    fontSize: 14,
    color: AppColors.pureBlack,
  ),
  bodyMedium: TextStyle(
    fontSize: 13,
    color: AppColors.brown,
  ),
),

elevatedButtonTheme: ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.orange, // antigo 'primary'
    foregroundColor: AppColors.white,  // antigo 'onPrimary'
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
),
);
}