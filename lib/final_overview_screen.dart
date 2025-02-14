import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Screens/fotter_screen.dart';
import 'Components/D1MM8_components/Membership_section/membership_view.dart';
import 'Components/D1MM8_components/Trainers_componet/trainers_section.dart';
import 'Components/D1MM8_components/Virtual_Tour_Section/virtual_tour_section.dart';
import 'Components/D1MM8_components/business_details.dart';
import 'Components/D1MM8_components/contactus.dart';
import 'Components/D1MM8_components/reviews_container.dart';
import 'Components/D1MM8_components/services.dart';
import 'Components/global_components/buttons/primary_button.dart';
import 'Components/global_components/buttons/secondary_button.dart';
import 'Controllers/D1MM8_Controllers/final_screen_controller.dart';
import 'Controllers/D1MM8_Controllers/mebership_controller.dart';
import 'Controllers/D1MM8_Controllers/navbar_controller.dart';
import 'Controllers/D1MM8_Controllers/periodic_selector_controller.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  late final FinalScreenController controller;
  late final MembershipController membershipController;
  late final PeriodController periodController;

  @override
  void initState() {
    super.initState();
    controller = Get.put(FinalScreenController(), permanent: true);
    membershipController = Get.put(MembershipController(), permanent: true);
    periodController = Get.put(PeriodController(), permanent: true);
  }

  @override
  void dispose() {
    Get.delete<FinalScreenController>();
    Get.delete<MembershipController>();
    Get.delete<PeriodController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Stack(
        children: [
          Positioned.fill(child: _buildBackground()),
          SizedBox(
            height: deviceHeight,
            child: Column(
              children: [
                CustomNavbar(),
                Expanded(
                  // ✅ Ensures content stays within screen bounds
                  child: SingleChildScrollView(
                    child: _buildScrollableContent(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            "assets/images/background_image_final_screen1.png",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.3), // ✅ Apply opacity directly
            colorBlendMode: BlendMode.darken,
          ),
        ),
        // Gradient Overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF063434).withOpacity(0.9),
                  const Color(0xFF063434).withOpacity(0.8),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScrollableContent() {
    return Column(
      mainAxisSize: MainAxisSize.min, // ✅ Prevents infinite height issues
      children: [
        BusinessDetails(),
        Services(),
        VirtualTourSection(),
        MembershipPlansView(),
        TrainersSection(),
        ReviewsContainer(),
        ContactUsSection(),
        FlexFitFooter(),
      ],
    );
  }
}


