import 'package:flutter/material.dart';
import 'package:myprofile1/Components/D1MM8_components/Membership_section/Additional_Info_conatiner/additional_info_2.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';
import 'package:myprofile1/Components/global_components/common_containers/additional_info.dart';
import '../../../../models/global_models/info_element_model.dart';
import '../Price_Cards/price_card.dart';
import 'features_container.dart';
import 'membership_card_theme.dart';

class MembershipCard extends StatelessWidget {
  final String name;
  final String price;
  final String duration;
  final bool isRecommended;
  final PlanType planType;

  MembershipCard({
    super.key,
    required this.name,
    required this.price,
    required this.duration,
    required this.isRecommended,
    required this.planType,
  });

  final List<String> defaultFeatures = [
    "Features added in membership Plan during plan Creation.",
    "Features added in membership Plan during plan Creation.",
    "Features added in membership Plan during plan Creation.",
    "Features added in membership Plan during plan Creation.",
    "Features added in membership Plan during plan Creation.",
  ];

  static List<InfoModel> getAdditionalInfoByPlanType(PlanType planType) {
    return planType == PlanType.sessionBased
        ? sessionBasedInfo
        : periodBasedInfo;
  }

  static const List<InfoModel> sessionBasedInfo = [
    InfoModel(boldInt: '30', bottomString: "Sessions", topRightString: "Count"),
    InfoModel(boldInt: '90', bottomString: "Validity", topRightString: "Days"),
    InfoModel(
        boldInt: '100', bottomString: "Per Session", topRightString: "INR"),
  ];

  static const List<InfoModel> periodBasedInfo = [
    InfoModel(boldInt: '-', bottomString: "Sessions", topRightString: ""),
    InfoModel(boldInt: '90', bottomString: "Validity", topRightString: "Days"),
    InfoModel(
        boldInt: '100', bottomString: "Per Session", topRightString: "INR"),
  ];

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    final Color borderColor = MembershipCardTheme.borderColor(isRecommended);

    return Container(
      width: 200, // Fixed width for non-recommended cards
      height: isRecommended
          ? 463.99 // Height for recommended cards
          : 440.26, // Height for non-recommended cards

      margin: EdgeInsets.all(MembershipCardTheme.cardMargin), // Fixed margin
      padding: EdgeInsets.all(MembershipCardTheme.cardPadding), // Fixed padding
      decoration: BoxDecoration(
        color: MembershipCardTheme.cardBackgroundColor,
        borderRadius: BorderRadius.circular(
            MembershipCardTheme.borderRadius), // Fixed border radius
        border: Border.all(
          color: borderColor, // Conditional border color
          width: 1.12, // Fixed border width
        ),
      ),
      child: Container(
        width: 188.79, // Inner container width
        height: isRecommended
            ? 431.05 // Adjust height for recommended cards (subtract padding and border)
            : 329.05, // Adjust height for non-recommended cards (subtract padding and border)
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(11.21), // Fixed border radius
        ),
        padding: EdgeInsets.all(5.6),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PriceCard(
                name: name,
                price: price,
                duration: duration,
                currency: '₹',
                planType: planType.name,
                isRecommended: isRecommended,
              ),
              SizedBox(height: 5.6),
              AdditionalInfo(
                listOfAdditionalInfo: getAdditionalInfoByPlanType(planType),
                width: 188.79,
                height: 42.93,
              ),
              SizedBox(height: 5.6),
              SizedBox(
                width: 188.79, // Fixed width
                height: 27, // Fixed height
                child: Padding(
                  padding: EdgeInsets.all(2), // Fixed padding
                  child: PrimaryButton(
                    buttonWidth: 184.79, // Fixed button width
                    buttonHeight: 23, // Fixed button height
                    buttonText: 'Get Started',
                    textColor: Color(0xFF121212),
                    backgroundColor: Color(0xFFB8FE22),
                    onTap: () {},
                    isEnabled: true,
                  ),
                ),
              ),
              SizedBox(height: 5.6),
              Container(
                width: 188.8, // Fixed width
                height: 8.96, // Fixed height
                padding: EdgeInsets.symmetric(
                  horizontal: 11.21, // Fixed horizontal padding
                  vertical: 4.48, // Fixed vertical padding
                ),
                child: Center(
                  child: Divider(
                    thickness: 0.56,
                    color: Color(0x8055A6C4),
                    indent: (188.8 - 166.38) / 2,
                    endIndent: (188.8 - 166.38) / 2,
                  ),
                ),
              ),
              SizedBox(height: 5.6),
              Container(
                width: 188.8, // Fixed width
                height: 15, // Fixed height
                decoration: BoxDecoration(
                  color: Colors.transparent, // Transparent background
                  borderRadius:
                      BorderRadius.circular(50), // Fixed border radius
                ),
                padding: EdgeInsets.symmetric(horizontal: 5.6), // Fixed padding
                alignment:
                    Alignment.centerLeft, // Align text to the start (left)
                child: Text(
                  "Key Features:",
                  textAlign: TextAlign.start, // Ensures left alignment
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 10, // Fixed font size
                    height: 1.5, // Line height ratio
                    letterSpacing: 0,
                    color: Colors.white, // White text color
                  ),
                ),
              ),
              SizedBox(height: 5.6),
              FeaturesContainer(features: defaultFeatures),
            ],
          ),

          // If isRecommended is true, show the "Recommended" text
          // "Recommended" Text (if recommended)
          if (isRecommended)
            Positioned(
              top: 0, // Place it at the top
              left: (deviceWidth - 205.19) / 2, // Center horizontally
              child: Container(
                width: 205.19, // Width of the "Recommended" text container
                height: 15.13, // Height of the "Recommended" text container
                alignment: Alignment.center,
                child: Text(
                  'Recommended',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 8.96, // Fixed font size
                    height: 1.5, // Line height ratio
                    color: const Color(0xFFB8FE22), // Text color
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
        ]),
      ),
    );
  }
}

enum PlanType { sessionBased, periodBased }
