import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Controllers/D1MM8_Controllers/periodic_selector_controller.dart';

class PeriodSelector extends StatelessWidget {
  final controller = Get.put(PeriodController());

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: (372 / 360) * deviceWidth,
      height: (40.51 / 800) * deviceHeight,
      child: Row(
        children: [
          // Main Tab Container
          Container(
            width: (150 / 360) * deviceWidth,
            height: (40.51 / 800) * deviceHeight,
            margin: EdgeInsets.only(
              top: (23 / 800) * deviceHeight,
              left: (15 / 360) * deviceWidth,
            ),
            decoration: BoxDecoration(
              color: const Color(0x4D55A6C4),
              borderRadius: BorderRadius.circular((6.02 / 360) * deviceWidth),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular((6.02 / 360) * deviceWidth),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30.12, sigmaY: 30.12),
                child: Padding(
                  padding: EdgeInsets.all((6.02 / 360) * deviceWidth),
                  child: Row(
                    children: [
                      // Monthly Tab
                      Obx(() => _buildMonthlyTab(context)),

                      // Divider
                      Container(
                        width: (0.6 / 360) * deviceWidth,
                        height: (28.46 / 800) * deviceHeight,
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color(0xFF063434),
                              width: 0.6,
                            ),
                          ),
                        ),
                      ),

                      // Quarterly Tab
                      Obx(() => _buildQuarterlyTab(context)),
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

  Widget _buildMonthlyTab(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    bool isActive = controller.selectedPeriod.value == 'Monthly';

    return GestureDetector(
      onTap: () => controller.changePeriod('Monthly'),
      child: Container(
        width: (63.10 / 360) * deviceWidth,
        height: (28.46 / 800) * deviceHeight,
        padding: EdgeInsets.all((2.41 / 360) * deviceWidth),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF063434) : Colors.transparent,
          borderRadius: BorderRadius.circular((2.41 / 360) * deviceWidth),
        ),
        child: Center(
          child: Text(
            'Monthly',
            style: GoogleFonts.poppins(
              fontSize: (9.64 / 360) * deviceWidth,
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 0,
              color: isActive ? Colors.white : const Color(0xFF063434),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuarterlyTab(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    bool isActive = controller.selectedPeriod.value == 'Quarterly';

    return GestureDetector(
      onTap: () => controller.changePeriod('Quarterly'),
      child: Container(
        width: (58.05 / 360) * deviceWidth,
        height: (23.64 / 800) * deviceHeight,
        padding: EdgeInsets.fromLTRB(
          (6.02 / 360) * deviceWidth,
          (4.82 / 800) * deviceHeight,
          (6.02 / 360) * deviceWidth,
          (4.82 / 800) * deviceHeight,
        ),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF063434) : Colors.transparent,
          borderRadius: BorderRadius.circular((601.81 / 360) * deviceWidth),
        ),
        child: Center(
          child: Text(
            'Quarterly',
            style: GoogleFonts.poppins(
              fontSize: (9.64 / 360) * deviceWidth,
              fontWeight: FontWeight.w500,
              height: 1.5,
              letterSpacing: 0,
              color: isActive ? Colors.white : const Color(0xFF063434),
            ),
          ),
        ),
      ),
    );
  }
}
