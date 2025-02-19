import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';
import 'package:myprofile1/Components/global_components/character_input_fields/text_input_field.dart';
import 'package:myprofile1/Components/location_input.dart';
import 'package:myprofile1/Controllers/character_input_field/description_input.dart';
import 'package:myprofile1/Controllers/character_input_field/section_break.dart';
import '../Components/custom_dopdown.dart';
import '../Components/global_components/character_input_fields/label.dart';
import '../Components/global_components/multi_select_dropdown.dart';
import '../Components/global_components/upload_file_multiple.dart';
import '../Components/global_components/upload_file_small_single.dart';
import '../Components/local_components/terms_condtions.dart';
import '../Controllers/Business_Type_Controller/business_type_controller.dart';
import '../Controllers/global_controllers/multi_select_controller.dart';

class WebPageFormController extends GetxController {
  // TextControllers
  late TextEditingController titleController;
  late TextEditingController businessNameController;
  late TextEditingController taglineController;
  late TextEditingController descriptionController;
  late TextEditingController instagramController;
  late TextEditingController facebookController;
  late TextEditingController linkedinController;
  late TextEditingController otherController;
  late TextEditingController locationController;

  // Business Type
  RxString selectedBusinessType = ''.obs;
  RxString selectedKeyFeature = ''.obs;

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

  final List<String> selectedFeatures = [
    'Strength Training',
    'Cardio Training',
    'Personal Training',
    'Group Classes'
  ];

  @override
  void onInit() {
    super.onInit();
    titleController = TextEditingController();
    businessNameController = TextEditingController();
    taglineController = TextEditingController();
    descriptionController = TextEditingController();
    instagramController = TextEditingController();
    facebookController = TextEditingController();
    linkedinController = TextEditingController();
    otherController = TextEditingController();
    locationController = TextEditingController();
  }

  @override
  void onClose() {
    titleController.dispose();
    businessNameController.dispose();
    taglineController.dispose();
    descriptionController.dispose();
    instagramController.dispose();
    facebookController.dispose();
    linkedinController.dispose();
    otherController.dispose();
    locationController.dispose();
    super.onClose();
  }

  // Form validation logic
  void validateForm() {
    isFormValid.value = titleController.text.trim().isNotEmpty &&
        selectedBusinessType.value.isNotEmpty &&
        taglineController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty;
  }
}

