class TextfieldValidators {
  static String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return "Empty Field";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      return "Enter valid Email";
    }
    return null;
  }

  static String? passwordValidator(String? pass) {
    if (pass == null || pass.isEmpty) {
      return "Empty Field";
    }
    return null;
  }
}
