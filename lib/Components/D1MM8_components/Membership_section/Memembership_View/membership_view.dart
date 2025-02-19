// lib/views/membership_plans_view.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/D1MM8_components/Membership_section/membership_cards_view.dart';
import 'package:myprofile1/Components/D1MM8_components/widgets/custom_title.dart';
import 'package:myprofile1/Components/D1MM8_components/Membership_section/periodic_selcetor.dart';
import '../../../../Controllers/D1MM8_Controllers/mebership_controller.dart';
import '../../../../Controllers/D1MM8_Controllers/periodic_selector_controller.dart';

class MembershipPlansView extends StatelessWidget {
  final MembershipController controller = Get.put(MembershipController());
  final PeriodController periodController = Get.put(PeriodController());

  MembershipPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: (412 / 360) * deviceWidth, // Fixed width
      height: (623.78/800) * deviceHeight, // Fixed height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.44), // Fixed border radius
        color: Colors.white
            .withOpacity(0.1), // Transparent white background with 10% opacity
        image: const DecorationImage(
          image: AssetImage('assets/images/background_image_memebership.png'),
          opacity: 0.1, // Low opacity for the background image
          fit: BoxFit.cover, // Ensure the image covers the container
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 14.3056, sigmaY: 14.3056), // Fixed blur effect
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            20, // Fixed padding for left and right
            25, // Fixed padding for top
            20, // Fixed padding for right
            25, // Fixed padding for bottom
          ),
          child: Column(
            children: [
              SizedBox(height: 25,),

              SizedBox(
                width: 372, // Matches Figma width
                height: 52, // Matches Figma height
                child: Column(
                  children: [
                    // CustomTitle with "Browse Memberships" text
                    CustomTitle(
                      backgroundText: 'Plans',
                      frontTextSegments: [
                        TextSegment(
                          text: 'Browse ',
                          color: Colors.white,
                        ),
                        TextSegment(
                          text: 'Memberships',
                          color: Color(0xFFB8FE22), // Matches Figma color #B8FE22
                        ),
                      ],
                    ),
                    // Fixed gap for spacing
                    SizedBox(height: (2.86 / 800) * deviceHeight), // Adjusted gap for responsiveness
                  ],
                ),
              ),

              SizedBox(height: 10),

              PeriodSelector(),

              SizedBox(height: 10),

              Container(
                width: 372, // Matches Figma width
                height: 2.29, // Matches Figma height
                padding: EdgeInsets.symmetric(
                  vertical: 1.14, // Fixed vertical padding based on Figma
                  horizontal: 2.86, // Fixed horizontal padding based on Figma
                ),
                child: Center( // Center alignment
                  child: Container(
                    width: 366.28, // Adjusted width as per Figma (matches 366.28)
                    height: 0, // No height for the line itself, only a border will show
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 0.43, // Fixed border width based on Figma
                          color: const Color(0x55A6C480), // Matches Figma color
                        ),
                      ),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 10),
              // Plans List
              MembershipCardsView(),
            ],
          ),
        ),
      ),
    );
  }
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
