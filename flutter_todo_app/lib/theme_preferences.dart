import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static const themeStatus = "THEMESTATUS";

  setDarkTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(themeStatus) ?? false;
  }
}
