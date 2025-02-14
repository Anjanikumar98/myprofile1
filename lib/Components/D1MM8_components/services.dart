import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/D1MM8_components/service_cards.dart';
import 'arrows_component.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: (412 / 360) * deviceWidth,
      height: (398.55 / 800) * deviceHeight,
      padding: EdgeInsets.symmetric(horizontal: (20 / 360) * deviceWidth),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((11.44 / 360) * deviceWidth),
        image: const DecorationImage(
          image: AssetImage("assets/images/background_image_services.png"),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeading(context),
          SizedBox(height: (8.5 / 800) * deviceHeight),
          _buildDivider(context),
          SizedBox(height: (8.5 / 800) * deviceHeight),
          _buildServiceList(context),
          SizedBox(height: (8.5 / 800) * deviceHeight),
          _buildNavigationArrows(context,
              isLeftActive: true, isRightActive: false),
        ],
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: (326 / 360) * deviceWidth, // Responsive width
      height: (84 / 800) * deviceHeight, // Responsive height
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // Background faded "Services" text
          Positioned(
            top: (-5 / 800) * deviceHeight, // Adjusted for better centering
            child: Text(
              "Services",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: (52 / 360) * deviceWidth, // Responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.1),
                letterSpacing: 0,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Foreground heading text
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Explore our ",
                      style: TextStyle(
                        fontSize: (24 / 360) * deviceWidth,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "Services",
                      style: TextStyle(
                        fontSize: (24 / 360) * deviceWidth,
                        fontWeight: FontWeight.bold,
                        color:
                            const Color(0xFFA7FF46), // Green color from Figma
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: (6 / 800) * deviceHeight), // Adjusted spacing
              // Description text
              SizedBox(
                width: (286 / 360) * deviceWidth,
                child: Text(
                  "Provide a concise description of your offerings, highlighting key features and benefits.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: (10 / 360) * deviceWidth, // Responsive font size
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    letterSpacing: 0,
                    color: Colors.white70,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              SizedBox(
                  height: (6 / 800) * deviceHeight), // Space before the divider
              // Single Divider Below
              Divider(
                color: Colors.white54,
                thickness: (1.5 / 360) * deviceWidth,
                indent: (50 / 360) * deviceWidth,
                endIndent: (50 / 360) * deviceWidth,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      width: (326.22 / 360) * deviceWidth,
      height: 2,
      margin: EdgeInsets.symmetric(vertical: 8),
      color: Colors.white24,
    );
  }

  Widget _buildServiceList(BuildContext context) {
    List<Map<String, String>> services = [
      {
        "iconPath": "assets/images/icons/heart_beat.png",
        "title": "Heart Health",
        "subtitle": "Boost cardiovascular endurance."
      },
      {
        "iconPath": "assets/images/icons/locker.png",
        "title": "Locker Services",
        "subtitle": "Secure your belongings."
      },
      {
        "iconPath": "assets/images/icons/pills.png",
        "title": "Supplement Guidance",
        "subtitle": "Expert advice on supplements."
      },
      {
        "iconPath": "assets/images/icons/sit_up.png",
        "title": "Core Training",
        "subtitle": "Strengthen your core."
      },
      {
        "iconPath": "assets/images/icons/stationary_bike.png",
        "title": "Cycling",
        "subtitle": "Burn calories with cycling."
      },
      {
        "iconPath": "assets/images/icons/weightlifting.png",
        "title": "Strength Training",
        "subtitle": "Improve strength with weights."
      },
      {
        "iconPath": "assets/images/icons/yoga.png",
        "title": "Yoga & Mindfulness",
        "subtitle": "Enhance flexibility and relax."
      },
    ];

    return SizedBox(
      height: (200 / 800) * MediaQuery.of(context).size.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right: (10 / 360) * MediaQuery.of(context).size.width),
            child: ServiceCard(
              iconPath: services[index]["iconPath"]!,
              title: services[index]["title"]!,
              subtitle: services[index]["subtitle"]!,
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavigationArrows(BuildContext context,
      {required bool isLeftActive, required bool isRightActive}) {
    return Padding(
      padding:
          EdgeInsets.only(top: (10 / 800) * MediaQuery.of(context).size.height),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ArrowButton(isActive: isLeftActive, isRightDirection: false),
          SizedBox(width: (20 / 360) * MediaQuery.of(context).size.width),
          ArrowButton(isActive: isRightActive, isRightDirection: true),
        ],
      ),
    );
  }
}
