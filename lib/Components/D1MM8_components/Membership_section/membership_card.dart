import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/D1MM8_components/Membership_section/price_card.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';
import '../../../models/global_models/info_element_model.dart';
import '../../global_components/common_containers/additional_info.dart';
import '../widgets/features_list.dart';
import 'membership_model.dart';

class MembershipCard extends StatelessWidget {
  final MembershipPlan plan;
  final bool isRecommended;
  final bool showOuterLayer;
  final String outerLayerText;

  MembershipCard({
    required this.plan,
    this.isRecommended = false,
    this.showOuterLayer = false,
    this.outerLayerText = "",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double baseWidth = isRecommended ? 200 : (screenWidth * 0.5);
    double baseHeight = isRecommended ? 428.987 : (baseWidth * (405.26 / 200));

    List<InfoModel> getAdditionalInfoByPlanType() {
      switch (plan.name) {
        case "Session-Based Plan":
          return [
            InfoModel(
                boldInt: 30,
                bottomString: "Sessions",
                topRightString: "Count"),
            InfoModel(
                boldInt: 90,
                bottomString: "Validity",
                topRightString: "Days"),
            InfoModel(
                boldInt: 100,
                bottomString: "Per Session",
                topRightString: "INR"),
          ];
        case "Period-Based Plan":
          return [
            InfoModel(boldInt: 0, bottomString: "Sessions", topRightString: ""),
            InfoModel(
                boldInt: 90,
                bottomString: "Validity",
                topRightString: "Days"),
            InfoModel(
                boldInt: 100,
                bottomString: "Per Session",
                topRightString: "INR"),
          ];
        default:
          return [];
      }
    }

    Widget cardContent = Container(
      width: baseWidth,
      height: baseHeight,
      padding: EdgeInsets.all(baseWidth * 0.028),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(baseWidth * 0.028),
        border: Border.all(
          color: isRecommended ? Color(0xFFB8FE22) : Color(0xFF376C7F),
          width: baseWidth * 0.0056,
        ),
        color: Colors.white.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: baseWidth * 0.14,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: baseWidth * 0.944,
            height: baseHeight * 0.973,
            padding: EdgeInsets.all(baseWidth * 0.028),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(baseWidth * 0.056),
              color: Colors.white.withOpacity(0.2),
            ),
            child: Column(
              children: [
                Container(
                  width: baseWidth * 0.944,
                  height: baseHeight * 0.234,
                  padding: EdgeInsets.symmetric(
                      horizontal: baseWidth * 0.056,
                      vertical: baseHeight * 0.014),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(baseWidth * 0.028),
                    color: Color(0x55A6C44D),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: baseWidth * 0.14, color: Colors.black26)
                    ],
                  ),
                  child: PriceCard(
                    planType: plan.name,
                    price: plan.price.toString(),
                    membershipName: plan.name,
                    rating: plan.rating,
                  ),
                ),
                SizedBox(height: baseHeight * 0.014),
                AdditionalInfo(
                  width: baseWidth * 0.944,
                  listOfAdditionalInfo: getAdditionalInfoByPlanType(),
                ),
                SizedBox(height: baseHeight * 0.014),
                PrimaryButton(
                  buttonWidth: baseWidth * 0.944,
                  buttonHeight: baseHeight * 0.067,
                  buttonText: 'Get Started',
                  onTap: () {},
                  isEnabled: true,
                ),
                SizedBox(height: baseHeight * 0.014),
                Divider(color: Colors.white.withOpacity(0.3), thickness: 1),
                SizedBox(height: baseHeight * 0.014),
                featureContainer(
                    text: "Key Features",
                    backgroundColor: Colors.white.withOpacity(0.9),
                    width: baseWidth * 0.944),
                SizedBox(height: baseHeight * 0.014),
                Container(
                  width: baseWidth * 0.944,
                  height: baseHeight * 0.437,
                  padding: EdgeInsets.symmetric(vertical: baseHeight * 0.011),
                  decoration: BoxDecoration(
                    color: Color(0xFF063434),
                    borderRadius: BorderRadius.circular(baseWidth * 0.039),
                  ),
                  child: FeaturesList(
                    features: List.generate(
                      5,
                      (_) =>
                          "Features added in membership Plan during plan Creation.",
                    ),
                  ),
                ),
                SizedBox(height: baseHeight * 0.014),
              ],
            ),
          )
        ],
      ),
    );

    if (showOuterLayer) {
      return Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.6),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 28.014, sigmaY: 28.014),
              child: Container(
                width: baseWidth + 10,
                height: baseHeight + 10,
                padding: EdgeInsets.all(5.6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.6),
                  border: Border.all(color: Color(0xFFB8FE22), width: 1.12),
                  color: Colors.transparent,
                ),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      outerLayerText,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFB8FE22),
                      ),
                    ),
                    cardContent,
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return cardContent;
  }

  Widget featureContainer({
    required double width,
    double height = 15,
    double padding = 5.6,
    String text = "Key Features",
    Color backgroundColor = Colors.white,
    TextStyle textStyle = const TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: 10,
      height: 1.5,
      letterSpacing: 0,
      color: Colors.black,
    ),
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(559.73),
      ),
      alignment: Alignment.center,
      child: Text(text, style: textStyle),
    );
  }
}
