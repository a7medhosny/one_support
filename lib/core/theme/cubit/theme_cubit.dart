import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../storage/preferences/preferences_constants.dart';
import '../../storage/preferences/preferences_service.dart';
import '../theme_constants.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final PreferencesService _preferencesService;

  ThemeCubit({
    required PreferencesService preferencesService,
  }) : _preferencesService = preferencesService,
       super(
         const ThemeState(
           themeMode: ThemeConstants.defaultThemeMode,
         ),
       ) {
    loadSavedTheme();
  }

  /// Loads the saved theme mode from PreferencesService on startup.
  void loadSavedTheme() {
    final savedTheme = _preferencesService.getString(
      PreferencesConstants.themeMode,
    );

    final themeMode = ThemeConstants.fromString(savedTheme);

    emit(
      ThemeState(
        themeMode: themeMode,
      ),
    );
  }

  /// Changes the active theme and persists the choice.
  Future<void> changeTheme(ThemeMode themeMode) async {
    if (state.themeMode == themeMode) return;

    await _preferencesService.saveString(
      PreferencesConstants.themeMode,
      ThemeConstants.toStorageValue(themeMode),
    );

    emit(
      ThemeState(
        themeMode: themeMode,
      ),
    );
  }

  /// Toggles between Light and Dark themes.
  Future<void> toggleTheme() async {
    final nextTheme =
        state.themeMode == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;

    await changeTheme(nextTheme);
  }
}