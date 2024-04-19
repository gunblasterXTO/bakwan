import 'package:bakwan/modules/journal/controllers/new_activity_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewActivityController extends GetxController {
  NewActivityState state = NewActivityState();
  final GlobalKey<FormState> newActivityKey = GlobalKey<FormState>();
  late TextEditingController categoryController,
      subCategoryController,
      timeController,
      descriptionController;

  @override
  void onInit() {
    super.onInit();
    categoryController = TextEditingController();
    subCategoryController = TextEditingController();
    timeController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void onClose() {
    categoryController.dispose();
    subCategoryController.dispose();
    timeController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  String? validateDescription(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return "Fill in description";
    }
    return null;
  }

  Map<String, int> _splitTime(String value) {
    List<String> splittedValue = value.split(":");
    return {
      "hour": int.parse(splittedValue[0]),
      "minute": int.parse(splittedValue[1]),
    };
  }

  String? validateStartEndTime(String startValue, String endValue) {
    Map<String, int> startValueSplitted = _splitTime(startValue);
    Map<String, int> endValueSplitted = _splitTime(endValue);

    // get dummy current date for comparison purpose
    DateTime now = DateTime.now();

    DateTime startDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      startValueSplitted["hour"]!,
      startValueSplitted["minute"]!,
    );
    DateTime endDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      endValueSplitted["hour"]!,
      endValueSplitted["minute"]!,
    );

    int comparison = startDateTime.compareTo(endDateTime);

    if (comparison > 0) {
      return "Start time has to be earlier than end time";
    }

    return null;
  }

  String timeOfDaytoString(TimeOfDay value) {
    final period = value.period == DayPeriod.am ? "AM" : "PM";
    final hour = value.hourOfPeriod;
    final minute = value.minute;

    return "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} $period";
  }
}
