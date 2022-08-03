enum FirebaseErrorType {
  userNotFound('user-not-found'),
  wrongPassword('wrong-password'),
  emailAlreadyInUse('email-already-in-use');

  final String code;
  const FirebaseErrorType(this.code);
}
