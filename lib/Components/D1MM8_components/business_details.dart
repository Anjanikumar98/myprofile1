import 'package:flutter/material.dart';
import 'business_card.dart';

class BusinessDetails extends StatelessWidget {
  const BusinessDetails({super.key});

  @override
  Widget build(BuildContext context) {
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
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF063434),
                  Color.fromRGBO(18, 18, 18, 0.25),
                ],
                stops: [0.0, 0.314],
              ),
              color: Colors.black.withOpacity(0.5), // ✅ Ensures dark overlay
            ),
          ),
        ),

        // Main Content
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(15, 136, 15, 14.31),
          child: Column(
            children: const [
              SizedBox(height: 16),
              BusinessCard(),
            ],
          ),
        ),
      ],
    );
  }
}
