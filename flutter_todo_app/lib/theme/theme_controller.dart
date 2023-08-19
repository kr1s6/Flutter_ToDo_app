import 'package:flutter/material.dart';

import 'theme_saved.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.light;
  ThemeMode get mode => _mode;

  IconData _themeIcon = Icons.nightlight;
  String _themeString = "Dark mode";
  get themeIcon => _themeIcon;
  get themeString => _themeString;

  final _theme = ThemeSavedPreference();

  ThemeNotifier() {
    _theme.getDarkTheme().then((value) {
      print('Value get from storage: ${value.toString()}');
      var isDarkTheme = value ?? false;
      if (isDarkTheme) {
        _themeIcon = Icons.wb_sunny;
        _themeString = "Light mode";
        _mode = ThemeMode.dark;
        print("Dark theme");
      } else {
        _themeIcon = Icons.nightlight;
        _themeString = "Dark mode";
        _mode = ThemeMode.light;
        print("Light theme");
      }
      notifyListeners();
    });
  }

  void changeThemeMode() {
    if (_mode == ThemeMode.light) {
      _themeIcon = Icons.wb_sunny;
      _themeString = "Light mode";
      _mode = ThemeMode.dark;
      _theme.setDarkTheme(true);
      print("set dark theme");
    } else {
      _themeIcon = Icons.nightlight;
      _themeString = "Dark mode";
      _mode = ThemeMode.light;
      _theme.setDarkTheme(false);
      print("set light theme");
    }
    notifyListeners();
  }
}
