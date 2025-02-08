import 'package:get/get.dart';

class WebPageController extends GetxController {
  var isChecked = false.obs; // Checkbox state

  void toggleCheckbox(bool value) {
    isChecked.value = value;
  }
}
