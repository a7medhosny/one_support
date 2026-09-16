import 'package:flutter/material.dart';

import '../localization/l10n/app_localizations.dart';

extension BuildContextExtension on BuildContext {
  /// Convenient accessor for AppLocalizations.
  AppLocalizations get l10n => AppLocalizations.of(this);

  /// Access to Theme.
  ThemeData get theme => Theme.of(this);

  /// Access to ColorScheme.
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Access to TextTheme.
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Check if the current theme brightness is dark.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  /// Screen size queries.
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
}
