import 'package:flutter/material.dart';

import 'colors/app_color_schemes.dart';


abstract class AppTheme {
  AppTheme._();

  /// Light theme.
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
      );

  /// Dark theme.
  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
      );
}
