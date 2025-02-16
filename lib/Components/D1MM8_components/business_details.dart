import 'package:flutter/material.dart';
import 'dart:ui';
import 'business_card.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_image_header.png',
            fit: BoxFit.cover,
          ),
        ),

        // Dark Overlay for Readability
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF063434),
                  Color.fromRGBO(18, 18, 18,
                      0.35), // Increased opacity for better readability
                ],
                stops: [0.0, 0.35], // Adjusted gradient stop
              ),
            ),
          ),
        ),

        // Optional Blur Effect (if needed)
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 1.5, sigmaY: 1.5), // Reduced blur intensity
            child: Container(color: Colors.transparent),
          ),
        ),

        // Main Content
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(
            (15 / 360) * deviceWidth,
            (136 / 800) * deviceHeight,
            (15 / 360) * deviceWidth,
            (14.31 / 800) * deviceHeight,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: (16 / 800) * deviceHeight),
               BusinessCard(), // Ensure this widget doesn't add extra blur
            ],
          ),
        ),
      ],
    );
  }
}
