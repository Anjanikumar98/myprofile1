import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: (382 / 360) * deviceWidth,
      height: (599.7 / 800) * deviceHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular((5.72 / 360) * deviceWidth),
        child: Stack(
          children: [
            // Background Blur Overlay
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                child: Container(
                  color: Colors.black.withOpacity(0.25),
                ),
              ),
            ),

            // Main Content
            Positioned.fill(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: (15 / 360) * deviceWidth),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular((5.72 / 360) * deviceWidth),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(18, 18, 18, 0.25),
                      Color.fromRGBO(255, 255, 255, 0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Business Name Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Flexible(
                            child: Divider(
                                color: Color(0xFFB8FE22), thickness: 2)),
                        SizedBox(width: (8 / 360) * deviceWidth),
                        Text(
                          "Business Name",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontSize: (24 / 360) * deviceWidth,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFFB8FE22),
                                  ),
                        ),
                        SizedBox(width: (8 / 360) * deviceWidth),
                        const Flexible(
                            child: Divider(
                                color: Color(0xFFB8FE22), thickness: 2)),
                      ],
                    ),
                    SizedBox(height: (15 / 800) * deviceHeight),

                    // Tagline
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: (20 / 360) * deviceWidth),
                        children: const [
                          TextSpan(
                            text: "Tagline ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFFB8FE22),
                            ),
                          ),
                          TextSpan(
                            text: "Entered by Manager or Owner of ",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "Business",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.italic,
                              color: Color(0xFFB8FE22),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: (15 / 800) * deviceHeight),

                    // Description
                    Text(
                      "At [Business Name], we believe in empowering individuals to lead healthier and more fulfilling lives. Our tailored programs and state-of-the-art facilities are designed to help you achieve your fitness goals.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: (14 / 360) * deviceWidth,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Poppins',
                        color: const Color(0xFFF4F4F4),
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: (20 / 800) * deviceHeight),

                    // Get Started Button (Primary Button)
                    PrimaryButton(
                      buttonWidth: (148 / 360) * deviceWidth,
                      buttonHeight: (42 / 800) * deviceHeight,
                      buttonText: 'Get Started',
                      onTap: () {},
                      isEnabled: true,
                      textColor: Colors.white,
                      borderColor: const Color(0xFFB8FE22),
                      hasIcon: true,
                      icon: const Icon(Icons.arrow_forward,
                          size: 18, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
