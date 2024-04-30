import 'package:get/get.dart';

class ActivityState {
  RxString title;
  RxString startTime;
  RxString endTime;
  RxInt categoryId;
  RxInt subCategoryId;
  RxString description;

  ActivityState({
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.categoryId,
    required this.subCategoryId,
    required this.description,
  }) {
    title = title;
    categoryId = categoryId;
    subCategoryId = subCategoryId;
    startTime = startTime;
    endTime = endTime;
    description = description;
  }

  // Constructor for initial state with empty strings
  factory ActivityState.empty() => ActivityState(
        title: "".obs,
        startTime: "".obs,
        endTime: "".obs,
        categoryId: 0.obs,
        subCategoryId: 0.obs,
        description: "".obs,
      );
}
