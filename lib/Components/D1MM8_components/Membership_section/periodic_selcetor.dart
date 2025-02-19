import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controllers/D1MM8_Controllers/periodic_selector_controller.dart';


class PeriodSelector extends StatelessWidget {
  PeriodSelector({super.key});

  final PeriodController controller = Get.find<PeriodController>();

  @override
  Widget build(BuildContext context) {
    double deviceWidth = Get.width;
    double deviceHeight = Get.height;

    return SizedBox(
      width: (372 / 360) * deviceWidth, // Device-dependent scaling for width
      height: (40.51 / 800) * deviceHeight, // Device-dependent scaling for height
      child: Column(
        children: [
          _buildTabContainer(),
        ],
      ),
    );
  }


  Widget _buildTabContainer() {
    return Container(
      width: 150, // Fixed width from Figma
      height: 40.51, // Fixed height from Figma
      margin: EdgeInsets.only(
        top: 23, // Fixed margin top from Figma
        left: 15, // Fixed margin left from Figma
      ),
      decoration: BoxDecoration(
        color: const Color(0x4D55A6C4),
        borderRadius: BorderRadius.circular(6.02), // Fixed border radius
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6.02), // Fixed border radius
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30.12, sigmaY: 30.12),
          child: Padding(
            padding: EdgeInsets.all(6.02), // Fixed padding
            child: Row(
              children: [
                Obx(() => _buildMonthlyTab()),

                // Divider
                Center(
                  child: Transform.rotate(
                    angle: 90 *
                        3.1415927 /
                        180, // Convert degrees to radians (90 degrees)
                    child: Container(
                      width: 0.6, // Fixed width for the divider
                      height: 28.46, // Fixed height for the divider
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.6, // Fixed border width
                          color: const Color(0xFF063434), // Divider color
                        ),
                      ),
                    ),
                  ),
                ),

                Obx(() => _buildQuarterlyTab()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMonthlyTab() {
    bool isActive = controller.selectedPeriod.value == 'Monthly';

    return GestureDetector(
      onTap: () => controller.changePeriod('Monthly'),
      child: Container(
        width: 58.28, // Fixed width from Figma
        height: 23.64, // Fixed height from Figma
        padding: EdgeInsets.symmetric(
          vertical: 4.82, // Fixed vertical padding
          horizontal: 9.64, // Fixed horizontal padding
        ),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF063434) : Colors.transparent,
          borderRadius: BorderRadius.circular(2.41), // Fixed border radius
          border: Border.all(
            width: 0.6, // Fixed border width
            color: const Color(0xFF063434),
          ),
        ),
        child: Center(
          child: Text(
            'Monthly',
            style: GoogleFonts.poppins(
              fontSize: 16, // Fixed font size from Figma
              fontWeight: FontWeight.w500,
              height: 24 / 16, // Figma line height calculation
              letterSpacing: 0,
              color: isActive
                  ? Colors.white
                  : const Color(0xFF063434), // Active & Inactive Text Colors
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuarterlyTab() {
    bool isActive = controller.selectedPeriod.value == 'Quarterly';

    return GestureDetector(
      onTap: () => controller.changePeriod('Quarterly'),
      child: Container(
        width: 62.86, // Fixed width from Figma
        height: 28.46, // Fixed height from Figma
        padding: EdgeInsets.all(2.41), // Fixed padding
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              601.81), // Large border radius for pill shape
          color: isActive ? const Color(0xFF063434) : Colors.transparent,
        ),
        child: Container(
          width: 58.05, // Inner container width
          height: 23.64, // Inner container height
          padding: EdgeInsets.symmetric(
            vertical: 4.82, // Fixed vertical padding
            horizontal: 6.02, // Fixed horizontal padding
          ),
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(601.81), // Inner rounded container
            color: isActive ? const Color(0xFF063434) : Colors.transparent,
          ),
          child: Center(
            child: Text(
              'Quarterly',
              style: GoogleFonts.poppins(
                fontSize: 16, // Fixed font size from Figma
                fontWeight: FontWeight.w500,
                height: 24 / 16, // Figma line height calculation
                letterSpacing: 0,
                color: isActive
                    ? Colors.white
                    : const Color(0xFF063434), // White text when active
              ),
            ),
          ),
        ),
      ),
    );
  }
}
