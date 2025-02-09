import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:myprofile1/Controllers/global_controllers/description_input.dart';

class ContactUsController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final DescriptionInputFieldController descriptionController = DescriptionInputFieldController();

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
