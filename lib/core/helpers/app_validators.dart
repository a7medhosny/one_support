import 'package:flutter/widgets.dart';

import 'app_regex.dart';
import 'extensions.dart';

class AppValidators {
  const AppValidators._();

  /// Validates an email address using localized error messages.
  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.emailRequired;
    }
    if (!AppRegex.isEmailValid(value)) {
      return context.l10n.invalidEmail;
    }
    return null;
  }

  /// Validates a password using localized error messages.
  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return context.l10n.passwordRequired;
    }
    if (!AppRegex.isPasswordValid(value)) {
      return context.l10n.passwordTooShort;
    }
    return null;
  }
}
