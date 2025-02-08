import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/D1MM8_Controllers/business_controller.dart';
import '../utils/color_constants.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({Key? key}) : super(key: key);

  /// Register BusinessController
  final BusinessController controller = Get.put(BusinessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌆 Background Image with Overlay
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5),
                BlendMode.darken,
              ),
              child: Opacity(
                opacity: 0.5,
                child: Image.asset(
                  "assets/images/background_image_about.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // 🌫️ Inner Blurred Card
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.86, sigmaY: 2.86),
                child: Container(
                  width: 350,
                  height: 500,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 📌 About Us Header
                      Text(
                        "About Us",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: ColorConstant.primaryGreen,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // 📌 About Us Text (Dynamic)
                      Obx(() => Text(
                        controller.aboutUsText.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorConstant.pureWhite,
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
