import 'package:shared_preferences/shared_preferences.dart';

import 'preferences_service.dart';

class PreferencesServiceImpl implements PreferencesService {
  final SharedPreferences _preferences;

  PreferencesServiceImpl({required SharedPreferences preferences})
      : _preferences = preferences;

  @override
  Future<bool> saveString(String key, String value) =>
      _preferences.setString(key, value);

  @override
  Future<bool> saveBool(String key, bool value) =>
      _preferences.setBool(key, value);

  @override
  Future<bool> saveInt(String key, int value) =>
      _preferences.setInt(key, value);

  @override
  Future<bool> saveDouble(String key, double value) =>
      _preferences.setDouble(key, value);

  @override
  Future<bool> saveStringList(String key, List<String> value) =>
      _preferences.setStringList(key, value);

  @override
  String? getString(String key) => _preferences.getString(key);

  @override
  bool? getBool(String key) => _preferences.getBool(key);

  @override
  int? getInt(String key) => _preferences.getInt(key);

  @override
  double? getDouble(String key) => _preferences.getDouble(key);

  @override
  List<String>? getStringList(String key) => _preferences.getStringList(key);

  @override
  Future<bool> remove(String key) => _preferences.remove(key);

  @override
  Future<bool> clear() => _preferences.clear();

  @override
  bool containsKey(String key) => _preferences.containsKey(key);
}

