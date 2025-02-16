import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSegment {
  final String text;
  final Color color;

  const TextSegment({
    required this.text,
    required this.color,
  });
}

class CustomTitle extends StatelessWidget {
  final double width;
  final double height;
  final double gap;
  final String backgroundText;
  final List<TextSegment> frontTextSegments;
  final Color backgroundColor;
  final double fontSize;
  final TextAlign textAlign;

  const CustomTitle({
    Key? key,
    this.width = 372,
    this.height = 52,
    this.gap = 2.86,
    required this.backgroundText,
    required this.frontTextSegments,
    this.backgroundColor = Colors.white,
    this.fontSize = 24,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle commonStyle = GoogleFonts.urbanist(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      height: 1.2, // 28.8px line height (24 * 1.2 = 28.8)
      letterSpacing: 0,
    );

    return SizedBox(
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Background text
          Text(
            backgroundText,
            style: commonStyle.copyWith(
              color: backgroundColor,
            ),
            textAlign: textAlign,
          ),
          SizedBox(width: gap),
          // Front text with multiple colors
          Row(
            mainAxisSize: MainAxisSize.min,
            children: frontTextSegments.map((segment) {
              return Text(
                segment.text,
                style: commonStyle.copyWith(
                  color: segment.color,
                ),
                textAlign: textAlign,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}