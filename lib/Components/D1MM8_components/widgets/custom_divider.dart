import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color? color; // Nullable to allow theme-based defaults

  const CustomDivider({
    this.width = 188.79, // Default width
    this.height = 8.96, // Default height
    this.padding = const EdgeInsets.symmetric(
        vertical: 4.48, horizontal: 11.21), // Default padding
    this.color, // Nullable for better theme adaptability
    super.key, // Placed last for readability
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ??
              Theme.of(context).dividerColor, // Uses theme color if null
          borderRadius:
              BorderRadius.circular(height / 2), // Ensures rounded edges
        ),
      ),
    );
  }
}
