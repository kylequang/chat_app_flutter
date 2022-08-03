class Regex {
  static bool isEmail(String email) {
    RegExp regExp = RegExp(r'\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*');
    return regExp.hasMatch(email);
  }

  static bool validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return regex.hasMatch(value);
  }

  static bool isPhoneNumber(String phonenumber) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10}$)';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(phonenumber);
  }
}
