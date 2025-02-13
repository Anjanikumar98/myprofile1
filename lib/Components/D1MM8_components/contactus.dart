import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';
import 'package:myprofile1/Components/global_components/character_input_fields/description_input.dart';
import 'package:myprofile1/Components/global_components/character_input_fields/label.dart';
import '../../Controllers/D1MM8_Controllers/contact_us_controller.dart';
import '../global_components/character_input_fields/text_input_field.dart';

class ContactUsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContactUsController controller = Get.put(ContactUsController());

    return Scaffold(
      // ✅ FIX: Wrap in Scaffold to avoid Material Widget Error
      backgroundColor: Colors.black, // ✅ Matches UI background
      body: SingleChildScrollView(
        // ✅ FIX: Prevent overflow by making it scrollable
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Section
              SizedBox(
                width: 372,
                height: 48.38,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background "Contact Us" Text
                    Container(
                      width: 219,
                      height: 48.38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.3), // ✅ Transparent effect
                      ),
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          height: 1.21,
                          color:
                              Colors.white.withOpacity(0.3), // ✅ Faded effect
                        ),
                      ),
                    ),

                    // Foreground "Let’s Get in Touch"
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Let’s Get ",
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        children: [
                          WidgetSpan(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFB8FE22), // ✅ Primary Green
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              child: Text(
                                "in Touch",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFB8FE22), // ✅ Icons/Primary Green applied to text
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Divider
              Container(
                width: 372,
                height: 2.29,
                color: Colors.white.withOpacity(0.5),
              ),

              SizedBox(height: 10),

              // Map Locator Placeholder
              Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Opacity(
                      opacity: 0.2, // Adjust transparency as needed
                      child: Image.asset(
                        "assets/images/background_image_contactus.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Content
                  Column(
                    children: [
                      // Map Locator (Handled by others)
                      Container(
                        width: 372,
                        height: 199.5,
                        color: Colors.grey[
                            800], // Ensure it's semi-transparent if needed
                        child: Center(
                          child: Text(
                            "Map Locator",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

                      SizedBox(height: 14),

                      // Contact Us Form
                      Container(
                        width: 372,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // "Contact us" text
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: "Contact ",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Color(
                                              0xFFB8FE22),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          "us",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Urbanist',
                                            color: Color(0xFFB8FE22),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 15),

                            // Input Fields
                            Container(
                              width: 332,
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Label(
                                      fieldLabel: 'Name',
                                      optionalTextAvailable: ''),
                                  SizedBox(height: 15),
                                  TextInputField(
                                    enabled: true,
                                    hintText: 'Enter Your Name',
                                    uniqueTextInputFieldId: '',
                                    textEditingController:
                                        controller.nameController,
                                  ),
                                  SizedBox(height: 15),
                                  Label(
                                      fieldLabel: 'Email',
                                      optionalTextAvailable: ''),
                                  SizedBox(height: 15),
                                  TextInputField(
                                    enabled: true,
                                    hintText: 'user@email.com',
                                    uniqueTextInputFieldId: '',
                                    textEditingController:
                                        controller.emailController,
                                  ),
                                  SizedBox(height: 15),
                                  Label(
                                      fieldLabel: 'Description',
                                      optionalTextAvailable: 'optional',
                                      ),
                                  SizedBox(height: 15),
                                  DescriptionInputField(
                                    enabled: true,
                                    textEditingController:
                                        controller.descriptionController,
                                    hintText: 'Enter Brief Description',
                                    uniqueTextInputFieldId: '',
                                  ),
                                  SizedBox(height: 15),
                                  PrimaryButton(
                                      buttonWidth: 331,
                                      buttonHeight: 45,
                                      buttonText: 'Submit',
                                      onTap: () {},
                                      isEnabled: true)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
