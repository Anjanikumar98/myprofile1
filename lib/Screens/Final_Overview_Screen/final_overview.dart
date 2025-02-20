import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/D1MM8/final_overview_screen.dart';
import '../../Components/global_components/buttons/primary_button.dart';
import '../../Components/global_components/buttons/secondary_button.dart';
import '../../Controllers/D1MM8_Controllers/final_screen_controller.dart';


class FinalOverview extends StatefulWidget {
  const FinalOverview({super.key});

  @override
  State<FinalOverview> createState() => _FinalOverviewState();
}

class _FinalOverviewState extends State<FinalOverview> {
  final FinalScreenController controller = Get.put(FinalScreenController());

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/gym_app_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  const Color(0xFF063434).withOpacity(0.8),
                  BlendMode.srcOver,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
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
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: Icon(Icons.arrow_back,
                                    color: Colors.white)),
                            const SizedBox(width: 8),
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
                                  width: 32,
                                  height: 32,
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
                            const SizedBox(width: 16),
                            const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.circle,
                                    size: 4, color: Colors.white),
                                SizedBox(height: 4),
                                Icon(Icons.circle,
                                    size: 4, color: Colors.white),
                                SizedBox(height: 4),
                                Icon(Icons.circle,
                                    size: 4, color: Colors.white),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Stats Section
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 16 ),
                              _buildHeader(deviceWidth, deviceHeight),
                              SizedBox(height:20 ),

                              /// Ensure `_buildFinalScreen` does not get overlapped
                              SizedBox(
                                height: (571 / 800) * deviceHeight -
                                    (60 / 800) * deviceHeight,
                                child: _buildFinalScreen(
                                    deviceWidth, deviceHeight),
                              ),
                            ],
                          ),

                          /// Fixed CTA Section at Bottom
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: _buildFixedCTASection(
                                deviceWidth, deviceHeight),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Header Section
  Widget _buildHeader(double deviceWidth, double deviceHeight) {
    return Container(
      width: 282,
      height: 73,
      padding: EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: Text(
              "Final Overview",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 26, // Reduced slightly
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(height: 2), // Reduced spacing
          Flexible(
            child: Text(
              "Check the final look of your webpage.",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14, // Reduced slightly
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Final Screen Container
  Widget _buildFinalScreen(double deviceWidth, double deviceHeight) {
    return Container(
      width: 344, // Fixed width
      constraints: BoxConstraints(
        maxHeight: 650, // Fixed max height
      ),
      decoration: BoxDecoration(
        color: Color(0x4D55A6C4), // Fixed background color
        borderRadius: BorderRadius.circular(15), // Fixed border-radius
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Fixed rounded corners
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10, // Fixed blur value
            sigmaY: 10, // Fixed blur value
          ),
          child: SizedBox(
            height: double.infinity, // Corrected height usage
            child: FinalScreen(), // Ensures correct rendering
          ),
        ),
      ),
    );
  }

  Widget _buildFixedCTASection(double deviceWidth, double deviceHeight) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
            (8 / 360) * deviceWidth), // Responsive radius based on device width
        topRight: Radius.circular(
            (8 / 360) * deviceWidth), // Responsive radius based on device width
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX:
              (10 / 360) * deviceWidth, // Responsive blur based on device width
          sigmaY:
              (10 / 360) * deviceWidth, // Responsive blur based on device width
        ),
        child: Container(
          width: (345 / 360) * deviceWidth, // ✅ Match Figma width
          height: (158 / 800) * deviceHeight, // ✅ Match Figma height
          padding: EdgeInsets.only(
            top: (10 / 800) * deviceHeight, // ✅ Match Figma padding
            bottom: (20 / 800) * deviceHeight, // ✅ Match Figma padding
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.5),
                Colors.transparent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular((8 / 360) *
                  deviceWidth), // Responsive radius based on device width
              topRight: Radius.circular((8 / 360) *
                  deviceWidth), // Responsive radius based on device width
            ),
          ),
          child: Column(
            children: [
              _buildTermsAndConditions(deviceWidth, deviceHeight),
              SizedBox(height: (15 / 800) * deviceHeight),
              _buildActionButtons(deviceWidth, deviceHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTermsAndConditions(double deviceWidth, double deviceHeight) {
    return SizedBox(
      width: (345 / 360) * deviceWidth,
      height: (45 / 800) * deviceHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Align items properly
        children: [
          Obx(() => SizedBox(
                width: (24 / 360) * deviceWidth,
                height: (24 / 800) * deviceHeight,
                child: Checkbox(
                  value: controller.isChecked.value,
                  activeColor: Color(0xFFB8FE22),
                  onChanged: (bool? value) {
                    controller.isChecked.value = value ?? false;
                  },
                ),
              )),
          SizedBox(width: (8 / 360) * deviceWidth),
          SizedBox(
            width: (313 / 360) * deviceWidth,
            height: (45 / 800) * deviceHeight,
            child: Text(
              "I accept the terms and conditions and acknowledge that I have read and agree to abide by the company's policies and guidelines.",
              maxLines: 3,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: (10 / 360) * deviceWidth,
                height: (15 / 10),
                letterSpacing: 0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(double deviceWidth, double deviceHeight) {
    return Container(
      width: (345 / 360) * deviceWidth, // ✅ Match Figma width
      height: (65 / 800) * deviceHeight, // ✅ Match Figma height
      padding: EdgeInsets.symmetric(
        horizontal: (2 / 360) * deviceWidth, // ✅ Left-Right Padding (2px)
        vertical: (10 / 800) * deviceHeight, // ✅ Top-Bottom Padding (10px)
      ),
      decoration: BoxDecoration(
        color: Colors.transparent, // ✅ No background color mentioned
        borderRadius: BorderRadius.circular(6), // ✅ Match Figma
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SecondaryButton(
            width: (75 / 360) * deviceWidth, // ✅ Match Figma width
            height: (45 / 800) * deviceHeight, // ✅ Match Figma height
            secondaryText: "Back",
            isEnabled: true,
            isPrimary: false,
            hasIcon: false,
            borderColor: Color(0xFF55A6C4), // ✅ Figma Blue Border
            borderWidth: (2 / 360) *
                deviceWidth, // ✅ Figma specifies border width of 2px
            OnTap: () => Get.back(),
          ),
          PrimaryButton(
            buttonText: "Make it Live",
            isEnabled: controller.isChecked.value,
            onTap: () {},
            buttonWidth: (256 / 360) * deviceWidth, // ✅ Match Figma width
            buttonHeight: (45 / 800) * deviceHeight, // ✅ Match Figma height
            borderColor: Color(0xFFB8FE22), // ✅ Figma Green Border
            textColor: Color(0xFF121212),
            backgroundColor: Color(0xFFB8FE22),
          ),
        ],
      ),
    );
  }
}
