import 'package:flutter/material.dart';

class BusinessInfoTile extends StatelessWidget {
  final String businessName;
  final double rating;
  final String city;
  final String state;
  final String businessType;

  const BusinessInfoTile({
    Key? key,
    required this.businessName,
    required this.rating,
    required this.city,
    required this.state,
    required this.businessType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Takes full available width
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circular Icon (Globe)
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: Colors.limeAccent,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.public, color: Colors.black, size: 22),
          ),
          const SizedBox(width: 12),

          // Information Section (Flexible to prevent overflow)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Business Name
                Text(
                  businessName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
                  maxLines: 1,
                  softWrap: true,
                ),
                const SizedBox(height: 4),

                // Rating | Location | Business Type
                Row(
                  children: [
                    // Rating
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.star, size: 14, color: Colors.blueAccent),
                    const SizedBox(width: 12),

                    // Location
                    const Icon(Icons.location_on, size: 14, color: Colors.white70),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        "$city, $state",
                        style: const TextStyle(fontSize: 14, color: Colors.white70),
                        overflow: TextOverflow.ellipsis, // Prevents overflow
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),

                    // Separator & Business Type
                    const SizedBox(width: 12),
                    const Text("•", style: TextStyle(fontSize: 14, color: Colors.limeAccent)),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        businessType,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.limeAccent),
                        overflow: TextOverflow.ellipsis, // Prevents overflow
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