class WebPageFormScreen extends StatelessWidget {
  const WebPageFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final WebPageFormController controller = Get.put(WebPageFormController());
    Get.lazyPut<BusinessTypeController>(() => BusinessTypeController());
    final MultiSelectController controller1 = Get.put(MultiSelectController());

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Create Web Page")),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (16 / 360) * deviceWidth,
          vertical: (20 / 800) * deviceHeight,
        ),
        child: SingleChildScrollView(
          child: Obx(() {
            return Center(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: (328 / 360) * deviceWidth,
                ),
                padding: EdgeInsets.only(bottom: (100 / 800) * deviceHeight),
                color:
                    Color(0xFF1E1E1E), // Background color to check visibility
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Business Name Input Field
                      Label(
                          fieldLabel: 'Business Name',
                          optionalTextAvailable: ''),
                      SizedBox(height: (5 / 800) * deviceHeight),
                      TextInputField(
                        enabled: true,
                        textEditingController: controller.titleController,
                        hintText: "Enter Business Name",
                        uniqueTextInputFieldId: "business_name_field",
                      ),
                      SizedBox(height: (20 / 800) * deviceHeight),

                      // Business Type Dropdown
                      Label(
                        fieldLabel: 'Business Type',
                        optionalTextAvailable: '',
                        // width: (328 / 360) * deviceWidth, // Label width dynamically set to 328
                        // height: (18 / 800) * deviceHeight, // Default label height
                      ),
                      SizedBox(
                          height: (5 / 800) * deviceHeight), // Spacing of 5px

                      CustomDropdown(
                        items: controller.businessTypes,
                        hint: 'Select Business Type',
                        onItemSelected: (value) {
                          controller.selectedBusinessType.value = value;
                          controller.validateForm();
                          print('Selected business type: $value');
                        },
                        width: (328 / 360) *
                            deviceWidth, // Dropdown width set to 328
                        height: (45 / 800) *
                            deviceHeight, // Dropdown height set to 45
                        borderRadius: (8 / 360) *
                            deviceWidth, // Border radius 8px (as a double)
                        padding: EdgeInsets.all(
                            (4 / 360) * deviceWidth), // Padding 4px
                        backgroundColor: const Color(
                            0xFF2F5B6C), // Button-Color-Dark-Primary-Blue
                      ),
                      SizedBox(
                          height: (10 / 800) *
                              deviceHeight), // Spacing of 10px below dropdown

                      SizedBox(height: (20 / 800) * deviceHeight),

                      // Location Input Field
                      LocationInputField(
                        title: 'Location',
                        hintText: 'Enter or Pin the Address',
                      ),
                      SizedBox(height: (20 / 800) * deviceHeight),

                      // Label(
                      //     fieldLabel: 'Key Features',
                      //     optionalTextAvailable: ''),
                      SizedBox(height: (5 / 800) * deviceHeight),
                      MultiSelectDropdown(),
                      SizedBox(height: (20 / 800) * deviceHeight),

                      Label(
                        fieldLabel: 'Your Business Logo',
                        optionalTextAvailable: '',
                        // width: (214 / 360) * deviceWidth,  // Default Label width: 214px
                        // height: (18 / 800) * deviceHeight, // Default Label height: 18px
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight), // Gap of 5px
                      UploadFileSmallSingle(),
                      SizedBox(height: (20 / 800) * deviceHeight),

                      // Tagline and Description Inputs
                      Label(
                        fieldLabel: 'Your Business Tagline',
                        optionalTextAvailable: '',
                        // width: (326 / 360) * deviceWidth,  // Label width: 326px
                        // height: (18 / 800) * deviceHeight, // Label height: 18px
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight), // Gap of 5px
                      DescriptionInputField(
                        enabled: true,
                        textEditingController: controller.taglineController,
                        hintText:
                            'Enter a Catchy & Descriptive tagline about Business',
                        uniqueTextInputFieldId: 'tagline_field',
                      ),
                      SizedBox(height: (20 / 800) * deviceHeight),

                      Label(
                          fieldLabel: 'Add Description',
                          optionalTextAvailable: ''),
                      SizedBox(height: (5 / 800) * deviceHeight),
                      DescriptionInputField(
                        enabled: true,
                        textEditingController: controller.descriptionController,
                        hintText:
                            'Enter a Brief Description about Your Business',
                        uniqueTextInputFieldId: 'description_field',
                      ),
                      SizedBox(height: (20 / 800) * deviceHeight),

                      Label(
                        fieldLabel: 'Photo Gallery',
                        optionalTextAvailable: 'At least 4 images',
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight),
                      UploadFileMultiple(),
                      SizedBox(height: (20 / 800) * deviceHeight),

                      Label(
                        fieldLabel: 'Video Tour',
                        optionalTextAvailable: 'Max.Length allowed is 1 min',
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight),
                      UploadFileSmallSingle(),
                      SizedBox(height: (20 / 800) * deviceHeight),

                      // Social Media Links
                      SectionBreak(
                          sectionTitle: 'Social Media Links',
                          sectionDescription:
                              'Provide your social Media Link to help your customer know you more',
                          optional: true),

                      // Instagram Input
                      Label(
                        fieldLabel: 'Instagram',
                        optionalTextAvailable: ' (Optional) ',
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight),
                      Flexible(
                        child: TextInputField(
                          enabled: true,
                          textEditingController: controller.instagramController,
                          hintText: "https://webpage.com",
                          uniqueTextInputFieldId: "instagram_field",
                        ),
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight),

                      // Facebook Input
                      Label(
                        fieldLabel: 'Facebook',
                        optionalTextAvailable: ' (Optional) ',
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight),
                      TextInputField(
                        enabled: true,
                        textEditingController: controller.facebookController,
                        hintText: "https://webpage.com",
                        uniqueTextInputFieldId: "facebook_field",
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight),

                      // Linkedin Input
                      Label(
                        fieldLabel: 'LinkedIn',
                        optionalTextAvailable: ' (Optional) ',
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight),
                      TextInputField(
                        enabled: true,
                        textEditingController: controller.linkedinController,
                        hintText: "https://webpage.com",
                        uniqueTextInputFieldId: "linkedin_field",
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight),

                      // Other Input
                      Label(
                        fieldLabel: 'Others',
                        optionalTextAvailable: ' (Optional) ',
                      ),
                      SizedBox(height: (5 / 800) * deviceHeight),
                      TextInputField(
                        enabled: true,
                        textEditingController: controller.otherController,
                        hintText: "https://webpage.com",
                        uniqueTextInputFieldId: "other_field",
                      ),
                      SizedBox(height: (20 / 800) * deviceHeight),

                      TermsAndConditionsText(),
                      SizedBox(height: (8 / 800) * deviceHeight),

                      // Submit Button
                      PrimaryButton(
                        buttonWidth: (328 / 800) * deviceWidth,
                        buttonHeight: (45 / 800) * deviceHeight,
                        buttonText: 'Save & Next',
                        backgroundColor: Color(0xFFB8FE22),
                        onTap: () {},
                        isEnabled: controller.isFormValid.value,
                        padding: EdgeInsets.symmetric(
                            horizontal: (16 / 360) * deviceWidth,
                            vertical: (8 / 800) * deviceHeight),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}