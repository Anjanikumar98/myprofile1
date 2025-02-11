import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../D1MM8_components/business_card.dart';
import '../D1MM8_components/widgets/custom_divider.dart';
import '../global_components/buttons/primary_button.dart';
import '../global_components/buttons/secondary_button.dart';
import '../local_components/business_name.dart';

class BusinessConnections extends StatelessWidget {
  const BusinessConnections({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Center(
        child: Container(
          width: screenWidth * 0.9,
          padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.03,
            horizontal: screenWidth * 0.03,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  double containerWidth = screenWidth < 340
                      ? screenWidth
                      : 340; // Max 340px, shrinks on small screens
                  double containerHeight = screenWidth < 340
                      ? screenWidth * (24 / 340)
                      : 24; // Proportional height
                  double paddingSize = screenWidth < 340
                      ? screenWidth * (10 / 340)
                      : 10; // Proportional padding
                  double textWidth = containerWidth -
                      (2 * paddingSize); // Adjusting for padding
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: containerWidth,
                        height: containerHeight,
                        padding: EdgeInsets.symmetric(horizontal: paddingSize),
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: textWidth,
                          child: Text(
                            'Business Connections',
                            style: TextStyle(
                              fontFamily: 'Barlow Semi Condensed',
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              fontSize: 20, // Fixed size as per Figma
                              height: 1.2,
                              letterSpacing: 0,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: screenWidth < 340
                              ? screenWidth * (5 / 340)
                              : 5), // Adjusts 5px gap
                    ],
                  );
                },
              ),
              const SizedBox(height: 10),
              const CustomDivider(
                width: 340,
                height: 8,
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              ),
              const SizedBox(height: 10),
              _formContainer(screenWidth, screenHeight),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formContainer(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                BusinessName(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                  borderRadius: 10,
                ),
                const SizedBox(height: 16),
                _ctaContainer(screenWidth),
                const SizedBox(height: 16),
                CustomDivider(
                  width: 324,
                  height: 8,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                ),
                const SizedBox(height: 16),
                deleteAffiliationButton(),
                const SizedBox(height: 10),
                infoSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _ctaContainer(double screenWidth) {
    double containerWidth = screenWidth * 0.9; // Adjust to parent width
    double buttonHeight = 45;
    double buttonSpacing = screenWidth * 0.03; // Responsive spacing

    return Container(
      width: containerWidth,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: SecondaryButton(
              width: containerWidth * 0.25, // Scales with screen width
              height: buttonHeight,
              secondaryText: 'Report',
              isEnabled: true,
              isPrimary: false,
              hasIcon: false,
              OnTap: () {},
              borderWidth: 2,
              borderColor: const Color(0xFF55A6C4),
              borderRadius: 8,
              padding: const EdgeInsets.all(4),
            ),
          ),
          SizedBox(width: buttonSpacing), // Responsive spacing
          Flexible(
            flex: 2, // Takes more space than secondary button
            child: PrimaryButton(
              buttonText: 'Call Manager',
              onTap: () {},
              isEnabled: true,
              buttonWidth: containerWidth * 0.65,
              buttonHeight: buttonHeight,
              borderRadius: 8,
              padding: const EdgeInsets.all(4),
              backgroundColor: const Color(0xFFB8FE22),
            ),
          ),
        ],
      ),
    );
  }

  Widget deleteAffiliationButton() {
    return InkWell(
      onTap: () {
        Get.bottomSheet(
          Container(
            padding: const EdgeInsets.all(16), // Padding for better spacing
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust height based on content
              children: const [
                Text(
                  "D1CM6 What went wrong",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text("Please describe the issue or retry your action."),
              ],
            ),
          ),
          isScrollControlled: true, // Ensures better control over height
          backgroundColor: Colors.transparent,
          barrierColor:
              Colors.black.withOpacity(0.6), // Adjusted for better contrast
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double buttonWidth = screenWidth < 324
              ? screenWidth - 20
              : 324; // Adjust width dynamically

          return Container(
            width: buttonWidth,
            padding: const EdgeInsets.symmetric(vertical: 12), // Dynamic height
            decoration: BoxDecoration(
              color: const Color(0x80DF0030), // Transparent red
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFDF0030), // Ruby Red Border
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                'Delete affiliation',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14, // Ensure readability
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget infoSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double containerWidth = screenWidth < 324 ? screenWidth : 324;

        return Container(
          width: containerWidth,
          padding: const EdgeInsets.symmetric(
              horizontal: 4, vertical: 4), // Added vertical padding
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4), // Off-White Background
            borderRadius: BorderRadius.circular(4), // Softer edges
          ),
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns text properly
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                alignment: Alignment.center, // Centers icon
                child: const Icon(
                  Icons.info_outline,
                  size: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 4), // Gap between icon and text
              Expanded(
                child: Text(
                  'Deleting your affiliation will remove your access to exclusive services and benefits.',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    height: 1.5, // 15px line-height
                    letterSpacing: 0,
                    color: Colors.black,
                  ),
                  softWrap: true, // Allows text to wrap
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
