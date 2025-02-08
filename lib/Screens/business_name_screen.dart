import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/global_components/buttons/primary_button.dart';
import '../Controllers/D1MM8_Controllers/business_controller.dart';
import '../utils/color_constants.dart';

class BusinessNameScreen extends StatelessWidget {
  BusinessNameScreen({Key? key}) : super(key: key);

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
                  "assets/images/background_image_header.png",
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
                  width: 382,
                  height: 599.69,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // 📌 Business Name (Dynamic)
                      Obx(() => Text(
                        controller.businessName.value,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorConstant.primaryGreen,
                        ),
                      )),

                      const SizedBox(height: 8),

                      // 📌 Tagline (Dynamic)
                      Obx(
                            () => RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Tagline: ",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstant.primaryGreen,
                                ),
                              ),
                              TextSpan(
                                text: controller.tagline.value.isNotEmpty
                                    ? controller.tagline.value
                                    : "No tagline available",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstant.pureWhite,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // 📌 Business Description (Dynamic)
                      Obx(() => Text(
                        controller.description.value,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: ColorConstant.pureWhite,
                        ),
                      )),

                      const SizedBox(height: 20),

                      // 📌 Get Started Button
                      SizedBox(
                        width: 160,
                        child: PrimaryButton(
                          buttonWidth: 160,
                          buttonHeight: 42,
                          buttonText: 'Get Started',
                          isEnabled: true,
                          borderColor: Colors.black,
                          borderWidth: 2,
                          onTap: () {
                            controller.updateBusinessInfo(
                              "New Business",
                              "Your New Tagline",
                              "We are updating our business description dynamically!",
                            );
                          },
                          icon: const Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.arrow_outward,
                              color: Colors.black,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
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
