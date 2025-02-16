import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myprofile1/Components/D1MM8_components/service_cards.dart';
import 'arrows_component.dart';

class Services extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (20 / 412) * deviceWidth, // Outer padding (left & right)
      ),
      child: Container(
        width: (412 / 360) * deviceWidth,
        height: (398.55 / 800) * deviceHeight,
        padding: EdgeInsets.symmetric(
            horizontal: (22.89 / 412) * deviceWidth,
            vertical: (28.61 / 800) * deviceHeight),
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
            _buildNavigationArrows(
              context,
              isLeftActive: true,
              isRightActive: false,
              onLeftTap: () {},
              onRightTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: (326.22222900390625 / 360) * deviceWidth,
      height: (78.28888702392578 / 800) * deviceHeight,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            top: (-5 / 800) * deviceHeight,
            child: Text(
              "Services",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: (52 / 360) * deviceWidth,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.1),
                letterSpacing: 0,
                decoration: TextDecoration.none,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                        color: const Color(0xFFA7FF46),
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: (2.86 / 800) * deviceHeight),

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: (286.1111145019531 / 360) * deviceWidth,
                ),
                child: SizedBox(
                  width: (286.1111145019531 / 360) * deviceWidth,
                  height: (78.28888702392578 / 800) * deviceHeight,
                  child: Text(
                    "Provide a concise description of your offerings, highlighting key features and benefits.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: (10 / 360) * deviceWidth,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      letterSpacing: 0,
                      color: Colors.white70,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height:
                      (2.29 / 800) * deviceHeight), // Corrected text box gap

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
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    List<Map<String, String>> services = [
      {
        "iconPath": "assets/icons/Service Icons=Heart Beat.png",
        "title": "Heart Health",
        "subtitle": "Boost cardiovascular endurance."
      },
      {
        "iconPath": "assets/icons/Service Icons=Locker.png",
        "title": "Locker Services",
        "subtitle": "Secure your belongings."
      },
      {
        "iconPath": "assets/icons/Service Icons=Pills.png",
        "title": "Supplement Guidance",
        "subtitle": "Expert advice on supplements."
      },
      {
        "iconPath": "assets/icons/Service Icons=Sit Up.png",
        "title": "Core Training",
        "subtitle": "Strengthen your core."
      },
      {
        "iconPath": "assets/icons/Service Icons=Stationary Bike.png",
        "title": "Cycling",
        "subtitle": "Burn calories with cycling."
      },
      {
        "iconPath": "assets/icons/Service Icons=Weightlifting.png",
        "title": "Strength Training",
        "subtitle": "Improve strength with weights."
      },
      {
        "iconPath": "assets/icons/Service Icons=Yoga.png",
        "title": "Yoga & Mindfulness",
        "subtitle": "Enhance flexibility and relax."
      },
    ];

    return SizedBox(
      height: (185 / 800) * deviceHeight, // Keeps the height fixed
      width: (326.22 / 360) * deviceWidth, // Limits the container width
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
                right:
                    (5.6 / 360) * deviceWidth), // ✅ Corrected the gap to 5.6px
            child: SizedBox(
              width: (180 / 360) * deviceWidth, // ✅ Ensures card width is 180px
              height: (185 / 800) *
                  deviceHeight, // ✅ Maintains card height at 185px
              child: ServiceCard(
                iconPath: services[index]["iconPath"]!,
                title: services[index]["title"]!,
                subtitle: services[index]["subtitle"]!,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavigationArrows(
    BuildContext context, {
    required bool isLeftActive,
    required bool isRightActive,
    required VoidCallback onLeftTap,
    required VoidCallback onRightTap,
  }) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: (10 / 800) * deviceHeight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap:
                isLeftActive ? onLeftTap : null, // Prevents tap when inactive
            child: Container(
              width: (50 / 360) * deviceWidth,
              height: (50 / 800) * deviceHeight,
              padding: EdgeInsets.all((10 / 360) * deviceWidth),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Keep color unchanged
              ),
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          SizedBox(width: (10 / 360) * deviceWidth), // Exact gap
          GestureDetector(
            onTap:
                isRightActive ? onRightTap : null, // Prevents tap when inactive
            child: Container(
              width: (50 / 360) * deviceWidth,
              height: (50 / 800) * deviceHeight,
              padding: EdgeInsets.all((10 / 360) * deviceWidth),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Keep color unchanged
              ),
              child: Icon(Icons.arrow_forward, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
