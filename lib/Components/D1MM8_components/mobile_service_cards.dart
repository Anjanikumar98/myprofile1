import 'package:flutter/material.dart';

class MobileServiceCard extends StatefulWidget {
  final double width;
  final double height;
  final String title;
  final String description;
  final IconData icon;

  const MobileServiceCard({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  _MobileServiceCardState createState() => _MobileServiceCardState();
}

class _MobileServiceCardState extends State<MobileServiceCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: widget.width,
        height: widget.height,
        padding: const EdgeInsets.symmetric(vertical: 27.78, horizontal: 16.67),
        decoration: BoxDecoration(
          color: isHovered ? const Color(0xFF055252) : const Color(0xFF063434), // Hover effect color change
          borderRadius: BorderRadius.circular(10.42),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.icon, color: Colors.lightGreen, size: 28),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
