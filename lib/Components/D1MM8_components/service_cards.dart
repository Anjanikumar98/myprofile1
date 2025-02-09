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
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.teal[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            iconPath,
            height: 40,
            width: 40,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              debugPrint("Error loading icon: $iconPath"); // Debugging
              return const Icon(Icons.error, color: Colors.red, size: 40);
            },
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
              decoration: TextDecoration.none, // Removes underline
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14, // Smaller for better readability
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
