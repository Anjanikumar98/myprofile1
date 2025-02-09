import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  final bool isActive;
  final bool isRightDirection;
  final VoidCallback? onTap;

  const ArrowButton({
    Key? key,
    required this.isActive,
    required this.isRightDirection,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onTap : null, // Disable tap if inactive
      child: Container(
        width: 40, // Increased size for better visibility
        height: 40,
        alignment: Alignment.center, // Center the icon properly
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.3),
            width: 1.5, // Slightly thicker border
          ),
        ),
        child: Transform.rotate(
          angle: isRightDirection ? 0 : 3.1416, // Rotate if left arrow
          child: Icon(
            Icons.arrow_forward_ios,
            color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
            size: 16, // Adjusted size to fit properly
          ),
        ),
      ),
    );
  }
}
