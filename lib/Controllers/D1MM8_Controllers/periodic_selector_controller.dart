import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeriodController extends GetxController {
  var selectedPeriod = 'Monthly'.obs;

  void changePeriod(String period) {
    selectedPeriod.value = period;
  }
}

// final controller = Get.find<PeriodController>();
// controller.changePeriod('Quarterly');