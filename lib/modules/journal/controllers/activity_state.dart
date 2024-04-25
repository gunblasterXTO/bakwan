import 'package:get/get.dart';

class ActivityState {
  RxString title = ''.obs;
  RxString category = ''.obs;
  RxString subCategory = ''.obs;
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  RxString description = ''.obs;

  // Constructor for initial state with empty strings
  ActivityState.empty() {
    title = ''.obs;
    category = ''.obs;
    subCategory = ''.obs;
    startTime = ''.obs;
    endTime = ''.obs;
    description = ''.obs;
  }

  // Constructor with values passed as arguments
  ActivityState({
    required String title,
    required String category,
    required String subCategory,
    required String startTime,
    required String endTime,
    required String description,
  }) {
    this.title = title.obs;
    this.category = category.obs;
    this.subCategory = subCategory.obs;
    this.startTime = startTime.obs;
    this.endTime = endTime.obs;
    this.description = description.obs;
  }
}
