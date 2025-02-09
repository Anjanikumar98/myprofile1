import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  var isMenuOpen = false.obs;
  var currentIcon = 0.obs; // To switch between two icons

  @override
  void onInit() {
    super.onInit();
    // Change icon every 2 seconds
    Timer.periodic(Duration(seconds: 2), (timer) {
      currentIcon.value = (currentIcon.value == 0) ? 1 : 0;
    });
  }
}

class CustomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavbarController controller = Get.put(NavbarController());

    return Positioned(
      top: 15,
      left: 10,
      right: 10,
      child: Obx(() => Column(
        children: [
          // Main Navbar
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 54, sigmaY: 54),
              child: Container(
                width: 344,
                height: 64,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 25,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Logo with continuously changing animated icon
                    Row(
                      children: [
                        AnimatedSwitcher(
                          duration: Duration(milliseconds: 500),
                          transitionBuilder: (child, animation) {
                            return ScaleTransition(scale: animation, child: child);
                          },
                          child: Icon(
                            controller.currentIcon.value == 0
                                ? Icons.sports_gymnastics
                                : Icons.fitness_center,
                            key: ValueKey(controller.currentIcon.value),
                            color: Color(0xFFB8FE22),
                            size: 30,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "FlexFit",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Color(0xFFB8FE22),
                          ),
                        ),
                      ],
                    ),

                    // Hamburger Menu Icon
                    GestureDetector(
                      onTap: () {
                        controller.isMenuOpen.value =
                        !controller.isMenuOpen.value;
                      },
                      child: Icon(
                        controller.isMenuOpen.value
                            ? Icons.close
                            : Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Expanded Navbar (Dropdown)
          if (controller.isMenuOpen.value)
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 372,
              height: 278,
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 25,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo Again
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.sports_gymnastics,
                              color: Color(0xFFB8FE22), size: 30),
                          SizedBox(width: 10),
                          Text(
                            "FlexFit",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              color: Color(0xFFB8FE22),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.isMenuOpen.value = false;
                        },
                        child: Icon(Icons.close, color: Colors.white, size: 30),
                      ),
                    ],
                  ),

                  // Divider
                  SizedBox(height: 10),
                  Container(
                    width: 324,
                    height: 8,
                    padding: EdgeInsets.symmetric(vertical: 4),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  SizedBox(height: 10),

                  // Menu Items
                  menuItem("Services"),
                  menuItem("Membership"),
                  menuItem("Trainers"),
                  menuItem("Contact Us"),
                ],
              ),
            ),
        ],
      )),
    );
  }

  Widget menuItem(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
