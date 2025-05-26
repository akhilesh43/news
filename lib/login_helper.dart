import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static const String _loginKey = 'isLoggedIn';

  // Save login state
  static Future<void> setLogin(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginKey, isLoggedIn);
  }

  // Retrieve login state
  static Future<bool> getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginKey) ?? false;
  }

  // Clear login state
  static Future<void> clearLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_loginKey);
  }
}
