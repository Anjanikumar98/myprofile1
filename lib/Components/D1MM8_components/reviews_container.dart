import 'package:flutter/material.dart';

class ReviewsContainer extends StatelessWidget {
  const ReviewsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: (412 / 360) * deviceWidth, // ✅ Responsive width
      height: (670.29 / 800) * deviceHeight, // ✅ Responsive height
      padding: EdgeInsets.fromLTRB(
        (20 / 360) * deviceWidth,
        (25 / 800) * deviceHeight,
        (20 / 360) * deviceWidth,
        (25 / 800) * deviceHeight,
      ), // ✅ Responsive padding
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1), // ✅ Corrected transparent overlay
        borderRadius: BorderRadius.circular(
            (11.44 / 360) * deviceWidth), // ✅ Responsive border radius
      ),
      child: const Placeholder(), // ✅ Placeholder for child content
    );
  }
}
