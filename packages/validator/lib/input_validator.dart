/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-24 10:35:03 
 * @Last Modified by:   vinhtruongtrong 
 * @Last Modified time: 2021-11-24 10:35:03 
 */
class InputValidator {
  static bool isNotNullOrEmpty(String? input) {
    return input != null && input.trim().isNotEmpty;
  }

  static bool isValidEmail(String input) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(input);
  }

  static bool isValidPassword(String input) {
    const numberCharacter = 6;
    return input.length >= numberCharacter;
  }
}
