import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  AppTheme._();
  static ThemeData get themeDark => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 10, 10, 10),
        cardColor: const Color.fromARGB(255, 0, 0, 0),
        colorScheme: const ColorScheme.dark(
          primary: Colors.lightBlue,
        ),
      );
  static ThemeData get themeLight => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
        cardColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Colors.lightBlue,
        ),
      );
}
