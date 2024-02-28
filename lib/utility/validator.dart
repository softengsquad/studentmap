class Validator {
  /// Validates a string input using a regular expression.
  /// - The string can only be made up of **Letters** 
  /// - **Cannot** contain numbers or symbols
  static bool validateStringInput(String? input) {
    RegExp illegalChars = RegExp(r"[^a-zA-Z ]");

    // Contains illegal characters OR is null
    if (input == null || illegalChars.hasMatch(input)) {
      return false;
    }
    return true;
  }
}
