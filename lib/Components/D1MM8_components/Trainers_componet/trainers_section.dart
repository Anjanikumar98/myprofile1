import 'package:flutter/material.dart';
import 'package:myprofile1/Components/D1MM8_components/Trainers_componet/tainer_model/trainer_model.dart';
import 'trainer_card.dart';

class TrainersSection extends StatelessWidget {
  const TrainersSection({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    final List<TrainerModel> trainers = [
      TrainerModel(
        imageUrl: "assets/images/trainee_image.jpg",
        name: "John Deo",
        position: "Head Coach",
        description:
            "With over 5 years of experience, I specialize in strength training, weight management, and injury rehabilitation.",
      ),
      TrainerModel(
        imageUrl: "assets/images/trainee_image.jpg",
        name: "John Deo",
        position: "Head Coach",
        description:
            "With over 5 years of experience, I specialize in strength training, weight management, and injury rehabilitation.",
      ),
      TrainerModel(
        imageUrl: "assets/images/trainee_image.jpg",
        name: "John Deo",
        position: "Head Coach",
        description:
            "With over 5 years of experience, I specialize in strength training, weight management, and injury rehabilitation.",
      ),
    ];

    return Container(
      width: 412, // Fixed width
      height: 382.91, // Fixed height
      padding: const EdgeInsets.fromLTRB(
        20, // Fixed left padding
        25, // Fixed top padding
        20, // Fixed right padding
        25, // Fixed bottom padding
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(11.44), // Fixed border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25), // ✅ Responsive spacing

          /// **Heading Section**
          SizedBox(
            width: 372, // Fixed width
            height: 52, // Fixed height
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "Trainers",
                  style: TextStyle(
                    fontSize: 48, // Fixed font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(0.1),
                    letterSpacing: 2,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Meet your ",
                        style: TextStyle(
                          fontSize: 24, // Fixed font size
                          fontWeight: FontWeight.w700,
                          fontFamily: "Urbanist",
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: "Trainers",
                        style: TextStyle(
                          fontSize: 24, // Fixed font size
                          fontWeight: FontWeight.w700,
                          fontFamily: "Urbanist",
                          color: Color(0xFFB8FE22),
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          SizedBox(height: 10), // ✅ Responsive spacing

          /// **Divider**
          Container(
            width: 366.28, // Fixed width
            height: 0.43, // Border height (border width)
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(
                    0xFF55A6C4), // Transparent blue color, adjust alpha as needed
                width: 0.43, // Border width
              ),
            ),
            alignment: Alignment.center, // Center alignment
          ),

          SizedBox(height: 10), // ✅ Responsive spacing

          /// **Trainers Mobile Section**
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: trainers.map((trainer) {
                  return Padding(
                    padding: EdgeInsets.only(
                        right:
                            (10 / 360) * deviceWidth), // ✅ Responsive padding
                    child: TrainerCard(trainer: trainer),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
