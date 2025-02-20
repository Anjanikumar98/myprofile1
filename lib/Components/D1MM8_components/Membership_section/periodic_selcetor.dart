import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controllers/D1MM8_Controllers/Membership_section/periodic_selector_controller.dart';

class PeriodSelector extends StatelessWidget {
  PeriodSelector({super.key});

  final PeriodController controller = Get.find<PeriodController>();

  @override
  Widget build(BuildContext context) {

    // double deviceWidth = Get.width;
    // double deviceHeight = Get.height;

    return Center(
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centers it vertically if needed
        children: [
          _buildTabContainer(), // This is 150px wide but centered
        ],
      ),
    );
  }

  Widget _buildTabContainer() {
    return SizedBox(
      child: Container(
        width: 150, // Fixed width from Figma
        height: 42, // Fixed height from Figma
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.02),
          color: const Color(0x4D55A6C4),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6.02), // Fixed border radius
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 30.12, sigmaY: 30.12),
            child: Padding(
              padding: EdgeInsets.all(4), // Fixed padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Obx(() => _buildMonthlyTab()),

                  SizedBox(
                    width: 2,
                  ),
                  // Divider
                  Center(
                    child: Container(
                      width: 0.6, // Keeps it thin like a vertical divider
                      height: 28.46, // Matches your expected height
                      color: const Color(0xFF063434), // Divider color
                    ),
                  ),

                  SizedBox(
                    width: 2,
                  ),
                  Obx(() => _buildQuarterlyTab()),
                ],
              ),
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
          width: 63.1, // Matches Figma (Rounded from 63.096)
          height: 31, // Matches Figma (Rounded from 28.457)
          padding: EdgeInsets.all(2.41), // Matches Figma
          decoration: BoxDecoration(
            color: isActive
                ? const Color(0xFF063434)
                : const Color(0xFFDDEDF3), // Matches Figma
            borderRadius: BorderRadius.circular(2.41), // Matches Figma
            border: Border.all(
              width: 0.6, // Matches Figma
              color: const Color(0xFF063434),
            ),
          ),
          child: Center(
            child: Container(
              width: 58.28, // Matches Figma (Rounded from 58.277)
              height: 23.64, // Matches Figma (Rounded from 23.638)
              padding: EdgeInsets.symmetric(
                vertical: 4.82, // Matches Figma
                horizontal: 9.64, // Matches Figma
              ),
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF063434)
                    : const Color(0xFFDDEDF3), // Matches Figma
                borderRadius: BorderRadius.circular(2.41), // Matches Figma
              ),
              child: Center(
                child: Text(
                  'Monthly',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    fontSize: 8, // Matches Figma
                    fontWeight: FontWeight.w500, // Matches Figma
                    height: 2,
                    letterSpacing: 0, // Matches Figma
                    color: isActive
                        ? Colors.white
                        : const Color(0xFF063434), // Matches Figma
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _buildQuarterlyTab() {
    bool isActive = controller.selectedPeriod.value == 'Quarterly';

    return GestureDetector(
      onTap: () => controller.changePeriod('Quarterly'),
      child: Container(
        width: 63.1, // Kept same width for alignment with "Monthly"
        height: 31, // Matches Figma
        padding: EdgeInsets.all(2.4), // Reduced padding to prevent overflow
        child: Container(
          width: 58.05, // Matches Figma
          height: 23.64, // Matches Figma
          padding: EdgeInsets.symmetric(
            vertical: 4.82, // Matches Figma
            horizontal: 9.64, // Matches Figma
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.41), // Matches Figma
            color: isActive ? const Color(0xFF063434) : const Color(0xFFDDEDF3),
          ),
          child: Center(
            child: Text(
              'Quarterly',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 8, // Matches Figma
                fontWeight: FontWeight.w500,
                height: 2, // Matches Figma
                letterSpacing: 0,
                color: isActive ? Colors.white : const Color(0xFF063434),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
