import 'package:flutter/material.dart';

class PriceCardConstants {
  static const double borderRadius = 5.6;
  static const double blurSigma = 28.01;

  // 🔹 Fixed Divider Size
  static const double dividerWidth = 166.38;
  static const double dividerHeight = 4.48;

  // 🔹 Fixed Font Sizes from Figma
  static const double currencyFontSize = 14;
  static const double priceFontSize = 28;
  static const double perMonthFontSize = 12;
  static const double membershipNameFontSize = 16;

  // 🔹 Text Styles
  static const TextStyle membershipNameStyle = TextStyle(
    fontFamily: "Barlow Semi Condensed",
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    fontSize: membershipNameFontSize,
    color: Colors.white,
  );

  static const TextStyle priceStyle = TextStyle(
    fontFamily: "Barlow Semi Condensed",
    fontWeight: FontWeight.bold,
    fontSize: priceFontSize,
    color: Colors.white,
  );

  static const TextStyle perMonthStyle = TextStyle(
    fontFamily: "Barlow Semi Condensed",
    fontWeight: FontWeight.w500,
    fontSize: perMonthFontSize,
    color: Colors.white,
  );
}
