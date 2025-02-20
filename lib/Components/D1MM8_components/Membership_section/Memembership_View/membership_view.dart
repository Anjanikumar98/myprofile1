// lib/views/membership_plans_view.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/D1MM8_components/Membership_section/membership_cards_view.dart';
import 'package:myprofile1/Components/D1MM8_components/widgets/custom_title.dart';
import 'package:myprofile1/Components/D1MM8_components/Membership_section/periodic_selcetor.dart';
import '../../../../Controllers/D1MM8_Controllers/Membership_section/mebership_controller.dart';
import '../../../../Controllers/D1MM8_Controllers/Membership_section/periodic_selector_controller.dart';

class MembershipPlansView extends StatelessWidget {
  final MembershipController controller = Get.put(MembershipController());
  final PeriodController periodController = Get.put(PeriodController());

  MembershipPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(11.44),
      child: Container(
        width: 412,
        height: 623.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.44),
          color: Colors.white.withOpacity(0.1),
          image: const DecorationImage(
            image: AssetImage('assets/images/background_image_memebership.png'),
            opacity: 0.1,
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), // Apply a slight blur
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                const SizedBox(height: 15),

                // Title Section
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 372,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: CustomTitle(
                        backgroundText: 'Plans',
                        frontTextSegments: const [
                          TextSegment(
                            text: 'Browse ',
                            color: Colors.white,
                          ),
                          TextSegment(
                            text: 'Memberships',
                            color: Color(0xFFB8FE22),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Period Selector
                SizedBox(width: 372, child: PeriodSelector()),

                const SizedBox(height: 8),

                // Divider Line
                Container(
                  width: 372, // Matches Figma width
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.14, horizontal: 2.86), // Figma padding
                  child: Center(
                    child: Container(
                      width: 366.28, // Matches Figma line width
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            width: 0.43, // Matches Figma border width
                            color:
                                const Color(0x55A6C480), // Matches Figma color
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                // Membership Cards View
                SizedBox(
                    width: 372, // Scales based on screen width
                    height: 460, // Scales based on screen height
                    child: MembershipCardsView()),
              ],
            ),
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
