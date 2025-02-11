import 'package:flutter/material.dart';

class FeaturesList extends StatelessWidget {
  final List<String> features;

  FeaturesList({required this.features, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 188.79,
      height: 177.05,
      padding: const EdgeInsets.symmetric(vertical: 4.48),
      decoration: BoxDecoration(
        color: Color(0xFF063434), // Dark greenish background
        borderRadius: BorderRadius.circular(7.84),
      ),
      child: Scrollbar(
        thickness: 3.0, // Thinner scrollbar
        radius: const Radius.circular(7.84),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 4.48, right: 1.68, bottom: 4.48, left: 5.6),
            child: Column(
              children: features
                  .map((feature) => _buildFeatureItem(feature))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String feature) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11.21),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Checkmark Circle
          Container(
            width: 11.2,
            height: 11.2,
            padding: const EdgeInsets.all(0.56),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Color(0xFFCBFB5E), width: 1.0),
            ),
            child: const Icon(
              Icons.check,
              size: 8.0,
              color: Color(0xFFCBFB5E),
            ),
          ),
          const SizedBox(width: 5.6),

          // Feature Text
          SizedBox(
            width: 153.5,
            child: Text(
              feature,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 8,
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
