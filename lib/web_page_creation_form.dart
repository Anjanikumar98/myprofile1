import 'package:flutter/material.dart';
import 'package:myprofile1/Components/global_components/text_input_field.dart'; // Your existing input field component
import 'package:get/get.dart';
import 'Components/global_components/Business_Type_Controller/business_type_component.dart';
import 'Controllers/business_type_controller.dart';

class WebPageFormScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is available before using it
    Get.lazyPut<BusinessTypeController>(() => BusinessTypeController());

    return Scaffold(
      appBar: AppBar(title: Text("Create Web Page")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Input Field
            Text("Business Name", style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 8),
            TextInputField(
              enabled: true,
              textEditingController: titleController,
              hintText: "Label Only",
              uniqueTextInputFieldId: "business_name_input",
            ),
            SizedBox(height: 20),

            // Business Type Dropdown (Uneditable)
            Text("Business Type", style: TextStyle(color: Colors.white, fontSize: 16)),
            SizedBox(height: 8),
            CustomDropdown(), // Remove onChanged parameter
          ],
        ),
      ),
    );
  }
}