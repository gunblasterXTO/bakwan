class Validator {
  Validator._();

  static bool isEmptyString(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return true;
    }
    return false;
  }
}
