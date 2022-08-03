class DiplayHelper {
  static String subString(String mess) {
    return '${mess.substring(0, 30)}...';
  }

  static String getLastLetter(String text) {
    print(text);
    List fullName = text.split(' ');
    print(fullName);
    return fullName[fullName.length - 1];
  }
}
