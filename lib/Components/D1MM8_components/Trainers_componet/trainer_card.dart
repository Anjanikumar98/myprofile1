import 'dart:ui'; // Import this for ImageFilter.blur
import 'package:flutter/material.dart';
import 'package:myprofile1/Components/D1MM8_components/Trainers_componet/tainer_model/trainer_model.dart';

class TrainerCard extends StatelessWidget {
  final TrainerModel trainer;

  const TrainerCard({super.key, required this.trainer});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: 200, // Fixed width
      height: 258.62, // Fixed height
      padding: EdgeInsets.all(4.14), // Fixed padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.34), // Fixed border radius
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent, // rgba(0, 0, 0, 0) 61.71%
            Colors.black.withOpacity(0.9), // rgba(0, 0, 0, 0.9) 82.86%
          ],
          stops: [0.6171, 0.8286], // Gradient stops at 61.71% and 82.86%
        ),
      ),
      child: Stack(
        children: [
          /// **Trainer Image**
          ClipRRect(
            borderRadius: BorderRadius.circular(10.34), // Fixed border radius
            child: Image.asset(
              trainer.imageUrl,
              width: 200, // Fixed width
              height: 258.62, // Fixed height
              fit: BoxFit.cover,
            ),
          ),

          /// **Blur Background + Details Section**
          Positioned(
            bottom: 8, // Fixed bottom position
            left: 4, // Fixed left position
            right: 4, // Fixed right position
            child: Stack(
              children: [
                /// **Blur Effect**
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(8.28), // Fixed border radius
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 12.93, // Set to match the provided blur value
                      sigmaY: 12.93, // Set to match the provided blur value
                    ),
                    child: Container(
                      width: 191.72, // Same width as Trainer Info Container
                      height: 99.41, // Same height as Trainer Info Container
                      color:
                          Colors.transparent, // Required to apply blur effect
                    ),
                  ),
                ),

                /// **Trainer Info**
                Container(
                  width: 191.72, // Fixed width
                  height: 99.41, // Fixed height
                  padding: EdgeInsets.all(4.14), // Fixed padding
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.28),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// **Trainer Name & Position**
                      SizedBox(
                        width: 183.45, // Fixed width
                        height: 39, // Fixed height
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
                                height: 24 / 20,
                                color: Colors.white,
                                decoration: TextDecoration.none,
                              ),
                            ),

                            /// **Trainer Position**
                            Text(
                              trainer.position,
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                height: 1.5,
                                letterSpacing: 0,
                                color: Color(0xFFB8FE22),
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 4), // ✅ Responsive spacing

                      /// **Trainer Description**
                      SizedBox(
                        width: 183.45, // Fixed width
                        height: 48, // Fixed height
                        child: Text(
                          trainer.description,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: 8,
                            height: 12 / 8, // Adjusted line height (12px/8px)
                            letterSpacing: 0,
                            color: Color(0xFFF4F4F4), // Off-white text color
                            decoration: TextDecoration.none,
                          ),
                          maxLines: 4, // Ensures proper truncation
                          overflow:
                              TextOverflow.ellipsis, // Handles text overflow
                          softWrap: true, // Allows wrapping
                        ),
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
