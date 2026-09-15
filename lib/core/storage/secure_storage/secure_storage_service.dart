abstract interface class SecureStorageService {
  /// Saves a key-value pair securely.
  Future<void> save({required String key, required String value});

  /// Retrieves a value by key. Returns null if key does not exist.
  Future<String?> get({required String key});

  /// Removes a key-value pair.
  Future<void> remove({required String key});

  /// Clears all stored key-value pairs.
  Future<void> clear();

  /// Checks if a key exists in secure storage.
  Future<bool> containsKey({required String key});
}

