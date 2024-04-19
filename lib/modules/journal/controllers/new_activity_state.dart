import 'package:get/get.dart';

class NewActivityState {
  RxString category;
  RxString subCategory;
  RxString startTime;
  RxString endTime;
  RxString description;

  NewActivityState({
    String category = "",
    String subCategory = "",
    String startTime = "",
    String endTime = "",
    String description = "",
  })  : category = category.obs,
        subCategory = subCategory.obs,
        startTime = startTime.obs,
        endTime = endTime.obs,
        description = description.obs;
}
