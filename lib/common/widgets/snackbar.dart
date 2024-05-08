import 'package:bakwan/common/style/ui.dart';
import 'package:get/get.dart';

SnackbarController errorSnackBar(String title, String message) {
  return Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: UIConst.errorWidgetBackground,
    colorText: UIConst.errorWidgetText,
    duration: const Duration(milliseconds: 1500),
  );
}
