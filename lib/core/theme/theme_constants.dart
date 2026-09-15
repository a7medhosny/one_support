import 'package:flutter/material.dart';

abstract final class ThemeConstants {
  static const ThemeMode defaultThemeMode = ThemeMode.system;

  static const String light = 'light';
  static const String dark = 'dark';
  static const String system = 'system';

  static ThemeMode fromString(String? value) {
    switch (value) {
      case dark:
        return ThemeMode.dark;

      case light:
        return ThemeMode.light;

      case system:
      default:
        return ThemeMode.system;
    }
  }

  static String toStorageValue(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.dark:
        return dark;

      case ThemeMode.light:
        return light;

      case ThemeMode.system:
        return system;
    }
  }
}