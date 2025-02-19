import 'package:flutter/material.dart';

class PriceCardTheme {
  static const Color sessionBasedColor = Color(0xFFB8FE22);
  static const Color periodBasedColor = Color(0xFF55A6C4);
  static const Color backgroundColor = Color(0x55A6C44D);

  static Color getPrimaryColor(String planType) {
    return planType == "Session-Based Plan"
        ? sessionBasedColor
        : periodBasedColor;
  }
}
