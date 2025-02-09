import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Screens/fotter_screen.dart';
import 'Components/D1MM8_components/Trainers_componet/trainers_section.dart';
import 'Components/D1MM8_components/Virtual_Tour_Section/virtual_tour_section.dart';
import 'Components/D1MM8_components/business_details.dart';
import 'Components/D1MM8_components/contactus.dart';
import 'Components/D1MM8_components/reviews_container.dart';
import 'Components/D1MM8_components/services.dart';
import 'Components/global_components/buttons/primary_button.dart';
import 'Components/global_components/buttons/secondary_button.dart';
import 'Controllers/D1MM8_Controllers/final_screen_controller.dart';
import 'Controllers/D1MM8_Controllers/navbar_controller.dart';

class FinalScreen extends StatelessWidget {
  final FinalScreenController controller =
      Get.put(FinalScreenController()); // ✅ Add this

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(), // Background Image

          Column(
            children: [
              _buildHeader(),
              SizedBox(
                height: 35,
              ),
              // ✅ Navbar added on top
              CustomNavbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildScrollableContent(),
                ),
              ),
              _buildTermsAndConditions(),
              _buildActionButtons(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background_image_final_screen1.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3), // ✅ Adjust image visibility
            BlendMode.darken, // ✅ Blend image with gradient
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF063434).withOpacity(0.9), // ✅ Added opacity
            Color(0xFF063434).withOpacity(0.8),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Text(
            "Final Overview",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Check the final look of your webpage."),
        ],
      ),
    );
  }

  Widget _buildScrollableContent() {
    return Column(
      children: [
        BusinessDetails(),
        Services(),
        VirtualTourSection(),
        // Memberships(),
        TrainersSection(),
        ReviewsContainer(),
        ContactUsSection(),
        FlexFitFooter(),
      ],
    );
  }

  Widget _buildTermsAndConditions() {
    // ✅ Removed unnecessary parameter
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => Checkbox(
                value: controller.isChecked.value, // Observe value
                checkColor: Colors.green.shade300,
                onChanged: (bool? value) {
                  controller.isChecked.value = value ?? false; // Update state
                },
              )),
          Expanded(
            child: Text(
              "I accept the terms and conditions and acknowledge that I have read and agree to abide by the company’s policies and guidelines.",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: SecondaryButton(
              width: 67,
              height: 37,
              secondaryText: "Back",
              isEnabled: true,
              isPrimary: false,
              hasIcon: false,
              OnTap: () {
                // Get.back();
              },
            ),
          ),
          SizedBox(width: 10), // Space between buttons
          Expanded(
            child: PrimaryButton(
              buttonWidth: 252,
              buttonHeight: 41,
              buttonText: "Make it Live",
              isEnabled: true,
              onTap: () {
                // Action for making it live
              },
            ),
          ),
        ],
      ),
    );
  }
}
