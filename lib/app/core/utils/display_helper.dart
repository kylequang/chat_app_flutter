class DisplayHelper {
  static String subString(String mess) {
    return '${mess.substring(0, 25)}...';
  }

  static String getLastLetter(String text) {
    List fullName = text.split(' ');
    return fullName[fullName.length - 1];
  }
}
