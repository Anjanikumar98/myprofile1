import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/D1MM8_Controllers/webpage_controller.dart';

class TermsConditions extends StatelessWidget {
  final WebPageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Obx(() => Checkbox(
            value: controller.isChecked.value,
            onChanged: (value) => controller.toggleCheckbox(value!),
            activeColor: Colors.green,
          )),
          Expanded(
            child: Text(
              "I accept the terms and conditions and acknowledge that I have read and agree to abide by the company's policies and guidelines.",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
