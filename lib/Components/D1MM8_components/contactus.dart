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

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.black,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            (20 / 360) * deviceWidth,
            (25 / 800) * deviceHeight,
            (20 / 360) * deviceWidth,
            (25 / 800) * deviceHeight,
          ), // ✅ Responsive padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Title Section
              SizedBox(
                width: (372 / 360) * deviceWidth, // ✅ Responsive width
                height: (48.38 / 800) * deviceHeight, // ✅ Responsive height
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background "Contact Us" Text
                    Container(
                      width: (219 / 360) * deviceWidth, // ✅ Responsive width
                      height:
                          (48.38 / 800) * deviceHeight, // ✅ Responsive height
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.3), // ✅ Transparent effect
                      ),
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: (40 / 360) *
                              deviceWidth, // ✅ Responsive font size
                          fontWeight: FontWeight.w700,
                          height: 1.21, // ✅ Keeps proper line spacing
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
                          fontSize: (24 / 360) *
                              deviceWidth, // ✅ Responsive font size
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        children: [
                          WidgetSpan(
                            alignment: PlaceholderAlignment
                                .middle, // ✅ Ensures proper vertical alignment
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFFB8FE22), // ✅ Primary Green background
                                borderRadius: BorderRadius.circular(4),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: (4 / 360) *
                                    deviceWidth, // ✅ Responsive padding
                                vertical: (2 / 800) * deviceHeight,
                              ),
                              child: Text(
                                "in Touch",
                                style: TextStyle(
                                  fontSize: (24 / 360) *
                                      deviceWidth, // ✅ Responsive font size
                                  fontWeight: FontWeight.w700,
                                  color: Colors
                                      .black, // ✅ Black for contrast against the green background
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

              SizedBox(height: 10 / 800 * deviceHeight),

              // Divider
              Container(
                width: (372 / 360) * deviceWidth,
                height: (2.29 / 800) * deviceHeight,
                color: Colors.white.withOpacity(0.5),
              ),

              SizedBox(height: 10 / 800 * deviceHeight),

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
                        width: (372 / 360) * deviceWidth,
                        height: (199.5 / 800) * deviceHeight,
                        color: Colors.grey[800], // Ensure it's semi-transparent if needed
                        child: Center(
                          child: Image.asset(
                            'assets/images/map_locator_image.png', // Replace with the actual path to your image
                            fit: BoxFit.cover, // Adjust as needed for how you want the image to fit
                          ),
                        ),
                      ),

                      SizedBox(height: 14 / 800 * deviceHeight),

                      // Contact Us Form
                      Container(
                        width: (372 / 360) * deviceWidth,
                        padding: EdgeInsets.symmetric(
                            horizontal: (20 / 360) * deviceWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // "Contact us" text
                            Center(
                              child: RichText(
                                text: TextSpan(
                                  text: "Contact ",
                                  style: TextStyle(
                                    fontSize: (24 / 360) * deviceWidth,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Urbanist',
                                    color: Colors.white,
                                  ),
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: (4 / 360) * deviceWidth,
                                          vertical: (2 / 800) * deviceHeight,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFB8FE22),
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          "us",
                                          style: TextStyle(
                                            fontSize: (24 / 360) * deviceWidth,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Urbanist',
                                            color: Colors.black, // Change text color to something visible
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 15 / 800 * deviceHeight),

                            // Input Fields
                            Container(
                              width: (332 / 360) * deviceWidth,
                              color: Colors.transparent,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Label(
                                      fieldLabel: 'Name',
                                      optionalTextAvailable: ''),
                                  SizedBox(height: 15 / 800 * deviceHeight),
                                  TextInputField(
                                    enabled: true,
                                    hintText: 'Enter Your Name',
                                    uniqueTextInputFieldId: '',
                                    textEditingController:
                                        controller.nameController,
                                  ),
                                  SizedBox(height: 15 / 800 * deviceHeight),
                                  Label(
                                      fieldLabel: 'Email',
                                      optionalTextAvailable: ''),
                                  SizedBox(height: 15 / 800 * deviceHeight),
                                  TextInputField(
                                    enabled: true,
                                    hintText: 'user@email.com',
                                    uniqueTextInputFieldId: '',
                                    textEditingController:
                                        controller.emailController,
                                  ),
                                  SizedBox(height: 15 / 800 * deviceHeight),
                                  Label(
                                    fieldLabel: 'Description',
                                    optionalTextAvailable: 'optional',
                                  ),
                                  SizedBox(height: 15 / 800 * deviceHeight),
                                  DescriptionInputField(
                                    enabled: true,
                                    textEditingController:
                                        controller.descriptionController,
                                    hintText: 'Enter Brief Description',
                                    uniqueTextInputFieldId: '',
                                  ),
                                  SizedBox(height: 15 / 800 * deviceHeight),
                                  PrimaryButton(
                                    buttonWidth: (331 / 360) *
                                        deviceWidth, // ✅ Responsive width
                                    buttonHeight: (45 / 800) *
                                        deviceHeight, // ✅ Responsive height
                                    buttonText: 'Submit',
                                    onTap: () {},
                                    isEnabled: true,
                                  )
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