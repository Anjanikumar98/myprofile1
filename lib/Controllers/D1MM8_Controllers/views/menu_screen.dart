import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../scroll_controller.dart';
import '../widets/menu_item.dart';

class MenuScreen extends StatelessWidget {
  final ScrollControllerX scrollControllerX = Get.find(); // ✅ Get instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("FlexFit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.limeAccent)),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(Icons.close, size: 30, color: Colors.white),
                  ),
                ],
              ),
              Divider(color: Colors.white.withOpacity(0.2)),
              SizedBox(height: 20),

              // ✅ Scroll to section on tap
              MenuItem("Services", onTap: () {
                Get.back(); // Close menu first
                scrollControllerX.scrollToSection(scrollControllerX.servicesKey);
              }),
              MenuItem("Membership", onTap: () {
                Get.back();
                scrollControllerX.scrollToSection(scrollControllerX.membershipKey);
              }),
              MenuItem("Trainers", onTap: () {
                Get.back();
                scrollControllerX.scrollToSection(scrollControllerX.trainersKey);
              }),
              MenuItem("Contact Us", onTap: () {
                Get.back();
                scrollControllerX.scrollToSection(scrollControllerX.contactUsKey);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
