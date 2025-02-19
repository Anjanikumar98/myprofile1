import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PriceCard extends StatelessWidget {
  final String name;
  final String price;
  final String duration;
  final String currency;
  final String planType;
  final bool isRecommended; // Add this to conditionally change height

  const PriceCard({
    super.key,
    required this.name,
    required this.price,
    required this.duration,
    this.currency = '₹',
    required this.planType,
    required this.isRecommended, // Determines if the card is recommended
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    final Color planColor = (planType == "Session-Based Plan")
        ? const Color(0xFFB8FE22)
        : const Color(0xFF55A6C4);

    final double height = isRecommended ? 98.09 : 95.09;

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
          padding: const EdgeInsets.symmetric(
            horizontal: 11.21, // Horizontal padding
            vertical: 5.6, // Vertical padding
          ),
          decoration: BoxDecoration(
            color: const Color(0x55A6C44D), // Transparent Blue
            borderRadius: BorderRadius.circular(5.6), // Fixed border radius
            border: Border.all(
                color: planColor, width: 1), // Border color based on plan
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(11.21, 5.6, 11.21, 1.4),
                child: _buildMembershipName(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(11.21, 1.4, 11.21, 1.4),
                child: _buildPriceSection(planColor),
              ),
              const SizedBox(height: 1.4),
              _buildDivider(),
              const SizedBox(height: 2.8),
              const Spacer(),
              _buildPlanTypeAndRating(planType),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMembershipName() {
    return SizedBox(
      width: 166.38,
      height: 24,
      child: Text(
        name, // Assuming 'name' is a variable holding the membership name
        style: TextStyle(
          fontFamily: "Barlow Semi Condensed",
          fontSize: isRecommended
              ? 22.41
              : 20, // Adjust font size based on recommendation
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
          height: isRecommended
              ? 26.89 / 22.41
              : 24 / 20, // Adjust line height based on recommendation
          letterSpacing: 0, // No letter spacing as per Figma
          color: Colors.white, // Pure white color as defined (#FFFFFF)
        ),
        textAlign: TextAlign.start,
        maxLines: 1, // Limit to one line
        overflow: TextOverflow.ellipsis, // Add ellipsis if text overflows
      ),
    );
  }

  Widget _buildPriceSection(Color planColor) {
    return SizedBox(
      width: 166.38, // Fixed width
      height: 30, // Fixed height
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          // Currency symbol (₹)
          Text(
            currency, // Assuming 'currency' holds the currency symbol (₹)
            style: TextStyle(
              fontFamily: "Pontano Sans",
              fontSize: 14, // Fixed font size
              fontWeight: FontWeight.w500,
              height: 1.28, // Adjusted line height ratio directly
              color: planColor, // Use the plan color for currency text
            ),
          ),
          SizedBox(width: 2.24), // Fixed gap

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
          SizedBox(width: 5), // Fixed gap

          // "Per Month" text
          Text(
            "Per Month", // The text showing duration
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 10, // Fixed font size
              fontWeight: FontWeight.w400,
              height: 1.25, // Adjusted line height ratio
              color: const Color(
                  0xFFF4F4F4), // Light grayish color for "Per Month"
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Center(
      child: Container(
        width: 166.38, // Fixed width from previous calculation
        height: 4.48, // Fixed height from previous calculation
        padding: EdgeInsets.symmetric(
          vertical: 2.24,
          horizontal: 5.6,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: const Color(0x8055A6C4), // Equivalent to #55A6C480
            width: 0.84,
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
            height: 17, // Fixed height
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

                // Star Unit Component (Half-Star)
                Container(
                  width: 10.435,
                  height: 10.085,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFF55A6C4), // Border color (Primar-Blue)
                      width: 0.28, // Border width
                    ),
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                      colors: [Color(0xFF55A6C4), Colors.white],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.4242, 0.4923],
                    ),
                  ),
                  child: Center(
                    child:
                        _buildVectorIcon(), // Call the method to display the SVG
                  ),
                )
              ],
            ),
          ),

          // Spacer between Rating and Divider
          SizedBox(width: 4.48), // Fixed gap

          // Divider
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.24, horizontal: 1.12),
            child: Container(
              width: 2.24, // Fixed width for divider
              height: 17, // Fixed height
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: const Color(0x8055A6C4), // Transparent blue overlay
                    width: 0.84, // Fixed border width
                  ),
                ),
              ),
            ),
          ),

          // Spacer between Divider and Plan Type
          SizedBox(width: 4.48), // Fixed gap

          // Plan Type Text
          Container(
            width: 80, // Fixed width for plan type
            height: 12, // Fixed height
            alignment: Alignment.center,
            child: Text(
              planType, // Plan type text (e.g., "Session Based Plan")
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 7.84, // Fixed font size
                height: 1.5, // Adjusted line height ratio
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
      color: Colors.white, // Apply color if necessary
    );
  }
}
