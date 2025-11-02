import 'package:flutter/material.dart';

// Controlador simples para tema (não persiste em disco).
// Padrão: ThemeMode.dark
final ValueNotifier<ThemeMode> themeController = ValueNotifier(ThemeMode.dark);
