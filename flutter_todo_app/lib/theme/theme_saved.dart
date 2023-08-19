import 'package:shared_preferences/shared_preferences.dart';

class ThemeSavedPreference {
  static const themeMode = "themeMode";

  setDarkTheme(bool value) async {
    print("setDarkTheme");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeMode, value);
  }

  getDarkTheme() async {
    print("getDarkTheme");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeMode);
  }

  removeValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(themeMode);
  }
}
