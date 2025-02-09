import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsAndConditionsController extends GetxController {
  var isChecked = false.obs; // Observable boolean
}

class TermsAndConditions extends StatelessWidget {
  final TermsAndConditionsController controller = Get.put(TermsAndConditionsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Checkbox(
            value: controller.isChecked.value,
            onChanged: (bool? value) {
              controller.isChecked.value = value!;
            },
          )),
          Expanded(
            child: Text(
              "I accept the terms and conditions and acknowledge that I have read and agree to abide by the company’s policies and guidelines.",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
