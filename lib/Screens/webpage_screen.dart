import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/D1MM8_components/final_overview_Section.dart';
import '../Controllers/D1MM8_Controllers/webpage_controller.dart';
import '../Controllers/D1MM8_Controllers/scroll_controller.dart';
import '../Components/global_components/buttons/action_button.dart';
import '../Components/terms_condition.dart';
import '../Components/D1MM8_components/header_section.dart';
import '../Controllers/D1MM8_Controllers/widets/navbar.dart';
import 'aboutus.dart';

class WebPageScreen extends StatelessWidget {
  final WebPageController controller = Get.put(WebPageController());
  final ScrollControllerX scrollControllerX = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderSection(),
            SizedBox(height: 16),
            FinalOverviewSection(),
            SizedBox(height: 20),
            NavbarWithMenu(),

            // ✅ Attach ScrollController to ScrollView
            Expanded(
              child: SingleChildScrollView(
                controller: scrollControllerX.scrollController,
                child: Column(
                  children: [
                    Container(
                      key: scrollControllerX.servicesKey,
                      child: Text("Services Section",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                    SizedBox(height: 50),
                    Container(
                      key: scrollControllerX.membershipKey,
                      child: Text("Membership Section",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                    SizedBox(height: 50),
                    Container(
                      key: scrollControllerX.trainersKey,
                      child: Text("Trainers Section",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                    SizedBox(height: 50),
                    Container(
                      key: scrollControllerX.contactUsKey,
                      child: Text("Contact Us Section",
                          style: TextStyle(fontSize: 24, color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  TermsConditions(),
                  ActionButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
