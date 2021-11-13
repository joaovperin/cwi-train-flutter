class Validators {
  const Validators._();

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
}
