import 'package:cinemapedia/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


final themeDataProvider = StateNotifierProvider<ThemeStateNotifier, ThemeData>((ref) {
  return ThemeStateNotifier();
});

class ThemeStateNotifier extends StateNotifier<ThemeData> {
  final ThemeData lightTheme = AppTheme.lightTheme;
  final ThemeData darkTheme = AppTheme.darkTheme;
  final ThemeData initial;
  SharedPreferences? _prefs;

  ThemeStateNotifier({ThemeData? initialTheme}) : initial = initialTheme ?? AppTheme.lightTheme, super(initialTheme ?? AppTheme.lightTheme);

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final isDark = _prefs!.getBool('isDark') ?? false;
    state = isDark ? darkTheme : lightTheme;
  }

  void toggleTheme() async {
    final isDarkMode = state == darkTheme;
    state = isDarkMode ? lightTheme : darkTheme;
    await _prefs?.setBool('isDark', !isDarkMode);
  }
}