import 'package:flutter/material.dart';

class SectionBreak extends StatelessWidget {
  final String sectionTitle;
  final String sectionDescription;
  final bool optional;

  const SectionBreak({
    super.key,
    required this.sectionTitle,
    required this.sectionDescription,
    required this.optional,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: (328 / 360) * deviceWidth, // Scaled width
      padding: EdgeInsets.symmetric(
          horizontal: (5 / 360) * deviceWidth), // Scaled padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                sectionTitle,
                style: TextStyle(
                  fontFamily: 'Poppins', // Set correct font
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: (21 / 14),
                  color: Colors.white,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(width: (10 / 360) * deviceWidth), // Scaled spacing
              if (optional)
                Text(
                  '(Optional)',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
            ],
          ),
          SizedBox(
              height: (5 / 800) *
                  MediaQuery.of(context).size.height), // Scaled spacing
          Container(
            width: (318 / 360) * deviceWidth,
            height: 0.2,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Color(0xFFF4F4F4), width: 0.2), // Correct border
              ),
            ),
          ),
          SizedBox(
              height: (5 / 800) *
                  MediaQuery.of(context).size.height), // Scaled spacing
          Container(
            width: (318 / 360) * deviceWidth,
            padding: EdgeInsets.all(4), // Adds padding inside the background
            decoration: BoxDecoration(
              color: Color(0xFF1E1E1E), // Background color
              borderRadius: BorderRadius.circular(4), // Optional border radius
            ),
            child: Text(
              sectionDescription,
              style: TextStyle(
                fontFamily: 'Poppins', // Set correct font
                fontSize: 10,
                fontWeight: FontWeight.w400,
                height: (15 / 10),
                color: Colors.white, // Ensure visibility on light background
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}