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
    // Determine colors based on plan type
    final bool isSessionBased = planType == "Session-Based Plan";
    final Color primaryColor = isSessionBased
        ? Color(0xFFB8FE22) // Green Tint
        : Color(0xFF55A6C4); // Blue Tint

    final Color backgroundColor = isSessionBased
        ? Color(0xB8FE224D) // Transparent Green Overlay
        : Color(0x558AC44D); // Transparent Blue Overlay

    return Container(
      width: 188.79,
      height: 95.09,
      padding: const EdgeInsets.fromLTRB(11.21, 5.6, 11.21, 5.6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5.6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Membership Name
          SizedBox(
            height: 24,
            child: Text(
              membershipName,
              style: const TextStyle(
                fontFamily: "Barlow Semi Condensed",
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 2.8),

          // Price Section
          SizedBox(
            height: 30,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ₹ Symbol
                Text(
                  "₹",
                  style: TextStyle(
                    fontFamily: "Pontano Sans",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.01,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(width: 2),

                // Price Amount
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: "Barlow Semi Condensed",
                    fontWeight: FontWeight.w700,
                    fontSize: 25.21,
                    color: primaryColor,
                  ),
                ),

                const SizedBox(width: 2),

                // Per Month
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2.8),
                  child: const Text(
                    "Per Month",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 8.96,
                      color: Color(0xFFF4F4F4),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 2.8),

          // Divider
          Container(
            width: 166.38,
            height: 4.48,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.white.withOpacity(0.5), width: 1),
              ),
            ),
          ),

          const SizedBox(height: 2.8),

          // Rating & Plan Section
          SizedBox(
            height: 17,
            child: Row(
              children: [
                // Rating
                Row(
                  children: [
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontFamily: "Barlow Semi Condensed",
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                        fontSize: 14.01,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 2.8),

                    // Star Icon (Replace with actual half-star icon)
                    const Icon(Icons.star, size: 10, color: Colors.blue),
                  ],
                ),

                const SizedBox(width: 4.48),

                // Divider
                Container(
                  width: 2.24,
                  height: 17,
                  color: Colors.white.withOpacity(0.5),
                ),

                const SizedBox(width: 4.48),

                // Plan Type
                Text(
                  planType,
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                    fontSize: 7.84,
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
