import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static bool _theme = false;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // theme
  static bool get theme {
    return _prefs.getBool('theme') ?? _theme;
  }

  static set theme(bool theme) {
    _theme = theme;
    _prefs.setBool('theme', theme);
  }
}
