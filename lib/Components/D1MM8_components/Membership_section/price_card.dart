import 'package:flutter/material.dart';

class PriceCard extends StatelessWidget {
  final String planType;
  final String price;
  final String membershipName;
  final double rating;

  const PriceCard({
    Key? key,
    required this.planType,
    required this.price,
    required this.membershipName,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    // Determine colors based on plan type
    final bool isSessionBased = planType == "Session-Based Plan";
    final Color primaryColor = isSessionBased
        ? Color(0xFFB8FE22) // Green Tint
        : Color(0xFF55A6C4); // Blue Tint

    final Color backgroundColor = isSessionBased
        ? Color.fromRGBO(184, 254, 34, 0.3) // ✔ Correct 30% transparency
        : Color.fromRGBO(85, 166, 196, 0.3); // ✔ Correct 30% transparency

    return Container(
      width: (188.79 / 360) * deviceWidth, // ✔ Scales dynamically
      height: (95.09 / 800) * deviceHeight, // ✔ Scales dynamically
      padding: EdgeInsets.fromLTRB(
        (11.21 / 360) * deviceWidth,
        (5.6 / 800) * deviceHeight,
        (11.21 / 360) * deviceWidth,
        (5.6 / 800) * deviceHeight,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular((5.6 / 360) * deviceWidth),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Membership Name
          SizedBox(
            height: (24 / 800) * deviceHeight,
            child: Text(
              membershipName,
              style: TextStyle(
                fontFamily: "Barlow Semi Condensed",
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: (20 / 800) * deviceHeight,
                color: Colors.white,
              ),
            ),
          ),

          SizedBox(height: (2.8 / 800) * deviceHeight),

          // Price Section
          SizedBox(
            height: (30 / 800) * deviceHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ₹ Symbol
                Text(
                  "₹",
                  style: TextStyle(
                    fontFamily: "Pontano Sans",
                    fontWeight: FontWeight.w500,
                    fontSize: (14.01 / 800) * deviceHeight,
                    color: primaryColor,
                  ),
                ),
                SizedBox(width: (2 / 360) * deviceWidth),

                // Price Amount
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: "Barlow Semi Condensed",
                    fontWeight: FontWeight.w700,
                    fontSize: (25.21 / 800) * deviceHeight,
                    color: primaryColor,
                  ),
                ),

                SizedBox(width: (2 / 360) * deviceWidth),

                // Per Month
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: (2.8 / 800) * deviceHeight),
                  child: Text(
                    "Per Month",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: (8.96 / 800) * deviceHeight,
                      color: Color(0xFFF4F4F4),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: (2.8 / 800) * deviceHeight),

          // Divider
          Container(
            width: (166.38 / 360) * deviceWidth,
            height: (4.48 / 800) * deviceHeight,
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(color: Colors.white.withOpacity(0.5), width: 1),
              ),
            ),
          ),

          SizedBox(height: (2.8 / 800) * deviceHeight),

          // Rating & Plan Section
          SizedBox(
            height: (17 / 800) * deviceHeight,
            child: Row(
              children: [
                // Rating
                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        fontFamily: "Barlow Semi Condensed",
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontSize: (14.01 / 800) * deviceHeight,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: (2.8 / 360) * deviceWidth),

                    // Star Icon
                    Icon(Icons.star,
                        size: (10 / 800) * deviceHeight, color: Colors.blue),
                  ],
                ),

                SizedBox(width: (4.48 / 360) * deviceWidth),

                // Divider
                Container(
                  width: (2.24 / 360) * deviceWidth,
                  height: (17 / 800) * deviceHeight,
                  color: Colors.white.withOpacity(0.5),
                ),

                SizedBox(width: (4.48 / 360) * deviceWidth),

                // Plan Type
                Text(
                  planType,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: (7.84 / 800) * deviceHeight,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
