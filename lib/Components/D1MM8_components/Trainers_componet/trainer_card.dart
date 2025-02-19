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
                  borderRadius: BorderRadius.circular(8.28), // Fixed border radius
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 12.93, // Set to match the provided blur value
                      sigmaY: 12.93, // Set to match the provided blur value
                    ),
                  ),
                ),

                /// **Trainer Info**
                Container(
                  width: 191.72, // Fixed width
                  height: 99.41, // Fixed height
                  padding: EdgeInsets.all(4.14), // Fixed padding
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8.28)),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// **Trainer Name**
                        SizedBox(
                          width: 183.45, // Fixed width
                          height: 39, // Fixed height
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// **Trainer Name**
                              Text(
                                trainer.name,
                                style: TextStyle(
                                  fontFamily: "Barlow Semi Condensed",
                                  fontWeight: FontWeight.w700, // Bolder as per design
                                  fontStyle: FontStyle.italic,
                                  fontSize: 20, // Corrected font size (matches design)
                                  height: 24 / 20, // Correct line-height (matches design)
                                  color: Colors.white, // Matches design color
                                  decoration: TextDecoration.none,
                                ),
                              ),

                              /// **Trainer Position**
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8, // Fixed horizontal padding
                                  vertical: 4, // Fixed vertical padding
                                ),
                                child: Text(
                                  trainer.position,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10, // Fixed font size (matches design)
                                    height: 1.5, // Correct line-height (matches design)
                                    letterSpacing: 0, // No letter spacing
                                    color: Color(0xFFB8FE22), // Matches design color
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              )
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
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 8, // Fixed font size
                              height: 12 / 8, // Adjusted line height (12px/8px)
                              letterSpacing: 0, // No letter spacing
                              color: Color(0xFFF4F4F4), // Off-white text color
                              decoration: TextDecoration.none,
                            ),
                            maxLines: 4, // Ensures proper truncation
                            overflow: TextOverflow.ellipsis, // Handles text overflow
                            softWrap: true, // Allows wrapping
                          ),
                        )
                      ],
                    ),
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
