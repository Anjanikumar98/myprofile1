import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PriceCard extends StatelessWidget {
  final String name;
  final String price;
  final String duration;
  final String currency;
  final String planType;
  final bool isRecommended;

  const PriceCard({
    super.key,
    required this.name,
    required this.price,
    required this.duration,
    this.currency = '₹',
    required this.planType,
    required this.isRecommended,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    final bool isSessionBased = planType.toLowerCase().contains('session');
    final Color planColor = isSessionBased
        ? const Color(0xFFB8FE22) // Bright Green
        : const Color(0xFF55A6C4); // Blue

    final double height = isRecommended ? 133.09 : 130.09;

    return ClipRRect(
      borderRadius: BorderRadius.circular(5.6), // Use the fixed border radius
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 28.01, // Fixed blur intensity
          sigmaY: 28.01,
        ),
        child: Container(
          width: 188.79, // Fixed width
          height: height, // Dynamic height based on recommendation status
          decoration: BoxDecoration(
            color: const Color(0x5540DEEF), // Transparent Blue
            borderRadius: BorderRadius.circular(5.6), // Fixed border radius
            border: Border.all(
                color: planColor, width: 1), // Border color based on plan
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(11.21, 5.6, 11.21, 1.4),
                child: _buildMembershipName(),
              ),
              SizedBox(height: 1.4,),
              Padding(
                padding: const EdgeInsets.fromLTRB(11.21, 1.4, 11.21, 1.4),
                child: _buildPriceSection(planColor),
              ),
              const SizedBox(height: 1.4),
              _buildDivider(),
              const SizedBox(height: 2.8),
              _buildPlanTypeAndRating(planType),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMembershipName() {
    return SizedBox(
      width: 171.0, // Small increment to fit text
      height: isRecommended ? 27 : 24, // Dynamically adjust height
      child: FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown, // Ensures text fits in a single line
        child: Text(
          name,
          style: TextStyle(
            fontFamily: "Barlow Semi Condensed",
            fontSize: isRecommended ? 22 : 20,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.italic,
            height: 1.1, // More stable height
            letterSpacing: -0.2, // Reduce spacing slightly
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
          maxLines: 1,
          overflow: TextOverflow.visible, // Prevents truncation
          softWrap: false, // Ensures no wrapping
        ),
      ),
    );
  }

  Widget _buildPriceSection(Color planColor) {
    return SizedBox(
      width: 166.38, // Matches Figma width
      height: 30, // Matches Figma height
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.center, // Ensures alignment consistency
        children: [
          // Currency symbol (₹)
          Text(
            currency, // Assuming 'currency' holds the currency symbol (₹)
            style: TextStyle(
              fontFamily: "Pontano Sans",
              fontSize: 14, // Fixed font size
              fontWeight: FontWeight.w500,
              color: planColor, // Use the plan color for currency text
            ),
          ),
          SizedBox(width: 2), // Exact gap from Figma

          // Price (e.g., "4000")
          Text(
            price, // Assuming 'price' holds the price (e.g., 4000)
            style: TextStyle(
              fontFamily: "Barlow Semi Condensed",
              fontSize: 25, // Fixed font size
              fontWeight: FontWeight.w700,
              height: 1.2, // Adjusted line height ratio directly
              color: planColor, // Plan color for price text
            ),
          ),
          SizedBox(width: 4), // Fixed gap from Figma

          // "Per Month" text
          Text(
            "Per Month", // The text showing duration
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 8, // Fixed font size
              fontWeight: FontWeight.w400,
              color: const Color(
                  0xFFF4F4F4), // Light grayish color for "Per Month"
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 2.24), // Matches Figma padding
      child: Center(
        child: Container(
          width: 166.38, // Parent container width
          height: 4.48, // Divider height
          padding:
              const EdgeInsets.symmetric(horizontal: 5.6), // Left-Right padding
          child: Container(
            width: 155.18, // Actual divider line width
            height: 0.84, // Border width from Figma
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: const Color(
                      0x8055A6C4), // Transparent overlay primary blue
                  width: 0.84, // Border width
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlanTypeAndRating(String planType) {
    // Determine color based on plan type
    Color planColor = planType == "Session Based Plan"
        ? const Color(0xFFB8FE22) // Green
        : const Color(0xFF55A6C4); // Blue

    return SizedBox(
      width: 166.38, // Fixed width
      height: 17, // Fixed height
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Rating Section
          SizedBox(
            width: 31.24, // Fixed width
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Rating Text (e.g., "4.0")
                Text(
                  "4.0", // Hardcoded rating value
                  style: TextStyle(
                    fontFamily: "Barlow Semi Condensed",
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    fontSize: 14, // Fixed font size
                    height: 1.2, // Adjusted line height ratio
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(width: 2.8), // Fixed gap between rating and star

                _buildVectorIcon(), // Call the method to display the SVG
              ],
            ),
          ),

          // Spacer between Rating and Divider
          SizedBox(width: 4.48), // Fixed gap

          // Divider
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.24, horizontal: 1.12),
            child: // Adjusted Divider
                Center(
              child: Container(
                width: 2.24, // Fixed width for divider
                height: 17 - 2.7, // Lower by 2.7 pixels
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color:
                          const Color(0x8055A6C4), // Transparent blue overlay
                      width: 0.84, // Fixed border width
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Spacer between Divider and Plan Type
          SizedBox(width: 4.48), // Fixed gap

          // Plan Type Text
          Container(
            alignment: Alignment.center,
            child: Text(
              planType, // Plan type text (e.g., "Session Based Plan")
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 7.84, // Fixed font size
                color: planType == "Session Based Plan"
                    ? const Color(0xFFB8FE22) // Green text
                    : const Color(0xFF55A6C4), // Blue text
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVectorIcon() {
    return SvgPicture.asset(
      'assets/images/Vector.svg',
      width: 10.435, // Set width for the icon
      height: 10.085, // Set height for the icon
      fit: BoxFit
          .contain, // Ensures the icon fits within the provided dimensions
    );
  }
}
