import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeNotifier = StateNotifierProvider<ThemeModeProvider, ThemeMode>(
  (ref) => ThemeModeProvider(),
);

class ThemeModeProvider extends StateNotifier<ThemeMode> {
  ThemeModeProvider() : super(ThemeMode.dark);

  // cambio del theme
  void toggleTheme() {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  // establece un theme en especifico
  void setTheme(ThemeMode themeMode) {
    state = themeMode;
  }

  // para obtener el theme actual
  ThemeMode get themeMode => state;

  // para obtener si el theme actual es oscuro
  bool get isDark => state == ThemeMode.dark;
}
