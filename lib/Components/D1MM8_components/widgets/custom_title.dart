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
  final String backgroundText;
  final List<TextSegment> frontTextSegments;
  final Color backgroundColor;
  final double fontSize;
  final TextAlign textAlign;

  const CustomTitle({
    super.key,
    required this.backgroundText,
    required this.frontTextSegments,
    this.backgroundColor = Colors.white,
    this.fontSize = 24,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    final TextStyle commonStyle = GoogleFonts.urbanist(
      fontSize: fontSize, // Fixed font size
      fontWeight: FontWeight.w700,
      height: 1.2, // Correct line-height
      letterSpacing: 0,
    );

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 286.11, // Fixed width for the entire text box
        height: 52, // Fixed height for the text box
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Text (Plans)
            Positioned(
              top: 2.86, // Adjusted gap for the background text
              child: SizedBox(
                width: 286.11, // Ensures text fits within this width
                child: FittedBox(
                  fit: BoxFit.scaleDown, // Ensures the text scales down if too long
                  child: Text(
                    backgroundText, // "Plans"
                    style: TextStyle(
                      fontFamily: "Inter", // Updated font family
                      fontWeight: FontWeight.w300, // Font weight 300
                      fontSize: 40, // Font size 40px
                      height: 48.41 / 40, // Adjusted line height ratio
                      letterSpacing: 0, // No letter spacing
                      color: const Color(0xFFFFFFFF).withOpacity(0.3), // Transparent text color
                    ),
                    textAlign: textAlign,
                  ),
                ),
              ),
            ),
            // Foreground Text
            Positioned(
              top: 2.29, // Adjusted gap for the foreground text
              child: SizedBox(
                width: 286.11, // Ensures text fits within this width
                child: FittedBox(
                  fit: BoxFit.scaleDown, // Scales down if text is too long
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: frontTextSegments.map((segment) {
                      return Text(
                        segment.text,
                        style: commonStyle.copyWith(color: segment.color),
                        textAlign: textAlign,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
