import 'dart:ui'; // Import this for ImageFilter.blur
import 'package:flutter/material.dart';
import 'package:myprofile1/Components/D1MM8_components/Trainers_componet/tainer_model/trainer_model.dart';

class TrainerCard extends StatelessWidget {
  final TrainerModel trainer;

  const TrainerCard({Key? key, required this.trainer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: (200 / 360) * deviceWidth, // ✅ Responsive width
      height: (258.62 / 800) * deviceHeight, // ✅ Responsive height
      padding:
          EdgeInsets.all((4.14 / 360) * deviceWidth), // ✅ Responsive padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            (10.34 / 360) * deviceWidth), // ✅ Responsive border radius
        color: Colors.black.withOpacity(0.6), // Dark background
      ),
      child: Stack(
        children: [
          /// **Trainer Image**
          ClipRRect(
            borderRadius: BorderRadius.circular((10.34 / 360) * deviceWidth),
            child: Image.network(
              trainer.imageUrl,
              width: (200 / 360) * deviceWidth, // ✅ Responsive width
              height: (258.62 / 800) * deviceHeight, // ✅ Responsive height
              fit: BoxFit.cover,
            ),
          ),

          /// **Blur Background + Details Section**
          Positioned(
            bottom: (8 / 800) * deviceHeight, // ✅ Responsive position
            left: (4 / 360) * deviceWidth,
            right: (4 / 360) * deviceWidth,
            child: Stack(
              children: [
                /// **Blur Effect**
                ClipRRect(
                  borderRadius: BorderRadius.circular((8.28 / 360) * deviceWidth),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: (6.5 / 360) * deviceWidth, // 🔽 Reduced blur effect
                      sigmaY: (6.5 / 360) * deviceWidth,
                    ),
                    child: Container(
                      width: (191.72 / 360) * deviceWidth,
                      height: (99.41 / 800) * deviceHeight,
                      color: Colors.white.withOpacity(0.3), // ✅ Adjust opacity if needed
                    ),
                  ),
                ),

                /// **Trainer Info**
                Container(
                  width: (191.72 / 360) * deviceWidth, // ✅ Responsive width
                  height: (99.41 / 800) * deviceHeight, // ✅ Responsive height
                  padding: EdgeInsets.all(
                      (4.14 / 360) * deviceWidth), // ✅ Responsive padding
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular((8.28 / 360) * deviceWidth),
                  ),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// **Trainer Name**
                        SizedBox(
                          width: (183.4482879638672 / 360) * deviceWidth, // ✅ Set width for both
                          height: (39 / 800) * deviceHeight, // ✅ Ensure height is 39px
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// **Trainer Name**
                              Text(
                                trainer.name,
                                style: TextStyle(
                                  fontFamily: "Barlow Semi Condensed",
                                  fontWeight: FontWeight.w700, // ✅ Bolder as per design
                                  fontStyle: FontStyle.italic,
                                  fontSize: (18 / 360) * deviceWidth, // ✅ Matches design
                                  height: 1.2, // ✅ Correct line-height
                                  color: Colors.white, // ✅ Matches design
                                  decoration: TextDecoration.none,
                                ),
                              ),

                              SizedBox(height: (2 / 800) * deviceHeight), // ✅ Responsive spacing

                              /// **Trainer Position**
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: (8 / 360) * deviceWidth,
                                  vertical: (4 / 800) * deviceHeight,
                                ),
                                child: Text(
                                  trainer.position,
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: (10 / 360) * deviceWidth, // ✅ Matches design
                                    height: 1.5, // ✅ Matches line-height (15px)
                                    letterSpacing: 0, // ✅ No letter spacing
                                    color: Color(0xFFB8FE22),
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                            height: (6 / 800) *
                                deviceHeight), // ✅ Responsive spacing

                        /// **Trainer Description**
                        SizedBox(
                          width: (183.4482879638672 / 360) *
                              deviceWidth, // ✅ Responsive width
                          height: (48 / 800) *
                              deviceHeight, // ✅ Ensures proper height
                          child: Text(
                            trainer.description,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: (8 / 360) *
                                  deviceWidth, // ✅ Matches design (8px)
                              height: 1.5, // ✅ Matches line-height (12px)
                              letterSpacing: 0, // ✅ No letter spacing
                              color: Color(
                                  0xFFF4F4F4), // ✅ Matches Off-White text color
                              decoration: TextDecoration.none,
                            ),
                            maxLines: 4, // ✅ Ensures proper truncation
                            overflow: TextOverflow.ellipsis, // ✅ Handles text overflow
                            softWrap: true, // ✅ Allows wrapping
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
