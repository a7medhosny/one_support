import 'package:flutter/material.dart';

class LocalizationConstants {
  const LocalizationConstants._();

  static const String englishLanguageCode = 'en';
  static const String arabicLanguageCode = 'ar';

  static const Locale englishLocale = Locale(englishLanguageCode);
  static const Locale arabicLocale = Locale(arabicLanguageCode);

  static const Locale defaultLocale = englishLocale;

  static const List<Locale> supportedLocales = [
    englishLocale,
    arabicLocale,
  ];

  static bool isSupported(String languageCode) {
    return languageCode == englishLanguageCode || languageCode == arabicLanguageCode;
  }
}

