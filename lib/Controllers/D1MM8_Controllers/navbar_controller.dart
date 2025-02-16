import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  RxBool isMenuOpen = false.obs;
  RxInt currentIcon = 0.obs;
  late ScrollController scrollController;
  late Timer _iconTimer;

  final List<IconData> icons = [
    Icons.fitness_center,
    Icons.sports_gymnastics,
    Icons.directions_run,
    Icons.sports_martial_arts,
  ];

  NavbarController(this.scrollController) {
    _startIconAnimation();
  }

  void _startIconAnimation() {
    _iconTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentIcon.value = (currentIcon.value + 1) % icons.length;
    });
  }

  void scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      isMenuOpen.value = false; // Close the menu after clicking
    }
  }

  @override
  void onClose() {
    _iconTimer.cancel(); // Stop the timer when the controller is disposed
    super.onClose();
  }
}

class Navbar extends StatelessWidget {
  final Function(String) onItemSelected;
  final NavbarController controller = Get.find<NavbarController>();

  Navbar({Key? key, required this.onItemSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Drawer(
      backgroundColor: Colors.black87, // Dark background
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: (20 / 800) * deviceHeight,
            horizontal: (20 / 360) * deviceWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() {
                      return Icon(
                        controller.icons[controller.currentIcon.value],
                        color: Color(0xFFC1F80B), // Light green color
                        size: (24 / 360) * deviceWidth,
                      );
                    }),
                    SizedBox(width: (10 / 360) * deviceWidth),
                    Text(
                      "FlexFit",
                      style: TextStyle(
                          color: Color(0xFFC1F80B),
                          fontSize: (20 / 360) * deviceWidth,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.close,
                      color: Colors.white, size: (24 / 360) * deviceWidth),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Divider(color: Colors.white30),
            SizedBox(height: (10 / 800) * deviceHeight),
            menuItem("Services", deviceWidth, deviceHeight),
            menuItem("Membership", deviceWidth, deviceHeight),
            menuItem("Trainers", deviceWidth, deviceHeight),
            menuItem("Contact Us", deviceWidth, deviceHeight),
          ],
        ),
      ),
    );
  }

  Widget menuItem(String text, double deviceWidth, double deviceHeight) {
    return GestureDetector(
      onTap: () {
        onItemSelected(text);
        Navigator.pop(Get.context!); // Close drawer
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: (10 / 800) * deviceHeight),
        child: Text(
          text,
          style: TextStyle(
            fontSize: (18 / 360) * deviceWidth,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
