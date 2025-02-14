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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double baseWidth =
        isRecommended ? (200 / 360) * deviceWidth : (0.5 * deviceWidth);
    double baseHeight = isRecommended
        ? (428.987 / 800) * deviceHeight
        : (baseWidth * (405.26 / 200));

    List<InfoModel> getAdditionalInfoByPlanType() {
      switch (plan.name) {
        case "Session-Based Plan":
          return [
            InfoModel(
                boldInt: 30, bottomString: "Sessions", topRightString: "Count"),
            InfoModel(
                boldInt: 90, bottomString: "Validity", topRightString: "Days"),
            InfoModel(
                boldInt: 100,
                bottomString: "Per Session",
                topRightString: "INR"),
          ];
        case "Period-Based Plan":
          return [
            InfoModel(boldInt: 0, bottomString: "Sessions", topRightString: ""),
            InfoModel(
                boldInt: 90, bottomString: "Validity", topRightString: "Days"),
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
      padding: EdgeInsets.all((10 / 360) * deviceWidth),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((10 / 360) * deviceWidth),
        border: Border.all(
          color: isRecommended ? Color(0xFFB8FE22) : Color(0xFF376C7F),
          width: (2 / 360) * deviceWidth,
        ),
        color: Colors.white.withOpacity(0.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: (10 / 360) * deviceWidth,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: (340 / 360) * deviceWidth,
            height: (390 / 800) * deviceHeight,
            padding: EdgeInsets.all((10 / 360) * deviceWidth),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular((20 / 360) * deviceWidth),
              color: Colors.white.withOpacity(0.2),
            ),
            child: Column(
              children: [
                Container(
                  width: (340 / 360) * deviceWidth,
                  height: (80 / 800) * deviceHeight,
                  padding: EdgeInsets.symmetric(
                      horizontal: (20 / 360) * deviceWidth,
                      vertical: (5 / 800) * deviceHeight),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular((10 / 360) * deviceWidth),
                    color: Color(0x55A6C44D),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: (10 / 360) * deviceWidth,
                          color: Colors.black26)
                    ],
                  ),
                  child: PriceCard(
                    planType: plan.name,
                    price: plan.price.toString(),
                    membershipName: plan.name,
                    rating: plan.rating,
                  ),
                ),
                SizedBox(height: (10 / 800) * deviceHeight),
                AdditionalInfo(
                  width: (340 / 360) * deviceWidth,
                  listOfAdditionalInfo: getAdditionalInfoByPlanType(),
                ),
                SizedBox(height: (10 / 800) * deviceHeight),
                PrimaryButton(
                  buttonWidth: (340 / 360) * deviceWidth,
                  buttonHeight: (50 / 800) * deviceHeight,
                  buttonText: 'Get Started',
                  onTap: () {},
                  isEnabled: true,
                ),
                SizedBox(height: (10 / 800) * deviceHeight),
                Divider(color: Colors.white.withOpacity(0.3), thickness: 1),
                SizedBox(height: (10 / 800) * deviceHeight),
                featureContainer(
                  text: "Key Features",
                  backgroundColor: Colors.white.withOpacity(0.9),
                  width: (340 / 360) * deviceWidth,
                  deviceWidth: deviceWidth,
                  deviceHeight: deviceHeight,
                ),
                SizedBox(height: (10 / 800) * deviceHeight),
                Container(
                  width: (340 / 360) * deviceWidth,
                  height: (150 / 800) * deviceHeight,
                  padding:
                      EdgeInsets.symmetric(vertical: (5 / 800) * deviceHeight),
                  decoration: BoxDecoration(
                    color: Color(0xFF063434),
                    borderRadius:
                        BorderRadius.circular((10 / 360) * deviceWidth),
                  ),
                  child: FeaturesList(
                    features: List.generate(
                      5,
                      (_) =>
                          "Features added in membership Plan during plan Creation.",
                    ),
                  ),
                ),
                SizedBox(height: (10 / 800) * deviceHeight),
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
            borderRadius: BorderRadius.circular((5.6 / 360) * deviceWidth),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: (28.014 / 360) * deviceWidth,
                sigmaY: (28.014 / 800) * deviceHeight,
              ),
              child: Container(
                width: baseWidth + ((10 / 360) * deviceWidth),
                height: baseHeight + ((10 / 800) * deviceHeight),
                padding: EdgeInsets.all((5.6 / 360) * deviceWidth),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular((5.6 / 360) * deviceWidth),
                  border: Border.all(
                    color: Color(0xFFB8FE22),
                    width: (1.12 / 360) * deviceWidth,
                  ),
                  color: Colors.transparent,
                ),
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      outerLayerText,
                      style: TextStyle(
                        fontSize: (12 / 800) * deviceHeight,
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
    required double deviceWidth,
    required double deviceHeight,
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
      height: (height / 800) * deviceHeight,
      padding: EdgeInsets.symmetric(horizontal: (padding / 360) * deviceWidth),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular((20 / 360) * deviceWidth),
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: textStyle.copyWith(fontSize: (10 / 800) * deviceHeight),
      ),
    );
  }
}
