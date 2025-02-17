import 'package:shared_preferences/shared_preferences.dart';

class CalSharedPreferences {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static containKey(String key) {
    return _preferences?.get(key);
  }

  static setString(String key, String value) {
    return _preferences?.setString(key, value);
  }

  static String getString(String key) {
    return _preferences?.getString(key) ?? "";
  }

// You can add similar functions for other data types as needed

// Example:
  static setBool(String key, bool value) {
    return _preferences?.setBool(key, value);
  }

  static bool getBool(String key) {
    return _preferences?.getBool(key) ?? false;
  }

  static setdouble(String key, double value) {
    return _preferences?.setDouble(key, value);
  }

  static double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  static setInt(String key, int value) {
    return _preferences?.setInt(key, value);
  }

  static int? getInt(String key) {
    return _preferences?.getInt(key);
  }
  // Remove a key-value pair
  static Future<bool>? remove(String key) {
    return _preferences?.remove(key);
  }

  // Clear all data in SharedPreferences
  static Future<bool>? clear() {
    return _preferences?.clear();
  }
}
