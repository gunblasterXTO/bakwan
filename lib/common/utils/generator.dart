class Generator {
  Generator._();

  static String todayDate() {
    DateTime today = DateTime.now().toLocal();

    DateTime dateOnly = DateTime(today.year, today.month, today.day);
    return dateOnly.toString();
  }
}
