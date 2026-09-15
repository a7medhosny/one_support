import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'secure_storage_service.dart';

class SecureStorageServiceImpl implements SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageServiceImpl({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(),
              iOptions: IOSOptions(
                accessibility: KeychainAccessibility.first_unlock,
              ),
            );

  @override
  Future<void> save({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> get({required String key}) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> remove({required String key}) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await _storage.deleteAll();
  }

  @override
  Future<bool> containsKey({required String key}) async {
    return await _storage.containsKey(key: key);
  }
}

