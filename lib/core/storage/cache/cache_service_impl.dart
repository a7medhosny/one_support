import 'package:hive_ce_flutter/hive_flutter.dart';

import 'cache_constants.dart';
import 'cache_service.dart';

class CacheServiceImpl implements CacheService {
  final HiveInterface _hive;

  CacheServiceImpl({HiveInterface? hive}) : _hive = hive ?? Hive;

  @override
  Future<void> init() async {
    await Hive.initFlutter();
  }

  Future<Box<dynamic>> _getBox(String boxName) async {
    if (_hive.isBoxOpen(boxName)) {
      return _hive.box(boxName);
    }
    return await _hive.openBox(boxName);
  }

  @override
  Future<void> put<T>({
    required String key,
    required T value,
    String boxName = CacheConstants.defaultBox,
  }) async {
    final box = await _getBox(boxName);
    await box.put(key, value);
  }

  @override
  Future<T?> get<T>({
    required String key,
    String boxName = CacheConstants.defaultBox,
  }) async {
    final box = await _getBox(boxName);
    final value = box.get(key);
    if (value is T) {
      return value;
    }
    return null;
  }

  @override
  Future<void> delete({
    required String key,
    String boxName = CacheConstants.defaultBox,
  }) async {
    final box = await _getBox(boxName);
    await box.delete(key);
  }

  @override
  Future<bool> contains({
    required String key,
    String boxName = CacheConstants.defaultBox,
  }) async {
    final box = await _getBox(boxName);
    return box.containsKey(key);
  }

  @override
  Future<void> clear({
    String boxName = CacheConstants.defaultBox,
  }) async {
    final box = await _getBox(boxName);
    await box.clear();
  }

  @override
  Future<void> close() async {
    await _hive.close();
  }
}

