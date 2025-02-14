import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Components/global_components/buttons/primary_button.dart';
import '../../Components/global_components/buttons/secondary_button.dart';
import '../../Controllers/D1MM8_Controllers/final_screen_controller.dart';
import '../../final_overview_screen.dart';

class FinalOverview extends StatefulWidget {
  const FinalOverview({super.key});

  @override
  State<FinalOverview> createState() => _FinalOverviewState();
}

class _FinalOverviewState extends State<FinalOverview> {
  final FinalScreenController controller = Get.put(FinalScreenController());

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight((56 / 800) * deviceHeight), // Responsive AppBar height
        child: SafeArea(
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: (16 / 360) * deviceWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: (24 / 360) * deviceWidth),
                    ),
                    SizedBox(width: (8 / 360) * deviceWidth),
                    Text(
                      "My Plan",
                      style: TextStyle(
                        fontSize: (18 / 360) * deviceWidth,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: (32 / 360) * deviceWidth,
                          height: (32 / 800) * deviceHeight,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Icon(Icons.notifications_none, size: (24 / 360) * deviceWidth, color: Colors.white),
                        Positioned(
                          top: (1 / 800) * deviceHeight,
                          left: (16 / 360) * deviceWidth,
                          child: Container(
                            padding: EdgeInsets.all((4 / 360) * deviceWidth),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (8 / 360) * deviceWidth,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: (16 / 360) * deviceWidth),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, size: (4 / 360) * deviceWidth, color: Colors.white),
                        SizedBox(height: (4 / 800) * deviceHeight),
                        Icon(Icons.circle, size: (4 / 360) * deviceWidth, color: Colors.white),
                        SizedBox(height: (4 / 800) * deviceHeight),
                        Icon(Icons.circle, size: (4 / 360) * deviceWidth, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // ✅ Background Image
            Container(
              width: double.infinity,
              height: deviceHeight, // ✅ Cover full screen height
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/gym_app_background.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black
                        .withOpacity(0.8), // ✅ Dark overlay for readability
                    BlendMode.darken, // ✅ Better darkening effect
                  ),
                ),
              ),
            ),

            // ✅ Foreground Blur + Gradient Layer
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // ✅ 10px blur
                child: Container(
                  width: deviceWidth, // ✅ Full Width
                  height: deviceHeight, // ✅ Full Height
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent, // ✅ Fully transparent at top
                        Colors.black.withOpacity(0.95), // ✅ 95% dark at bottom
                      ],
                      stops: [0.4, 0.75], // ✅ Defines transition points
                    ),
                  ),
                ),
              ),
            ),

            // ✅ Main Content (Title Fixed, Content Scrollable)
            Column(
              children: [
                SizedBox(height: (16 / 800) * deviceHeight),

                // ✅ Fixed Title
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: (10 / 360) * deviceWidth),
                  child: Column(
                    children: [
                      Text(
                        "Final Overview",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: (24 / 360) * deviceWidth,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic, // ✅ Italic
                          color: Colors.white, // ✅ White text
                        ),
                      ),
                      SizedBox(
                          height: (4 / 800) * deviceHeight), // ✅ Gap of 4px
                      Text(
                        "Check the final look of your webpage.", // ✅ Subtitle
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: (16 / 360) * deviceWidth,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: (20 / 800) * deviceHeight), // ✅ Small Gap

                // ✅ Main Area Container
                Expanded(
                  child: Container(
                    width: (344 / 360) * deviceWidth, // ✅ Responsive Width
                    height: double.infinity, // ✅ Expand dynamically based on content
                    constraints: BoxConstraints(
                      maxHeight: (650 / 800) * deviceHeight, // ✅ Max Height of 650px
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15), // ✅ Rounded corners
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // ✅ Ensures rounded blur effect
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50), // ✅ 50px Blur
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0x55A6C44D), // ✅ Transparent Primary Blue Overlay
                            borderRadius: BorderRadius.circular(15), // ✅ Rounded corners
                          ),
                          padding: EdgeInsets.all((10 / 360) * deviceWidth), // ✅ 10px gap inside
                          child: SingleChildScrollView( // ✅ Enables scrolling for long forms
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FinalScreen(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // CTA & Checkbox Section
  Widget _buildFixedCTASection(double deviceWidth, double deviceHeight) {
    return Container(
      width: (345 / 360) * deviceWidth,
      height: (158 / 800) * deviceHeight,
      padding: EdgeInsets.symmetric(
        vertical: (10 / 800) * deviceHeight,
        horizontal: (2 / 360) * deviceWidth,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.transparent,
          ],
          stops: [0.524, 1.0], // 52.4% and 100% gradient stops
        ),
      ),
      child: Column(
        children: [
          _buildTermsAndConditions(deviceWidth, deviceHeight),
          SizedBox(height: (8 / 800) * deviceHeight),
          _buildActionButtons(deviceWidth, deviceHeight),
        ],
      ),
    );
  }

  Widget _buildTermsAndConditions(double deviceWidth, double deviceHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (10 / 360) * deviceWidth),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Checkbox(
                value: controller.isChecked.value,
                checkColor: Colors.green.shade300,
                activeColor:
                    Colors.transparent, // Ensuring transparency for better UI
                onChanged: (bool? value) {
                  controller.isChecked.value = value ?? false;
                },
              )),
          Expanded(
            child: Text(
              "I accept the terms and conditions and acknowledge that I have read and agree to abide by the company’s policies and guidelines.",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: (10 / 360) * deviceWidth, // Responsive font size
                height: (15 / 10), // Line-height = 15px
                letterSpacing: 0,
                color: Color(0xFFF4F4F4), // Off-White text color
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(double deviceWidth, double deviceHeight) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (2 / 360) * deviceWidth,
          vertical: (10 / 800) * deviceHeight,
        ),
        child: Row(
          children: [
            // Secondary Button (Back)
            SecondaryButton(
              width: (75 / 360) * deviceWidth,
              height: (45 / 800) * deviceHeight,
              secondaryText: "Back",
              isEnabled: true,
              isPrimary: false,
              hasIcon: false,
              OnTap: () {
                // Get.back();
              },
            ),

            SizedBox(width: (10 / 360) * deviceWidth), // Gap: 10px

            // Primary Button (Make it Live)
            PrimaryButton(
              buttonWidth: (256 / 360) * deviceWidth,
              buttonHeight: (45 / 800) * deviceHeight,
              backgroundColor: Colors.green.shade300,
              buttonText: "Make it Live",
              isEnabled: true,
              onTap: () {
                // Perform action for "Make it Live"
              },
            ),
          ],
        ),
      ),
    );
  }
}
