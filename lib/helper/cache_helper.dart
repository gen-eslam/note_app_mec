import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> putData({required String key, dynamic value}) async {
    if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else {
      await _sharedPreferences.setStringList(key, value);
    }
  }

  static String? getDataString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  static bool? getDataBool({required String key}) {
    return _sharedPreferences.getBool(key);
  }

  static int? getDataInt({required String key}) {
    return _sharedPreferences.getInt(key);
  }

  static double? getDataDouble({required String key}) {
    return _sharedPreferences.getDouble(key);
  }

  static List<String>? getDataList({required String key}) {
    return _sharedPreferences.getStringList(key);
  }

  static Future<void> remove({required String key}) async {
    await _sharedPreferences.remove(key);
  }

  static Future<void> clear() async {
    await _sharedPreferences.clear();
  }
}
