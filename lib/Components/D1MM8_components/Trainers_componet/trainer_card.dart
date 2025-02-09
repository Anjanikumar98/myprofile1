import 'dart:ui'; // Import this for ImageFilter.blur
import 'package:flutter/material.dart';
import 'package:myprofile1/Components/D1MM8_components/Trainers_componet/tainer_model/trainer_model.dart';

class TrainerCard extends StatelessWidget {
  final TrainerModel trainer;

  const TrainerCard({Key? key, required this.trainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 258.62,
      padding: const EdgeInsets.all(4.14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.34),
        color: Colors.black.withOpacity(0.6), // Dark background
      ),
      child: Stack(
        children: [
          /// **Trainer Image**
          ClipRRect(
            borderRadius: BorderRadius.circular(10.34),
            child: Image.network(
              trainer.imageUrl,
              width: 200,
              height: 258.62,
              fit: BoxFit.cover,
            ),
          ),

          /// **Blur Background + Details Section**
          Positioned(
            bottom: 8,
            left: 4,
            right: 4,
            child: Stack(
              children: [
                /// **Blur Effect**
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.28),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12.93, sigmaY: 12.93),
                    child: Container(
                      width: 191.72,
                      height: 99.41,
                      color: Colors.white.withOpacity(0.1), // Adjust opacity
                    ),
                  ),
                ),

                /// **Trainer Info**
                Container(
                  width: 191.72,
                  height: 99.41,
                  padding: const EdgeInsets.all(4.14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// **Trainer Name**
                      Text(
                        trainer.name,
                        style: const TextStyle(
                          fontFamily: "Barlow Semi Condensed",
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          height: 1.2, // Line height
                          color: Colors.white,
                          decoration: TextDecoration.none
                        ),
                      ),

                      const SizedBox(height: 2), // ⬅ Add spacing before the position text

                      /// **Trainer Position**
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB8FE22), // Primary Green
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          trainer.position,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.black,
                            decoration: TextDecoration.none
                          ),
                        ),
                      ),

                      const SizedBox(height: 6), // ⬅ Increase spacing to separate position from description

                      /// **Trainer Description**
                      Text(
                        trainer.description,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: 8,
                          height: 1.5, // Line height for better readability
                          color: Colors.white,
                          decoration: TextDecoration.none
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
