import 'package:bakwan/common/utils/parser.dart';
import 'package:bakwan/common/utils/validator.dart';
import 'package:bakwan/modules/journal/controllers/activity_state.dart';
import 'package:bakwan/modules/journal/models/activity.dart';
import 'package:bakwan/modules/journal/models/category.dart';
import 'package:bakwan/modules/journal/models/sub_category.dart';
import 'package:bakwan/modules/journal/repository/local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class ActivityController extends GetxController {
  final GlobalKey<FormState> newActivityKey = GlobalKey<FormState>();
  final int? id;
  final Database db;
  late final CategoryDao _categoryDao;
  late final SubCategoryDao _subCategoryDao;
  late final ActivityDao _activityDao;
  late final ActivityState state;
  late TextEditingController titleController;

  ActivityController({
    required this.id,
    required this.db,
  }) {
    _categoryDao = CategoryDao(db: db);
    _subCategoryDao = SubCategoryDao(db: db);
    _activityDao = ActivityDao(db: db);
    if (id == null) {
      state = ActivityState.empty();
    }
    // TODO: add else if id is passed
  }

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
  }

  @override
  void onClose() {
    titleController.dispose();
    super.onClose();
  }

  void saveActivity({
    required String title,
    required String startTime,
    required String endTime,
    String? description,
    int? categoryId,
    int? subCategoryId,
  }) {
    UpsertActivityModel activityModel = UpsertActivityModel(
      id: id,
      title: title,
      startTime: startTime,
      endTime: endTime,
      description: description,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    );
    _activityDao.upsertRecord(activityModel);
  }

  String? validateTitle(String value) {
    if (Validator.isEmptyString(value)) {
      return "Fill in title";
    }
    return null;
  }

  String? validateStartEndTime(String startValue, String endValue) {
    Map<String, int> startValueSplitted = Parser.timeToDict(startValue);
    Map<String, int> endValueSplitted = Parser.timeToDict(endValue);

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

  String formatDisplayTime(TimeOfDay value) {
    return Parser.timeOfDaytoString(value);
  }

  Future<List<CategoryModel>> getAllCategories() {
    return _categoryDao.getAll();
  }

  Future<List<SubCategoryModel>> getAllSubCategories(int id) {
    return _subCategoryDao.getAllFromCat(id);
  }
}
