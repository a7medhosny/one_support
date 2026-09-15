import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../storage/preferences/preferences_constants.dart';
import '../../storage/preferences/preferences_service.dart';
import '../localization_constants.dart';
import 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  final PreferencesService _preferencesService;

  LocalizationCubit({required PreferencesService preferencesService})
    : _preferencesService = preferencesService,
      super(
        const LocalizationState(locale: LocalizationConstants.defaultLocale),
      ) {
    loadSavedLanguage();
  }

  /// Loads the saved language from PreferencesService on startup.
  void loadSavedLanguage() {
    final savedCode = _preferencesService.getString(
      PreferencesConstants.language,
    );
    if (savedCode != null && LocalizationConstants.isSupported(savedCode)) {
      emit(LocalizationState(locale: Locale(savedCode)));
    } else {
      emit(
        const LocalizationState(locale: LocalizationConstants.defaultLocale),
      );
    }
  }

  /// Changes the active language and persists the choice.
  Future<void> changeLanguage(String languageCode) async {
    if (!LocalizationConstants.isSupported(languageCode)) return;
    if (state.locale.languageCode == languageCode) return;

    await _preferencesService.saveString(
      PreferencesConstants.language,
      languageCode,
    );
    emit(LocalizationState(locale: Locale(languageCode)));
  }

  /// Toggles between English and Arabic.
  Future<void> toggleLanguage() async {
    final nextCode =
        state.locale.languageCode == LocalizationConstants.englishLanguageCode
        ? LocalizationConstants.arabicLanguageCode
        : LocalizationConstants.englishLanguageCode;
    await changeLanguage(nextCode);
  }
}
