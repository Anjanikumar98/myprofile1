import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';
import 'package:myprofile1/Components/global_components/character_input_fields/text_input_field.dart';
import 'package:myprofile1/Components/location_input.dart';
import 'package:myprofile1/Controllers/character_input_field/description_input.dart';
import 'package:myprofile1/Controllers/character_input_field/section_break.dart';
import 'Components/custom_dopdown.dart';
import 'Components/global_components/character_input_fields/label.dart';
import 'Components/global_components/upload_file_multiple.dart';
import 'Components/global_components/upload_file_small_single.dart';
import 'Components/local_components/terms_condtions.dart';
import 'Controllers/Business_Type_Controller/business_type_controller.dart';

class WebPageFormController extends GetxController {
  // TextControllers
  var titleController = TextEditingController();
  var businessNameController = TextEditingController();
  var taglineController = TextEditingController();
  var descriptionController = TextEditingController();
  var instagramController = TextEditingController();
  var facebookController = TextEditingController();
  var linkedinController = TextEditingController();
  var otherController = TextEditingController();

  // Business Type
  RxString selectedBusinessType =
      ''.obs; // Removed nullable type and initialized with an empty string.

  RxString selectedKeyFeature =
      ''.obs;

  // Validation state
  var isFormValid = false.obs;

  // List of business types
  final List<String> businessTypes = [
    'Gym/Fitness Centre',
    'Yoga Studio',
    'Wellness Center',
    'Mixed Martial Arts (MMA) & Boxing Gym',
    'Sports Academy Or Training Institute',
    'Dance/Fitness Class Studio',
    'Physiotherapy Clinic'
  ];

  final List<String> keyFeatures = [
    'Strength Training',
    'Cardio Training',
    'Personal Training',
    'Group Classes'
  ];



  @override
  void onInit() {
    super.onInit();
  }

  // Form validation logic
  void validateForm() {
    isFormValid.value = titleController.text.isNotEmpty &&
        selectedBusinessType.value.isNotEmpty &&
        taglineController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;
  }
}

class WebPageFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WebPageFormController controller = Get.put(WebPageFormController());
    Get.lazyPut<BusinessTypeController>(() => BusinessTypeController());

    return Scaffold(
      appBar: AppBar(title: Text("Create Web Page")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Business Name Input Field
                Label(
                    fieldLabel: 'Business Name', optionalTextAvailable: false),
                SizedBox(height: 8),
                TextInputField(
                  enabled: true,
                  textEditingController: controller.titleController,
                  hintText: "Enter Business Name",
                  uniqueTextInputFieldId: "business_name_field",
                ),
                SizedBox(height: 20),

                // Business Type Dropdown
                Label(
                    fieldLabel: 'Business Type', optionalTextAvailable: false),
                SizedBox(height: 8),
                CustomDropdown(
                  items: controller.businessTypes,
                  hint: 'Select Business Type',
                  onItemSelected: (value) {
                    controller.selectedBusinessType.value = value;
                    controller.validateForm();
                    print('Selected business type: $value');
                  },
                  height: 40,
                  width: double.infinity,
                ),
                SizedBox(height: 20),

                // Location Input Field
                Label(
                    fieldLabel: 'Location',
                    optionalTextAvailable: false,
                    optionalText: '(or PIN on map)'),
                SizedBox(height: 8),
                LocationInputField(hintText: 'Enter or Pin the Address'),
                SizedBox(height: 20),

                Label(
                    fieldLabel: 'Key Features', optionalTextAvailable: false),
                SizedBox(height: 8),
                CustomDropdown(
                  items: controller.keyFeatures,
                  hint: 'Select Add-ons',
                  onItemSelected: (value) {
                    controller.selectedKeyFeature.value = value;
                    controller.validateForm();
                    print('Selected Key Features: $value');
                  },
                  height: 40,
                  width: double.infinity,
                ),
                SizedBox(height: 20),

                Label(
                    fieldLabel: 'Your Business Logo',
                    optionalTextAvailable: true,
                    optionalText: ''),
                SizedBox(height: 8),
                UploadFileSmallSingle(),
                SizedBox(height: 20),


                // Tagline and Description Inputs
                Label(
                    fieldLabel: 'Your Business Tagline',
                    optionalTextAvailable: false),
                SizedBox(height: 8),
                DescriptionInputField(
                  enabled: true,
                  textEditingController: controller.taglineController,
                  hintText:
                      'Enter a Catchy & Descriptive tagline about Business',
                  uniqueTextInputFieldId: 'tagline_field',
                ),
                SizedBox(height: 20),

                Label(
                    fieldLabel: 'Add Description',
                    optionalTextAvailable: false),
                SizedBox(height: 8),
                DescriptionInputField(
                  enabled: true,
                  textEditingController: controller.descriptionController,
                  hintText: 'Enter a Brief Description about Your Business',
                  uniqueTextInputFieldId: 'description_field',
                ),
                SizedBox(height: 20),

                Label(
                    fieldLabel: 'Photo Gallery',
                    optionalTextAvailable: true,
                    optionalText: 'At least 4 images'),
                SizedBox(height: 8),
                UploadFileMultiple(),
                SizedBox(height: 20),

                Label(
                    fieldLabel: 'Video Tour',
                    optionalTextAvailable: true,
                    optionalText: 'Max.Length allowed is 1 min'),
                SizedBox(height: 8),
                UploadFileSmallSingle(),
                SizedBox(height: 20),

                // Social Media Links
                SectionBreak(
                    sectionTitle: 'Social Media Links',
                    sectionDescription:
                        'Provide your social Media Link to help your customer know you more',
                    optional: true),

                // Instagram Input
                Label(
                    fieldLabel: 'Instagram',
                    optionalTextAvailable: true,
                    optionalText: 'Optional'),
                SizedBox(height: 8),
                TextInputField(
                  enabled: true,
                  textEditingController: controller.instagramController,
                  hintText: "https://webpage.com",
                  uniqueTextInputFieldId: "instagram_field",
                ),
                SizedBox(height: 8),

                // Facebook Input
                Label(
                    fieldLabel: 'Facebook',
                    optionalTextAvailable: true,
                    optionalText: 'Optional'),
                SizedBox(height: 8),
                TextInputField(
                  enabled: true,
                  textEditingController: controller.facebookController,
                  hintText: "https://webpage.com",
                  uniqueTextInputFieldId: "facebook_field",
                ),
                SizedBox(height: 8),

                // Linkedin Input
                Label(
                    fieldLabel: 'LinkedIn',
                    optionalTextAvailable: true,
                    optionalText: 'Optional'),
                SizedBox(height: 8),
                TextInputField(
                  enabled: true,
                  textEditingController: controller.linkedinController,
                  hintText: "https://webpage.com",
                  uniqueTextInputFieldId: "linkedin_field",
                ),
                SizedBox(height: 8),

                // Other Input
                Label(
                    fieldLabel: 'Others',
                    optionalTextAvailable: true,
                    optionalText: 'Optional'),
                SizedBox(height: 8),
                TextInputField(
                  enabled: true,
                  textEditingController: controller.otherController,
                  hintText: "https://webpage.com",
                  uniqueTextInputFieldId: "other_field",
                ),
                SizedBox(height: 20),

                TermsAndConditionsText(),
                SizedBox(height: 8),

                // Submit Button
                PrimaryButton(
                  buttonWidth: null,
                  buttonHeight: 40,
                  buttonText: 'Save & Next',
                  onTap: () {
                    // Check if form is valid
                    if (controller.isFormValid.value) {
                      // Handle form submission
                      print('Form Submitted!');
                    } else {
                      // Show validation error if form is invalid
                      Get.snackbar('Validation Error',
                          'Please fill out all required fields.',
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                  isEnabled: controller.isFormValid.value,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
