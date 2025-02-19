import 'package:flutter/material.dart';
import 'dart:ui'; // Required for ImageFilter

class ControlMobileWidget extends StatelessWidget {
  const ControlMobileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: (25 / 360) * MediaQuery.of(context).size.width, // Adjust width
        height:
            (25 / 800) * MediaQuery.of(context).size.height, // Adjust height
        padding: EdgeInsets.all((4.69 / 800) *
            MediaQuery.of(context).size.height), // Padding inside the container
        decoration: BoxDecoration(
          color: Color(0x55A6C44D), // Background color with opacity
          borderRadius: BorderRadius.circular((390.23 / 360) *
              MediaQuery.of(context).size.width), // Border radius
          border: Border.all(
            color: Color(0xFFB8FE22), // Border color (green)
            width: (0.78 / 360) *
                MediaQuery.of(context).size.width, // Border width
          ),
        ),
        child: Stack(
          children: [
            // Apply backdrop filter for the blur effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 19.53, sigmaY: 19.53), // Apply blur
                child: Container(
                    color: Colors
                        .transparent), // This is necessary to render the backdrop filter
              ),
            ),
            // Centered content inside the container
            Align(
              alignment: Alignment.center,
              child: Container(
                width: (15.63 / 360) *
                    MediaQuery.of(context).size.width, // Icon width
                height: (15.63 / 800) *
                    MediaQuery.of(context).size.height, // Icon height
                decoration: BoxDecoration(
                  color: Colors
                      .white, // Icon color (you can replace with the actual icon color)
                  borderRadius: BorderRadius.circular((390.23 / 360) *
                      MediaQuery.of(context)
                          .size
                          .width), // Icon's border radius
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
