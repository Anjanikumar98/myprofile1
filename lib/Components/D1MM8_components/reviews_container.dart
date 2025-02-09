import 'package:flutter/material.dart';

class ReviewsContainer extends StatelessWidget {
  const ReviewsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 670.29, // Rounded for better readability
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFF1A), // Transparent overlay white 10%
        borderRadius: BorderRadius.circular(11.44),
      ),
      child: const Placeholder(), // Indicates empty space for other components
    );
  }
}
