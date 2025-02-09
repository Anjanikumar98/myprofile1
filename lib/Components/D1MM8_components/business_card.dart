import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 382,
      height: 599.7,
      child: Stack(
        children: [
          // Background Blur Overlay
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.86, sigmaY: 2.86),
              child: Container(
                color: Colors.black.withOpacity(0.25),
              ),
            ),
          ),

          // Main Content
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.72),
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
                      const Expanded(
                          child:
                              Divider(color: Color(0xFFB8FE22), thickness: 2)),
                      const SizedBox(width: 8),
                      Text(
                        "Business Name",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFB8FE22),
                            ),
                      ),
                      const SizedBox(width: 8),
                      const Expanded(
                          child:
                              Divider(color: Color(0xFFB8FE22), thickness: 2)),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Tagline
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(fontFamily: 'Poppins'),
                      children: [
                        TextSpan(
                          text: "Tagline ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFFB8FE22),
                          ),
                        ),
                        TextSpan(
                          text: "Entered by Manager or Owner of ",
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: "Business",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFFB8FE22),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Description
                  const Text(
                    "At [Business Name], we believe in empowering individuals to lead healthier and more fulfilling lives. Our tailored programs and state-of-the-art facilities are designed to help you achieve your fitness goals.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      color: Color(0xFFF4F4F4),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Get Started Button (Primary Button)
                  PrimaryButton(
                    buttonWidth: 148,
                    buttonHeight: 42,
                    buttonText: 'Get Started',
                    onTap: () {},
                    isEnabled: true,
                    borderColor: const Color(0xFFB8FE22),
                    icon: const Icon(Icons.arrow_forward,
                        size: 18, color: Colors.white), // Adjusted color
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}