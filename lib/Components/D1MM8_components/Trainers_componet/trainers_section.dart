import 'package:flutter/material.dart';
import 'package:myprofile1/Components/D1MM8_components/Trainers_componet/tainer_model/trainer_model.dart';
import 'trainer_card.dart';

class TrainersSection extends StatelessWidget {
  const TrainersSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<TrainerModel> trainers = [
      TrainerModel(
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/87a4/dfe3/665efff43724044ed11bba723982ebe3?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PQD8ZWtSYoQi~PvliN2~~9PfitbgzdHXJ6gAxQhd6e-hc~RB1gyloaiFW4jv9iR4TE0Ox5cMmZ4VC1sQ85NQdsWhtwByZA3CfVND4sDsDwHJpn3dzM3RwIF0mpsY56Gjv918mtbjJxesxSXknEhcwfjwVzaGWrg2fqMXDPlStPSrjRGNK8pNTEX~XLXrQmjf5bVyZMp~hjsLc--t7LewsPg1ybNxGenI9WLheKHmr97xMxOFG6LesUz2Lap~w7LlWcphHhPoCp5b0AgfGH2EHLhGc3nBj2mc0LUIsF0FiOlnRvCK6pLhIBeroiuaHschPF5Bd8QWDw1EWHLhWVsVeQ__",
        name: "John Deo",
        position: "Head Coach",
        description:
            "With over 5 years of experience, I specialize in strength training, weight management, and injury rehabilitation.",
      ),
      TrainerModel(
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/87a4/dfe3/665efff43724044ed11bba723982ebe3?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PQD8ZWtSYoQi~PvliN2~~9PfitbgzdHXJ6gAxQhd6e-hc~RB1gyloaiFW4jv9iR4TE0Ox5cMmZ4VC1sQ85NQdsWhtwByZA3CfVND4sDsDwHJpn3dzM3RwIF0mpsY56Gjv918mtbjJxesxSXknEhcwfjwVzaGWrg2fqMXDPlStPSrjRGNK8pNTEX~XLXrQmjf5bVyZMp~hjsLc--t7LewsPg1ybNxGenI9WLheKHmr97xMxOFG6LesUz2Lap~w7LlWcphHhPoCp5b0AgfGH2EHLhGc3nBj2mc0LUIsF0FiOlnRvCK6pLhIBeroiuaHschPF5Bd8QWDw1EWHLhWVsVeQ__",
        name: "John Deo",
        position: "Head Coach",
        description:
            "With over 5 years of experience, I specialize in strength training, weight management, and injury rehabilitation.",
      ),
      TrainerModel(
        imageUrl:
            "https://s3-alpha-sig.figma.com/img/87a4/dfe3/665efff43724044ed11bba723982ebe3?Expires=1739750400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PQD8ZWtSYoQi~PvliN2~~9PfitbgzdHXJ6gAxQhd6e-hc~RB1gyloaiFW4jv9iR4TE0Ox5cMmZ4VC1sQ85NQdsWhtwByZA3CfVND4sDsDwHJpn3dzM3RwIF0mpsY56Gjv918mtbjJxesxSXknEhcwfjwVzaGWrg2fqMXDPlStPSrjRGNK8pNTEX~XLXrQmjf5bVyZMp~hjsLc--t7LewsPg1ybNxGenI9WLheKHmr97xMxOFG6LesUz2Lap~w7LlWcphHhPoCp5b0AgfGH2EHLhGc3nBj2mc0LUIsF0FiOlnRvCK6pLhIBeroiuaHschPF5Bd8QWDw1EWHLhWVsVeQ__",
        name: "John Deo",
        position: "Head Coach",
        description:
            "With over 5 years of experience, I specialize in strength training, weight management, and injury rehabilitation.",
      ),
    ];

    return Container(
      width: 412,
      height: 382.91,
      padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(11.44),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25,),
          /// **Heading Section**
          SizedBox(
            width: 372,
            height: 52,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "Trainers",
                  style: TextStyle(
                    fontSize: 48,
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
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Urbanist",
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      TextSpan(
                        text: "Trainers",
                        style: TextStyle(
                          fontSize: 24,
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

          const SizedBox(height: 10), // Spacing

          /// **Divider**
          Container(
            width: 372,
            height: 2.29,
            color: Colors.white.withOpacity(0.3),
          ),

          const SizedBox(height: 10), // Spacing

          /// **Trainers Mobile Section**
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: trainers.map((trainer) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
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

