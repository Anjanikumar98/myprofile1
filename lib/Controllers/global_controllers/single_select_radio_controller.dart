import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MembershipTypeRadioController extends GetxController {
  RxInt currentIndex = (-1).obs; // Use -1 to indicate no selection
  RxString selected = "".obs;

  void updateIndex(int index, String selectedValue) {
    currentIndex.value = index;
    selected.value = selectedValue;

    debugPrint('************************************');
    debugPrint('Selected Index: ${currentIndex.value}');
    debugPrint('Selected Value: ${selected.value}'); // To be passed in API
  }
}
