import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../character_input_field/location_controller.dart';

class LocationInputController extends GetxController {
  final TextEditingController textEditingController = TextEditingController();
  final LocationController locationController = Get.put(LocationController());

  Future<String> pickLocation(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return "Selected Location Lat:(${locationController.currentPosition.value!.latitude.toString()},Long: ${locationController.currentPosition.value!.longitude.toString()})";
  }
}
