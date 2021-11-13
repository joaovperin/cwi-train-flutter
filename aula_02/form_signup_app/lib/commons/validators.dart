class Validators {
  const Validators._();

  static String? name(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your first name';
    }
    if (input.length < 3) {
      return 'Please enter at least 3 characters';
    }
    return null;
  }

  static String? email(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your email';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(input)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? input) {
    if (input == null || input.isEmpty) {
      return 'Please enter your password';
    }
    if (input.length < 6) {
      return 'Please enter at least 6 characters';
    }
    return null;
  }
}
