import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telegram_night_theme/theme_data.dart';

class ThemeService {
  ThemeService._();

  static late SharedPreferences preferences;
  static ThemeService? _instance;

  static Future<ThemeService> get instance async {
    if (_instance == null) {
      preferences = await SharedPreferences.getInstance();
      _instance = ThemeService._();
    }
    return _instance!;
  }

  final allThemes = <String, ThemeData>{'dark': darkTheme, 'light': lightTheme};

  get initial {
    String? themeName = preferences.getString('theme');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
      themeName = isPlatformDark ? 'dark' : 'light';
    }
    return allThemes[themeName];
  }

  save(String newThemeName) {
    preferences.setString('theme', newThemeName);
  }

  ThemeData getByName(String name) {
    return allThemes[name]!;
  }
}
