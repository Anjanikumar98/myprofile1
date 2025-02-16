import 'package:flutter/material.dart';
import 'package:myprofile1/Components/D1MM8_components/Trainers_componet/tainer_model/trainer_model.dart';
import 'trainer_card.dart';

class TrainersSection extends StatelessWidget {
  const TrainersSection({Key? key}) : super(key: key);

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
      width: (412 / 360) * deviceWidth, // ✅ Responsive width
      height: (382.91 / 800) * deviceHeight, // ✅ Responsive height
      padding: EdgeInsets.fromLTRB(
        (20 / 360) * deviceWidth, // ✅ Responsive left padding
        (25 / 800) * deviceHeight, // ✅ Responsive top padding
        (20 / 360) * deviceWidth, // ✅ Responsive right padding
        (25 / 800) * deviceHeight, // ✅ Responsive bottom padding
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
            (11.44 / 360) * deviceWidth), // ✅ Responsive border radius
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: (25 / 800) * deviceHeight), // ✅ Responsive spacing

          /// **Heading Section**
          SizedBox(
            width: (372 / 360) * deviceWidth, // ✅ Responsive width
            height: (52 / 800) * deviceHeight, // ✅ Responsive height
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "Trainers",
                  style: TextStyle(
                    fontSize:
                        (48 / 360) * deviceWidth, // ✅ Responsive font size
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
                          fontSize: (24 / 360) *
                              deviceWidth, // ✅ Responsive font size
                          fontWeight: FontWeight.w700,
                          fontFamily: "Urbanist",
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: "Trainers",
                        style: TextStyle(
                          fontSize: (24 / 360) *
                              deviceWidth, // ✅ Responsive font size
                          fontWeight: FontWeight.w700,
                          fontFamily: "Urbanist",
                          color: Color(0xFF7ED957),
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

          SizedBox(height: (10 / 800) * deviceHeight), // ✅ Responsive spacing

          /// **Divider**
          Container(
            width: (372 / 360) * deviceWidth, // ✅ Responsive width
            height: (2.29 / 800) * deviceHeight, // ✅ Responsive height
            color: Colors.white.withOpacity(0.3),
          ),

          SizedBox(height: (10 / 800) * deviceHeight), // ✅ Responsive spacing

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
