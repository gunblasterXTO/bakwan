import 'package:flutter/material.dart';

class Parser {
  Parser._();

  static Map<String, int> timeToDict(String value) {
    List<String> splittedValue = value.split(":");
    return {
      "hour": int.parse(splittedValue[0]),
      "minute": int.parse(splittedValue[1]),
    };
  }

  static String timeOfDaytoString(TimeOfDay value) {
    final period = value.period == DayPeriod.am ? "AM" : "PM";
    final hour = value.hourOfPeriod;
    final minute = value.minute;

    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period";
  }
}
