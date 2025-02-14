import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: (200 / 360) * deviceWidth, // Responsive width
      padding: EdgeInsets.all((16 / 800) * deviceHeight), // Responsive padding
      decoration: BoxDecoration(
        color: const Color(0xFF063434), // Consistent dark teal color
        borderRadius: BorderRadius.circular((12 / 800) * deviceHeight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon/Image
          Image.asset(
            iconPath,
            height: (40 / 800) * deviceHeight,
            width: (40 / 360) * deviceWidth,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              debugPrint("Error loading icon: $iconPath");
              return Icon(Icons.error,
                  color: Colors.red, size: (40 / 800) * deviceHeight);
            },
          ),
          SizedBox(height: (10 / 800) * deviceHeight),

          // Title
          Text(
            title,
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
            subtitle,
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
    );
  }
}
