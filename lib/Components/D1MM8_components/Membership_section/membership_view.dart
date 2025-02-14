// lib/views/membership_plans_view.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/D1MM8_components/Membership_section/membership_card.dart';
import 'package:myprofile1/Components/D1MM8_components/widgets/custom_divider.dart';
import 'package:myprofile1/Components/D1MM8_components/widgets/custom_title.dart';
import 'package:myprofile1/Components/D1MM8_components/widgets/periodic_selcetor.dart';
import '../../../Controllers/D1MM8_Controllers/mebership_controller.dart';
import '../../../Controllers/D1MM8_Controllers/periodic_selector_controller.dart';
import 'membership_model.dart';

class MembershipPlansView extends StatelessWidget {
  final MembershipController controller = Get.put(MembershipController());
  final PeriodController periodController = Get.put(PeriodController());

  MembershipPlansView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: (412 / 360) * deviceWidth, // ✅ Responsive width
      height: (623.78 / 800) * deviceHeight, // ✅ Responsive height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((11.44 / 360) * deviceWidth), // ✅ Responsive border radius
        color: Colors.white.withOpacity(0.1),
        image: const DecorationImage(
          image: AssetImage('assets/images/background_image_memebership.png'),
          opacity: 0.1,
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14.31, sigmaY: 14.31),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            (20 / 360) * deviceWidth, // ✅ Responsive padding
            (25 / 800) * deviceHeight,
            (20 / 360) * deviceWidth,
            (25 / 800) * deviceHeight,
          ),
          child: Column(
            children: [
              // Title Section
              CustomTitle(
                width: (372 / 360) * deviceWidth, // ✅ Responsive width
                height: (52 / 800) * deviceHeight, // ✅ Responsive height
                gap: (2.86 / 360) * deviceWidth, // ✅ Responsive gap
                backgroundText: 'Plan',
                frontTextSegments: [
                  TextSegment(
                    text: 'Browse ', // Note the space after Browse
                    color: Colors.white,
                  ),
                  TextSegment(
                    text: 'Memberships',
                    color: const Color(0xFFB8FE22),
                  ),
                ],
              ),

              SizedBox(height: (10 / 800) * deviceHeight), // ✅ Responsive spacing

              // Period Toggle
              PeriodSelector(),

              SizedBox(height: (10 / 800) * deviceHeight),

              CustomDivider(),

              SizedBox(height: (10 / 800) * deviceHeight),

              // Plans List
              SizedBox(
                height: (448.99 / 800) * deviceHeight, // Keep responsive height
                child: Obx(() {
                  if (controller.plans.isEmpty) {
                    return Center(child: CircularProgressIndicator()); // Show loader if no data
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.plans.map((plan) => Padding(
                        padding: EdgeInsets.only(right: (10 / 360) * deviceWidth),
                        child: MembershipCard(plan: plan),
                      )).toList(),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildPeriodButton(String period) {
  //   return GestureDetector(
  //     onTap: () => controller.changePeriod(period),
  //     child: Container(
  //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //       decoration: BoxDecoration(
  //         color: controller.selectedPeriod.value == period
  //             ? Color(0xFFCBFB5E)
  //             : Colors.transparent,
  //         borderRadius: BorderRadius.circular(8),
  //       ),
  //       child: Text(
  //         period,
  //         style: TextStyle(
  //           color: controller.selectedPeriod.value == period
  //               ? Colors.black
  //               : Colors.white,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }
  //
  //
  // Widget _buildInfoBox(String value, String label, String unit) {
  //   return Container(
  //     padding: EdgeInsets.all(8),
  //     decoration: BoxDecoration(
  //       color: Colors.black.withOpacity(0.3),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: Column(
  //       children: [
  //         Text(
  //           value,
  //           style: TextStyle(
  //             color: Color(0xFFCBFB5E),
  //             fontSize: 18,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         Text(
  //           label,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 12,
  //           ),
  //         ),
  //         Text(
  //           unit,
  //           style: TextStyle(
  //             color: Colors.white.withOpacity(0.7),
  //             fontSize: 10,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
