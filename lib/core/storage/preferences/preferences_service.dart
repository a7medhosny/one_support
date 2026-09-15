abstract interface class PreferencesService {
  /// Saves a string value.
  Future<bool> saveString(String key, String value);

  /// Saves a boolean value.
  Future<bool> saveBool(String key, bool value);

  /// Saves an integer value.
  Future<bool> saveInt(String key, int value);

  /// Saves a double value.
  Future<bool> saveDouble(String key, double value);

  /// Saves a list of strings.
  Future<bool> saveStringList(String key, List<String> value);

  /// Retrieves a string value by key.
  String? getString(String key);

  /// Retrieves a boolean value by key.
  bool? getBool(String key);

  /// Retrieves an integer value by key.
  int? getInt(String key);

  /// Retrieves a double value by key.
  double? getDouble(String key);

  /// Retrieves a list of strings by key.
  List<String>? getStringList(String key);

  /// Removes a preference by key.
  Future<bool> remove(String key);

  /// Clears all preferences.
  Future<bool> clear();

  /// Checks if a key exists in preferences.
  bool containsKey(String key);
}

