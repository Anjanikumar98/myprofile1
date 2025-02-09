import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/global_components/buttons/primary_button.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Blur Overlay
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.86, sigmaY: 2.86), // Blur effect
            child: Container(
              color: Colors.black.withOpacity(0.25), // Overlay color
            ),
          ),
        ),

        // Main Content
        Container(
          width: 382,
          height: 599.7,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.72),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(255, 255, 255, 0.1),
                Color.fromRGBO(18, 18, 18, 0.25),
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
                children: const [
                  Expanded(
                      child: Divider(color: Color(0xFFB8FE22), thickness: 2)),
                  SizedBox(width: 10),
                  Text(
                    "Business Name",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB8FE22),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                      child: Divider(color: Color(0xFFB8FE22), thickness: 2)),
                ],
              ),
              const SizedBox(height: 10),
              // Tagline
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Tagline ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFFB8FE22), // Green color
                      ),
                    ),
                    TextSpan(
                      text: "Entered by Manager or Owner of ",
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                        color: Colors.white, // White color
                      ),
                    ),
                    TextSpan(
                      text: "Business",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.italic,
                        color: Color(0xFFB8FE22), // Green color
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
                  color: Color(0xFFF4F4F4),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              // Get Started Button (Primary Button)
              PrimaryButton(
                buttonWidth: 140,
                buttonHeight: 34,
                buttonText: 'Get Started',
                onTap: () {
                  // Handle button tap
                },
                isEnabled: true,
                icon: const Icon(Icons.arrow_forward,
                    size: 18, color: Colors.black), // ✅ Added icon
              ),
            ],
          ),
        ),
      ],
    );
  }
}
