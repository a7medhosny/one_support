import 'cache_constants.dart';

abstract interface class CacheService {
  /// Initializes the underlying cache engine.
  Future<void> init();

  /// Saves a generic value with the given key into the specified box.
  Future<void> put<T>({
    required String key,
    required T value,
    String boxName = CacheConstants.defaultBox,
  });

  /// Retrieves a generic value by key from the specified box.
  Future<T?> get<T>({
    required String key,
    String boxName = CacheConstants.defaultBox,
  });

  /// Deletes a cached entry by key from the specified box.
  Future<void> delete({
    required String key,
    String boxName = CacheConstants.defaultBox,
  });

  /// Checks whether a key exists in the specified box.
  Future<bool> contains({
    required String key,
    String boxName = CacheConstants.defaultBox,
  });

  /// Clears all entries in the specified box.
  Future<void> clear({
    String boxName = CacheConstants.defaultBox,
  });

  /// Closes all open cache boxes.
  Future<void> close();
}

