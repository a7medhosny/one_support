class AppRegex {
  const AppRegex._();

  static final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&]{6,}$',
  );

  static bool isEmailValid(String email) {
    return emailRegExp.hasMatch(email.trim());
  }

  static bool isPasswordValid(String password) {
    return password.length >= 6;
  }
}
