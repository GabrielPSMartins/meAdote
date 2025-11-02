import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color darkBackground = Color(0xFF121212);
final Color cardColor = Color(0xFF1E1E1E);
final Color buttonGray = Color(0xFFA0A0A0);
final Color lightText = Colors.white;
final Color secondaryText = Color(0xFFB3B3B3);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: darkBackground,
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.dark().textTheme.apply(bodyColor: lightText, displayColor: lightText),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: cardColor,
    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    hintStyle: TextStyle(color: secondaryText),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonGray,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 14),
    ),
  ),
  cardColor: cardColor,
  iconTheme: IconThemeData(color: lightText),
  appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
);

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.light().textTheme.apply(bodyColor: Colors.black87, displayColor: Colors.black87),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFF2F2F2),
    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    hintStyle: TextStyle(color: Colors.black45),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: buttonGray,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 14),
    ),
  ),
  cardColor: Color(0xFFF7F7F7),
  iconTheme: IconThemeData(color: Colors.black87),
  appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, elevation: 0, centerTitle: true),
);
