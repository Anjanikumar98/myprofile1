import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controllers/D1MM8_Controllers/periodic_selector_controller.dart';



class PeriodSelector extends StatelessWidget {
  final controller = Get.put(PeriodController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 372,
      height: 40.51,
      child: Row(
        children: [
          // Main Tab Container
          Container(
            width: 150,
            height: 40.51,
            margin: EdgeInsets.only(top: 23, left: 15),
            decoration: BoxDecoration(
              color: Color(0x4D55A6C4), // #55A6C44D with 30% opacity
              borderRadius: BorderRadius.circular(6.02),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.02),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30.12, sigmaY: 30.12),
                child: Padding(
                  padding: EdgeInsets.all(6.02),
                  child: Row(
                    children: [
                      // Monthly Tab
                      Obx(() => _buildMonthlyTab()),
                      // Divider
                      Container(
                        width: 0.6,
                        height: 28.46,
                        constraints: BoxConstraints(
                          maxWidth: 30.12,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF063434),
                              width: 0.6,
                            ),
                          ),
                        ),
                      ),
                      // Quarterly Tab
                      Obx(() => _buildQuarterlyTab()),
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

  Widget _buildMonthlyTab() {
    bool isActive = controller.selectedPeriod.value == 'Monthly';

    return GestureDetector(
      onTap: () => controller.changePeriod('Monthly'),
      child: Container(
        width: 63.10,
        height: 28.46,
        padding: EdgeInsets.all(2.41),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF063434) : Colors.transparent,
          borderRadius: BorderRadius.circular(2.41),
        ),
        child: Center(
          child: Text(
            'Monthly',
            style: GoogleFonts.poppins(
              fontSize: 9.64,
              fontWeight: FontWeight.w500,
              height: 1.5, // for 14.46px line height
              letterSpacing: 0,
              color: isActive ? Colors.white : Color(0xFF063434),
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
        width: 58.05,
        height: 23.64,
        padding: EdgeInsets.fromLTRB(6.02, 4.82, 6.02, 4.82),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF063434) : Colors.transparent,
          borderRadius: BorderRadius.circular(601.81),
        ),
        child: Center(
          child: Text(
            'Quarterly',
            style: GoogleFonts.poppins(
              fontSize: 9.64,
              fontWeight: FontWeight.w500,
              height: 1.5, // for 14.46px line height
              letterSpacing: 0,
              color: isActive ? Colors.white : Color(0xFF063434),
            ),
          ),
        ),
      ),
    );
  }
}

