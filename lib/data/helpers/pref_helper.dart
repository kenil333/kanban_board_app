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
}
