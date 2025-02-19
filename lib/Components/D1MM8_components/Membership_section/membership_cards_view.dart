import 'package:flutter/material.dart';
import 'Membership_Card/membership_card.dart';

class MembershipCardsView extends StatelessWidget {
  const MembershipCardsView({
    super.key,
    this.parentWidth,
    this.parentHeight,
  });

  final double? parentWidth;
  final double? parentHeight;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = parentWidth ?? MediaQuery.of(context).size.width;
    final deviceHeight = parentHeight ?? MediaQuery.of(context).size.height;

    // Define the membership data
    final List<Map<String, dynamic>> membershipData = [
      {
        'name': 'Membership Name',
        'price': '4000',
        'duration': 'Per Month',
        'planType': PlanType.sessionBased,
        'isRecommended': false,
      },
      {
        'name': 'Membership Name',
        'price': '4000',
        'duration': 'Per Month',
        'planType': PlanType.sessionBased,
        'isRecommended': true,
      },
      {
        'name': 'Membership Name',
        'price': '4000',
        'duration': 'Per Month',
        'planType': PlanType.periodBased,
        'isRecommended': false,
      },
      {
        'name': 'Membership Name',
        'price': '4000',
        'duration': 'Per Month',
        'planType': PlanType.periodBased,
        'isRecommended': true,
      },
    ];

    return SizedBox(
      width: (372 / 360) * deviceWidth, // Scales based on screen width
      height: (448.99 / 800) * deviceHeight, // Scales based on screen height
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Ensures horizontal scrolling
        physics: const BouncingScrollPhysics(),
        child: Row(
          // Use Row for horizontal layout
          children: List.generate(membershipData.length, (index) {
            final plan = membershipData[index];
            return Padding(
              padding: EdgeInsets.only(
                  right: index == membershipData.length - 1
                      ? 0
                      : (10 / 360) * deviceWidth // Apply spacing correctly
                  ),
              child: MembershipCard(
                name: plan['name'] as String,
                price: plan['price'] as String,
                duration: plan['duration'] as String,
                planType: plan['planType'] as PlanType,
                isRecommended: plan['isRecommended'] as bool,
              ),
            );
          }),
        ),
      ),
    );
  }
}
