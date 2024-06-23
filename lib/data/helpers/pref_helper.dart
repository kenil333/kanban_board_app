import 'package:shared_preferences/shared_preferences.dart';

class PrefHelper {
  static Future<bool> getBool(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(key) ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(key, value);
  }

  static Future<String?> getString(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(key, value);
  }

  static Future<int?> getInt(String key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key);
  }

  static Future<bool> setInt(String key, int value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setInt(key, value);
  }
}
