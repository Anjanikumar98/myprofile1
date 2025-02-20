import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:myprofile1/Components/D1MM8_components/Service_Section/service_cards.dart';


class Services extends StatelessWidget {
  const Services({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;


    return Container(
      width: 412, // Simplified to deviceWidth as it's 100% width
      height: 400, // Fixed height
      padding: EdgeInsets.symmetric(
        horizontal: 20, // Fixed padding
      ),
      child: Column(
        children: [_buildInnerContent(context)],
      ),
    );
  }

  Widget _buildInnerContent(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return ClipRRect(
      borderRadius: BorderRadius.circular(11.44), // Fixed border radius
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14.3, sigmaY: 14.3), // Blur effect
        child: Container(
          width: 372, // Fixed width
          height: 398.55, // Fixed height
          padding: EdgeInsets.only(
            top: 28.61, // Fixed padding
            right: 22.89, // Fixed padding
            bottom: 28.61, // Fixed padding
            left: 22.89, // Fixed padding
          ),
          decoration: BoxDecoration(
            color: Colors.black12.withOpacity(0.6), // Semi-transparent overlay
            borderRadius: BorderRadius.circular(11.44), // Fixed border radius
          ),
          child: Column(
            children: [
              SizedBox(
                height: 28.61, // Fixed height
              ),
              _buildHeading(context),
              SizedBox(
                height: 8.58, // Fixed height
              ),
              _buildDivider(context),
              SizedBox(
                height: 8.58, // Fixed height
              ),
              _buildServiceList(context),
              SizedBox(
                height: 8.58, // Fixed height
              ),
              Container(
                width: 326.22,
                height: 50,
                padding: EdgeInsets.all(10),
                child: InkWell(
                  onTap: () {},
                  child: _buildNavigationArrows(
                    context,
                    isLeftActive: false,
                    isRightActive: true,
                    onLeftTap: () {},
                    onRightTap: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: 326, // ✅ Fixed width
      height: 79, // ✅ Fixed height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Large background text
          Text(
            "Services",
            style: TextStyle(
              fontSize: 48, // Adjusted size
              fontWeight: FontWeight.w700,
              fontFamily: 'Urbanist', // Applied correct font
              color: Colors.white.withOpacity(0.05),
              letterSpacing: 2,
            ),
          ),

          // Foreground content
          Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Explore our ",
                      style: TextStyle(
                        fontSize: 24, // Fixed font size
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist',
                        color: Colors.white,
                        height: 1.2, // Standard line height
                      ),
                    ),
                    TextSpan(
                      text: "Services",
                      style: TextStyle(
                        fontSize: 24, // Fixed font size
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Urbanist',
                        color: Color(0xFFB8FE22),
                        height: 1.2, // Standard line height
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15), // Fixed spacing without scaling
              Text(
                "Provide a concise description of your offerings,\nhighlighting key features and benefits.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 8, // Fixed font size
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: Color(0xFFCCCCCC),
                  height: 1.5, // Standard line height
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.center, // Ensures center alignment
      child: Container(
        width: 320.5, // Fixed width
        height: 2.29, // Fixed height
        padding: const EdgeInsets.symmetric(
          vertical: 1.14, // Fixed vertical padding
          horizontal: 2.86, // Fixed horizontal padding
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0x5555A6C4), // Transparent overlay blue (#55A6C480)
            width: 0.43, // Fixed border width
          ),
        ),
      ),
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
      height: 186, // Fixed height
      width: 326.22, // Fixed width
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: services.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.6), // Fixed padding
            child: SizedBox(
              width: 180, // Fixed card width
              height: 185, // Fixed card height
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
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left Arrow
          GestureDetector(
            onTap:
                isLeftActive ? onLeftTap : null, // Prevents tap when inactive
            child: Container(
              width: 30, // Fixed width
              height: 30, // Fixed height
              padding: const EdgeInsets.all(16), // Adjusted padding
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isLeftActive ? Colors.white : Colors.transparent,
                border: isLeftActive
                    ? null
                    : Border.all(
                        color: const Color(0xFFFFFF4D),
                        width: 1, // Border width
                      ),
              ),
              child: Align(
                alignment: Alignment.center, // Ensures the icon is centered
                child: Transform.rotate(
                  angle:
                      180 * 3.1415927 / 180, // Rotate the icon by 180 degrees
                  child: const Icon(
                    Icons.arrow_back, // Using the 'More' icon
                    color: Colors.grey,
                    size: 12, // Fixed size for the icon
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10), // Fixed gap between arrows
          // Right Arrow
          GestureDetector(
            onTap:
                isRightActive ? onRightTap : null, // Prevents tap when inactive
            child: Container(
              width: 30, // Fixed width
              height: 30, // Fixed height
              padding: const EdgeInsets.all(16), // Adjusted padding
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isRightActive ? Colors.white : Colors.transparent,
                border: isRightActive
                    ? null
                    : Border.all(
                        color: const Color(0xFFFFFF4D),
                        width: 1, // Border width
                      ),
              ),
              child: Align(
                alignment: Alignment.center, // Ensures the icon is centered
                child: const Icon(
                  Icons.arrow_forward, // Using the 'More' icon
                  color: Colors.grey,
                  size: 12, // Fixed size
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

