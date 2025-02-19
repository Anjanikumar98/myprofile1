import 'package:flutter/material.dart';

class MembershipCardTheme {
  static const Color recommendedBorderColor = Color(0xFFB8FE22);
  static const Color defaultBorderColor = Color(0xFF376C7F);
  static const Color featureBackgroundColor = Color(0xFF063434);
  static const Color cardBackgroundColor = Color(0xFF1A1A1A);
  static const Color textColor = Colors.white;

  static const double borderRadius = 5.6;
  static const double featureContainerRadius = 6.0;

  static const double cardPadding = 5.6;
  static const double cardMargin = 5.6;
  static const double featureContainerPaddingValue = 8.0; // Renamed for simplicity

  static Color borderColor(bool isRecommended) =>
      isRecommended ? recommendedBorderColor : defaultBorderColor;
}
