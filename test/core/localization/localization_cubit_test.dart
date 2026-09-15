import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_support/core/localization/localization_exports.dart';
import 'package:one_support/core/storage/preferences/preferences_constants.dart';
import 'package:one_support/core/storage/preferences/preferences_service.dart';

class FakePreferencesService implements PreferencesService {
  final Map<String, dynamic> _storage = {};

  @override
  Future<bool> saveString(String key, String value) async {
    _storage[key] = value;
    return true;
  }

  @override
  String? getString(String key) => _storage[key] as String?;

  @override
  Future<bool> saveBool(String key, bool value) async {
    _storage[key] = value;
    return true;
  }

  @override
  bool? getBool(String key) => _storage[key] as bool?;

  @override
  Future<bool> saveInt(String key, int value) async {
    _storage[key] = value;
    return true;
  }

  @override
  int? getInt(String key) => _storage[key] as int?;

  @override
  Future<bool> saveDouble(String key, double value) async {
    _storage[key] = value;
    return true;
  }

  @override
  double? getDouble(String key) => _storage[key] as double?;

  @override
  Future<bool> saveStringList(String key, List<String> value) async {
    _storage[key] = value;
    return true;
  }

  @override
  List<String>? getStringList(String key) => _storage[key] as List<String>?;

  @override
  Future<bool> remove(String key) async {
    _storage.remove(key);
    return true;
  }

  @override
  Future<bool> clear() async {
    _storage.clear();
    return true;
  }

  @override
  bool containsKey(String key) => _storage.containsKey(key);
}

void main() {
  late FakePreferencesService preferencesService;
  late LocalizationCubit localizationCubit;

  setUp(() {
    preferencesService = FakePreferencesService();
  });

  tearDown(() {
    localizationCubit.close();
  });

  test('initial state defaults to English when no language is saved', () {
    localizationCubit = LocalizationCubit(preferencesService: preferencesService);
    expect(localizationCubit.state.locale, const Locale('en'));
  });

  test('initial state loads saved Arabic language when saved in preferences', () {
    preferencesService.saveString(PreferencesConstants.language, 'ar');
    localizationCubit = LocalizationCubit(preferencesService: preferencesService);
    expect(localizationCubit.state.locale, const Locale('ar'));
  });

  test('changeLanguage updates state and persists language code', () async {
    localizationCubit = LocalizationCubit(preferencesService: preferencesService);
    expect(localizationCubit.state.locale, const Locale('en'));

    await localizationCubit.changeLanguage('ar');

    expect(localizationCubit.state.locale, const Locale('ar'));
    expect(preferencesService.getString(PreferencesConstants.language), 'ar');
  });

  test('changeLanguage ignores unsupported language codes', () async {
    localizationCubit = LocalizationCubit(preferencesService: preferencesService);

    await localizationCubit.changeLanguage('fr');

    expect(localizationCubit.state.locale, const Locale('en'));
    expect(preferencesService.getString(PreferencesConstants.language), isNull);
  });

  test('toggleLanguage alternates between English and Arabic', () async {
    localizationCubit = LocalizationCubit(preferencesService: preferencesService);
    expect(localizationCubit.state.locale, const Locale('en'));

    await localizationCubit.toggleLanguage();
    expect(localizationCubit.state.locale, const Locale('ar'));
    expect(preferencesService.getString(PreferencesConstants.language), 'ar');

    await localizationCubit.toggleLanguage();
    expect(localizationCubit.state.locale, const Locale('en'));
    expect(preferencesService.getString(PreferencesConstants.language), 'en');
  });
}

