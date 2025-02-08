import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../scroll_controller.dart';
import '../widets/navbar.dart';

class ScrollableScreen extends StatelessWidget {
  final ScrollControllerX scrollControllerX = Get.put(ScrollControllerX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: SafeArea(
        child: Column(
          children: [
            NavbarWithMenu(),
            Expanded(
              child: SingleChildScrollView(
                controller: scrollControllerX.scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SectionWidget(key: scrollControllerX.servicesKey, title: "Services", content: "Details about Services..."),
                      SectionWidget(key: scrollControllerX.membershipKey, title: "Membership", content: "Details about Membership..."),
                      SectionWidget(key: scrollControllerX.trainersKey, title: "Trainers", content: "Meet our Trainers..."),
                      SectionWidget(key: scrollControllerX.contactUsKey, title: "Contact Us", content: "Contact details here..."),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Section widget
class SectionWidget extends StatelessWidget {
  final String title;
  final String content;

  SectionWidget({Key? key, required this.title, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.limeAccent)),
          SizedBox(height: 10),
          Text(content, style: TextStyle(fontSize: 16, color: Colors.white)),
        ],
      ),
    );
  }
}
