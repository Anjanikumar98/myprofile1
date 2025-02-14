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
      body: SafeArea(
        minimum: EdgeInsets.only(top: (10 / 800) * deviceHeight),
        child: SingleChildScrollView(
          child: Container(
            width: deviceWidth,
            height: deviceHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/gym_app_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color(0xFF063434).withOpacity(0.8),
                  BlendMode.srcOver,
                ),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF121212).withOpacity(0.25),
                  const Color(0xFF121212).withOpacity(0.25),
                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: (40 / 800) * deviceHeight),

                // Top AppBar with Back Button and Notifications
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: (16 / 360) * deviceWidth),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                          ),
                          SizedBox(width: (8 / 360) * deviceWidth),
                          const Text(
                            "My Plan",
                            style: TextStyle(
                              fontSize: 18,
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
                              const Icon(
                                Icons.notifications_none,
                                size: 24,
                                color: Colors.white,
                              ),
                              Positioned(
                                top: 1,
                                left: 16,
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Text(
                                    '4',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: (16 / 360) * deviceWidth),
                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.circle, size: 4, color: Colors.white),
                              SizedBox(height: 4),
                              Icon(Icons.circle, size: 4, color: Colors.white),
                              SizedBox(height: 4),
                              Icon(Icons.circle, size: 4, color: Colors.white),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Stats Section
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: (8 / 360) * deviceWidth,
                      vertical: (16 / 800) * deviceHeight),
                  child: Column(
                    children: [
                      // Headings Section
                      Container(
                        width: (282 / 360) * deviceWidth,
                        height: (73 / 800) * deviceHeight,
                        padding: EdgeInsets.symmetric(
                            horizontal: (10 / 360) * deviceWidth),
                        child: Column(
                          children: [
                            // "Final Overview" Text
                            Text(
                              "Final Overview",
                              textAlign: TextAlign.center, // ✅ Moved here
                              style: TextStyle(
                                fontFamily: "Barlow Semi Condensed",
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                fontSize: (40 / 360) * deviceWidth,
                                height: (48 / 48), // Line-height = 48px
                                letterSpacing: 0,
                                color: Colors.white,
                              ),
                            ),

                            SizedBox(
                                height: (4 / 800) * deviceHeight), // Gap: 4px

                            // "Check the final look of your webpage." Text
                            Text(
                              "Check the final look of your webpage.",
                              textAlign: TextAlign.center, // ✅ Moved here
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                                fontSize: (14 / 360) * deviceWidth,
                                height: (21 / 21), // Line-height = 21px
                                letterSpacing: 0,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                          height: (20 / 800) *
                              deviceHeight), // Gap: 20px (from Figma)

                      // Call FinalScreen inside Flexible
                      Column(
                        children: [
                          Expanded(
                            child: FinalScreen(), // Scrollable content
                          ),
                          // Fixed CTA & Checkbox Section
                          _buildFixedCTASection(deviceWidth, deviceHeight),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
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
    return Padding(
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
            buttonText: "Make it Live",
            isEnabled: true,
            onTap: () {
              // Perform action for "Make it Live"
            },
          ),
        ],
      ),
    );
  }
}
