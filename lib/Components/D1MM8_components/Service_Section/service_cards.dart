import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const ServiceCard({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  });

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: 180, // Fixed width
        height: 185, // Fixed height
        padding: EdgeInsets.symmetric(
          vertical: 20, // Fixed vertical padding
          horizontal: 16.67, // Fixed horizontal padding
        ),
        decoration: BoxDecoration(
          color: _isHovered
              ? const Color(0xFF002828) // Hover color
              : const Color(0xFF063434), // Default color
          borderRadius: BorderRadius.circular(10.42), // Fixed border radius
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Icon - Direct asset image
            SizedBox(
              width: 36, // Fixed width
              height: 36, // Fixed height
              child: Image.asset(
                widget.iconPath,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 12), // Fixed gap
            // Title and subtitle
            Expanded(
              child: Column(
                children: [
                  // Title
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontFamily: "Urbanist",
                      fontWeight: FontWeight.w700,
                      fontSize: 20, // Fixed font size
                      height: 1.2, // Standard line height
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5), // Fixed gap between title and subtitle
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 8, // Fixed font size
                      height: 1.5, // Standard line height
                      color: const Color(0xFFCCCCCC), // Text color from Figma
                    ),
                    textAlign: TextAlign.start,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
