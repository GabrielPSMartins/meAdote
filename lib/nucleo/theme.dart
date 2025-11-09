import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color fundoEscuro = Color(0xFF1E1E1E);
final Color fundoClaro = Colors.white;
final Color cartaEscura = Color(0xFF000000);
final Color cartaClara = Color(0xFFF7F7F7);
final Color textoClaro = Color(0xFFFEF6EE);
final Color textoEscuro = Colors.black87;
final Color textoSec = Color(0xFFB3B3B3);
final Color textoSecClaro = Colors.black45;
final Color primaryColor = Color(0xFFF67D2C);
final Color secondaryColor = Color(0xFF007299);
final Color successColor = Color(0xFF3C8B41);
final Color errorColor = Color(0xFFFF5F57);
final Color outlineColor = Color(0xFFCCCCCC);

final ThemeData temaEscuro = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: fundoEscuro,
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFF67D2C),
    secondary: Color(0xFF007299),
    background: Color(0xFF1E1E1E),
    surface: Color(0xFF000000),
    tertiary: Color(0xFF3C8B41),
    error: Color(0xFFFF5F57),
    onPrimary: Colors.white,
    onBackground: Color(0xFFFEF6EE),
    outline: Color(0xFFCCCCCC),
  ),
  textTheme: GoogleFonts.interTextTheme(
    ThemeData.dark().textTheme.apply(
          bodyColor: textoClaro,
          displayColor: textoClaro,
        ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2C2C2C),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: outlineColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: outlineColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: primaryColor, width: 1.5),
    ),
    hintStyle: TextStyle(color: textoClaro.withOpacity(0.6)),
    labelStyle: GoogleFonts.inter(color: textoClaro.withOpacity(0.8)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
    ),
  ),
  cardColor: cartaEscura,
  iconTheme: IconThemeData(color: textoClaro),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF000000),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
  ),
);

final ThemeData temaClaro = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: fundoClaro,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFF67D2C),
    secondary: Color(0xFF007299),
    background: Colors.white,
    surface: Color(0xFFF7F7F7),
    tertiary: Color(0xFF3C8B41),
    error: Color(0xFFFF5F57),
    onPrimary: Colors.white,
    onBackground: Colors.black87,
    outline: Color(0xFFCCCCCC), // Literal no const
  ),
  textTheme: GoogleFonts.interTextTheme(
    ThemeData.light().textTheme.apply(
          bodyColor: textoEscuro,
          displayColor: textoEscuro,
        ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF2F2F2),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: outlineColor, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: outlineColor, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: primaryColor, width: 1.5),
    ),
    hintStyle: TextStyle(color: textoSecClaro),
    labelStyle: GoogleFonts.inter(color: textoEscuro.withOpacity(0.8)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.inter(fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(vertical: 14),
    ),
  ),
  cardColor: cartaClara,
  iconTheme: IconThemeData(color: textoEscuro),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
    elevation: 0,
    centerTitle: true,
  ),
);
