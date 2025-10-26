import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class AppTheme {
  static ThemeData darkTheme() {
    final base = ThemeData.dark();
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.orange,
      onPrimary: Colors.white,
      secondary: AppColors.teal,
      onSecondary: Colors.white,
      error: Colors.red.shade400,
      onError: Colors.white,
      background: AppColors.darkBackground,
      onBackground: Colors.white,
      surface: Color(0xFF2A2A2A),
      onSurface: Colors.white70,
    );

    return base.copyWith(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: GoogleFonts.interTextTheme(base.textTheme).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Color(0xFF292929),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          textStyle: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}