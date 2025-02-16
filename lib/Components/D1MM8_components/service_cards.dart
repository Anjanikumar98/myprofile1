import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  final String iconPath;
  final String title;
  final String subtitle;

  const ServiceCard({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

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
        width: (180 / 360) * deviceWidth,
        height: (185 / 800) * deviceHeight,
        padding: EdgeInsets.only(
          top: (27.78 / 800) * deviceHeight,
          right: (16.67 / 360) * deviceWidth,
          bottom: (27.78 / 800) * deviceHeight,
          left: (16.67 / 360) * deviceWidth,
        ),
        decoration: BoxDecoration(
          color: _isHovered
              ? const Color(0xFF095959)
              : const Color(0xFF063434), // Darker on hover
          borderRadius: BorderRadius.circular((10.42 / 800) * deviceHeight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon/Image
            Image.asset(
              widget.iconPath,
              height: (40 / 800) * deviceHeight,
              width: (40 / 360) * deviceWidth,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                debugPrint("Error loading icon: '${widget.iconPath}'");
                return Icon(Icons.error, color: Colors.red, size: (40 / 800) * deviceHeight);
              },
            ),
            SizedBox(height: (10 / 800) * deviceHeight),

            // Title
            Text(
              widget.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: (18 / 800) * deviceHeight,
                color: Colors.white,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: (5 / 800) * deviceHeight),

            // Subtitle
            Text(
              widget.subtitle,
              style: TextStyle(
                fontSize: (14 / 800) * deviceHeight,
                color: Colors.white70,
                decoration: TextDecoration.none,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Prevents text overflow
            ),
          ],
        ),
      ),
    );
  }
}
