import 'package:flutter/widgets.dart';

import 'app_regex.dart';
import 'extensions.dart';

class AppValidators {
  const AppValidators._();

  /// Validates a user name using localized error messages.
  static String? validateUserName(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.userNameRequired;
    }
    if (!AppRegex.isUserNameValid(value)) {
      return context.l10n.userNameTooShort;
    }
    return null;
  }

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

  /// Validates a phone number using localized error messages.
  static String? validatePhone(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return context.l10n.phoneRequired;
    }
    if (!AppRegex.isPhoneValid(value)) {
      return context.l10n.invalidPhone;
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

  /// Validates confirm password using localized error messages.
  static String? validateConfirmPassword(
    BuildContext context,
    String? value,
    String password,
  ) {
    if (value == null || value.isEmpty) {
      return context.l10n.confirmPasswordRequired;
    }
    if (value != password) {
      return context.l10n.passwordsDoNotMatch;
    }
    return null;
  }
}
