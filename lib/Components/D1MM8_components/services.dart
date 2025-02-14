import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/D1MM8_components/service_cards.dart';
import 'arrows_component.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 398.55,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11.44),
        image: DecorationImage(
          image: AssetImage("assets/images/background_image_services.png"),
          fit: BoxFit.cover,
          opacity: 0.1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeading(),
          SizedBox(
            height: 8.5,
          ),
          _buildDivider(),
          SizedBox(
            height: 8.5,
          ),
          _buildServiceList(),
          SizedBox(
            height: 8.5,
          ),
          _buildNavigationArrows(isLeftActive: true, isRightActive: false),
        ],
      ),
    );
  }

  Widget _buildHeading() {
    return SizedBox(
      width: 326, // Matches design width
      height: 84, // Slightly increased for better spacing
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          // Background faded "Services" text
          Positioned(
            top: -5, // Adjusted for better centering
            child: Text(
              "Services",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 52, // Large faded effect
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
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    TextSpan(
                      text: "Services",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFA7FF46), // Green color from Figma
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6), // Adjusted spacing
              // Description text
              SizedBox(
                width: 286,
                child: Text(
                  "Provide a concise description of your offerings, highlighting key features and benefits.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10, // Slightly increased for readability
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    letterSpacing: 0,
                    color: Colors.white70,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(height: 6), // Space before the divider
              // Single Divider Below
              const Divider(
                color: Colors.white54,
                thickness: 1.5,
                indent: 50,
                endIndent: 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 326.22,
      height: 2.29,
      margin: EdgeInsets.symmetric(vertical: 8.58),
      color: Colors.white24,
    );
  }

  Widget _buildServiceList() {
    List<Map<String, String>> services = [
      {
        "iconPath": "assets/images/icons/heart_beat.png",
        "title": "Heart Health",
        "subtitle":
            "Boost your cardiovascular endurance with heart-focused fitness plans."
      },
      {
        "iconPath": "assets/images/icons/locker.png",
        "title": "Locker Services",
        "subtitle":
            "Secure your belongings with our personal locker facilities."
      },
      {
        "iconPath": "assets/images/icons/pills.png",
        "title": "Supplement Guidance",
        "subtitle":
            "Expert advice on supplements to support your fitness journey."
      },
      {
        "iconPath": "assets/images/icons/sit_up.png",
        "title": "Core Training",
        "subtitle": "Strengthen your core with targeted abdominal exercises."
      },
      {
        "iconPath": "assets/images/icons/stationary_bike.png",
        "title": "Cycling",
        "subtitle":
            "Burn calories and improve endurance with indoor cycling workouts."
      },
      {
        "iconPath": "assets/images/icons/weightlifting.png",
        "title": "Strength Training",
        "subtitle":
            "Build muscle and improve strength with weightlifting programs."
      },
      {
        "iconPath": "assets/images/icons/yoga.png",
        "title": "Yoga & Mindfulness",
        "subtitle":
            "Enhance flexibility and reduce stress with guided yoga sessions."
      }
    ];

    return SizedBox(
      height: 200, // Prevents overflow and keeps proper spacing
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10), // Spacing between cards
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

  Widget _buildNavigationArrows(
      {required bool isLeftActive,
      required bool isRightActive,
      VoidCallback? onLeftTap,
      VoidCallback? onRightTap}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ArrowButton(
            isActive: isLeftActive,
            isRightDirection: false,
            onTap: onLeftTap,
          ),
          SizedBox(width: 20),
          ArrowButton(
            isActive: isRightActive,
            isRightDirection: true,
            onTap: onRightTap,
          ),
        ],
      ),
    );
  }
}