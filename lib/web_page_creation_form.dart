import 'package:flutter/material.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';
import 'package:myprofile1/Components/global_components/character_input_fields/text_input_field.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/location_input.dart';
import 'package:myprofile1/Controllers/character_input_field/description_input.dart';
import 'package:myprofile1/Controllers/character_input_field/section_break.dart';
import 'Components/custom_dopdown.dart';
import 'Components/global_components/character_input_fields/label.dart';
import 'Controllers/Business_Type_Controller/business_type_controller.dart';

class WebPageFormScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController taglineController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController linkedinController = TextEditingController();
  final TextEditingController otherController = TextEditingController();

  // Sample business types for the dropdown
  final List<String> businessTypes = ['Gym', 'Restaurant', 'Retail Store', 'Service Provider'];
  String? selectedBusinessType;

  @override
  Widget build(BuildContext context) {
    // Ensure the controller is available before using it
    Get.lazyPut<BusinessTypeController>(() => BusinessTypeController());

    return Scaffold(
      appBar: AppBar(title: Text("Create Web Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Business Name Input Field
            Label(fieldLabel: 'Business Name', optionalTextAvailable: false),
            SizedBox(height: 8),
            TextInputField(
              enabled: true,
              textEditingController: titleController,
              hintText: "Enter Business Name",
              uniqueTextInputFieldId: "business_name_field",
            ),
            SizedBox(height: 20),

            // Business Type Dropdown
            Label(fieldLabel: 'Business Type', optionalTextAvailable: false),
            SizedBox(height: 8),
            CustomDropdown(
              items: businessTypes,
              hint: 'Select Business Type',
              selectedItem: selectedBusinessType,
              onItemSelected: (value) {
                selectedBusinessType = value;
              },
              height: 40,
              width: double.infinity,
            ),
            SizedBox(height: 20),

            // Location Input Field
            Label(fieldLabel: 'Location', optionalTextAvailable: false, optionalText: '(or PIN on map)'),
            SizedBox(height: 8),
            LocationInputField(hintText: 'Enter or Pin the Address'),
            SizedBox(height: 20),

            // Tagline and Description Inputs
            Label(fieldLabel: 'Your Business Tagline', optionalTextAvailable: false),
            SizedBox(height: 8),
            DescriptionInputField(
              enabled: true,
              textEditingController: taglineController,
              hintText: 'Enter a Catchy & Descriptive tagline about Business',
              uniqueTextInputFieldId: 'tagline_field',
            ),
            SizedBox(height: 20),

            Label(fieldLabel: 'Add Description', optionalTextAvailable: false),
            SizedBox(height: 8),
            DescriptionInputField(
              enabled: true,
              textEditingController: descriptionController,
              hintText: 'Enter a Brief Description about Your Business',
              uniqueTextInputFieldId: 'description_field',
            ),
            SizedBox(height: 20),

            // Social Media Links
            SectionBreak(
                sectionTitle: 'Social Media Links',
                sectionDescription: 'Provide your social Media Link to help your customer know you more',
                optional: true),

            // Instagram Input
            Label(fieldLabel: 'Instagram', optionalTextAvailable: true, optionalText: '(Optional)'),
            SizedBox(height: 8),
            TextInputField(
              enabled: true,
              textEditingController: instagramController,
              hintText: "Instagram URL",
              uniqueTextInputFieldId: "instagram_field",
            ),
            SizedBox(height: 8),

            // Facebook Input
            Label(fieldLabel: 'Facebook', optionalTextAvailable: true, optionalText: '(Optional)'),
            SizedBox(height: 8),
            TextInputField(
              enabled: true,
              textEditingController: facebookController,
              hintText: "Facebook URL",
              uniqueTextInputFieldId: "facebook_field",
            ),
            SizedBox(height: 8),

            // Linkedin Input
            Label(fieldLabel: 'LinkedIn', optionalTextAvailable: true, optionalText: '(Optional)'),
            SizedBox(height: 8),
            TextInputField(
              enabled: true,
              textEditingController: linkedinController,
              hintText: "LinkedIn URL",
              uniqueTextInputFieldId: "linkedin_field",
            ),
            SizedBox(height: 8),

            // Other Input
            Label(fieldLabel: 'Others', optionalTextAvailable: true, optionalText: '(Optional)'),
            SizedBox(height: 8),
            TextInputField(
              enabled: true,
              textEditingController: otherController,
              hintText: "Other Social Media URL",
              uniqueTextInputFieldId: "other_field",
            ),
            SizedBox(height: 20),

            // Submit Button
            PrimaryButton(
              buttonWidth: null,
              buttonHeight: 40,
              buttonText: 'Save & Next',
              onTap: () {
                // Handle the form submission
              },
              isEnabled: true,
            ),
          ],
        ),
      ),
    );
  }
}


