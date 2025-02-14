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
                  borderRadius:
                      BorderRadius.circular((8.28 / 360) * deviceWidth),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: (12.93 / 360) *
                          deviceWidth, // ✅ Responsive blur effect
                      sigmaY: (12.93 / 360) * deviceWidth,
                    ),
                    child: Container(
                      width: (191.72 / 360) * deviceWidth, // ✅ Responsive width
                      height:
                          (99.41 / 800) * deviceHeight, // ✅ Responsive height
                      color: Colors.white.withOpacity(0.3), // Adjust opacity
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// **Trainer Name**
                      Text(
                        trainer.name,
                        style: TextStyle(
                          fontFamily: "Barlow Semi Condensed",
                          fontWeight: FontWeight.w800, // Make it bolder
                          fontStyle: FontStyle.italic,
                          fontSize: (18 / 360) * deviceWidth, // Slightly larger
                          height: 1.2,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),

                      SizedBox(
                          height:
                              (2 / 800) * deviceHeight), // ✅ Responsive spacing

                      /// **Trainer Position**
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: (8 / 360) * deviceWidth, // More padding
                          vertical: (4 / 800) * deviceHeight,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB8FE22), // Primary Green
                          borderRadius:
                              BorderRadius.circular((4 / 360) * deviceWidth),
                        ),
                        child: Text(
                          trainer.position,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            fontSize: (10 / 360) *
                                deviceWidth, // ✅ Responsive font size
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),

                      SizedBox(
                          height:
                              (6 / 800) * deviceHeight), // ✅ Responsive spacing

                      /// **Trainer Description**
                      Text(
                        trainer.description,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          fontSize: (8 / 360) * deviceWidth,
                          height: 1.5,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        maxLines: 4, // Increased for better readability
                        overflow: TextOverflow.ellipsis,
                        softWrap: true, // Allows wrapping
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
