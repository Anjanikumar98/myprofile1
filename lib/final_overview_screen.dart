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
import 'Controllers/D1MM8_Controllers/navbar_controller.dart';

class FinalScreen extends StatelessWidget {
  FinalScreen({super.key});

  final FinalScreenController controller = Get.put(FinalScreenController());

  @override
  Widget build(BuildContext context) {
    // Define device width and height inside the build method
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Stack(
        children: [
          _buildBackground(),
          Column(
            children: [
              SizedBox(height: (15 / 800) * deviceHeight),
              CustomNavbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: _buildScrollableContent(),
                ),
              ),
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
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF063434).withOpacity(0.9),
            const Color(0xFF063434).withOpacity(0.8),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableContent() {
    return Column(
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
