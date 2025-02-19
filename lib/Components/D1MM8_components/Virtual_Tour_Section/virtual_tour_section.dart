import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Controllers/D1MM8_Controllers/video_gallery_controller/video_player_widget.dart';

class VirtualTourSection extends StatefulWidget {
  const VirtualTourSection({super.key});

  @override
  State<VirtualTourSection> createState() => _VirtualTourSectionState();
}

class _VirtualTourSectionState extends State<VirtualTourSection> {
  int selectedIndex = 0;

  final List<String> galleryImages = [
    'assets/images/Property 1=Video Default.svg',
    'assets/images/Property 1=Video Active.svg',
    'assets/images/Property 1=Image Default.svg',
    'assets/images/Property 1=Image Active.svg',
  ];

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: (412 / 360) * deviceWidth,
      height: (402.43 / 800) * deviceHeight,
      padding: EdgeInsets.symmetric(
        horizontal: (20 / 360) * deviceWidth,
        vertical: (25 / 800) * deviceHeight,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF333333),
        borderRadius: BorderRadius.circular((11.44 / 800) * deviceHeight),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(height: (25 / 800) * deviceHeight),
              // Background text "Tour"
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: (10 / 800) * deviceHeight),
                  child: Text(
                    "Tour",
                    style: TextStyle(
                      fontSize: (48 / 360) * deviceWidth,
                      fontWeight: FontWeight.w400, // Slightly faded
                      color: Colors.white.withOpacity(0.05),
                      letterSpacing: 2,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              // Foreground text "Have a Virtual Tour"
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: (262.74 / 360) * deviceWidth,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Have a ",
                        style: TextStyle(
                          fontFamily: "Urbanist",
                          fontSize: (24 / 360) * deviceWidth,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                        children: [
                          TextSpan(
                            text: "Virtual Tour",
                            style: TextStyle(
                              color: Color(
                                  0xFFB8FE22), // Green color for "Virtual Tour"
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height:
                          (5 / 800) * deviceHeight), // Adjust spacing if needed
                ],
              ),
            ],
          ),

          SizedBox(height: (10 / 800) * deviceHeight),

          Center(
            child: Container(
              width: (366.28 / 360) * deviceWidth, // Scaled width
              height: (2.29 / 800) * deviceHeight, // Scaled height
              margin: EdgeInsets.symmetric(
                vertical: (1.14 / 800) * deviceHeight,
                horizontal: (2.86 / 360) * deviceWidth,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0x55A6C480), // Transparent border color
                  width: (0.43 / 360) * deviceWidth, // Scaled border width
                ),
              ),
            ),
          ),
          SizedBox(height: (10 / 800) * deviceHeight),

          ClipRRect(
            borderRadius: BorderRadius.circular((8 / 360) * deviceWidth),
            child: VideoPlayerWidget(
              videoUrl: 'assets/videos/gym_video.mp4',
            ),
          ),

          SizedBox(
              height: (10 / 800) * deviceHeight), // Adjust spacing if needed

          Center(
            child: Container(
              width: (372 / 360) * deviceWidth,
              height: (1 / 800) * deviceHeight, // Border height
              color: Color(0xFF2F5B6C), // Icons Primary Blue Dark
            ),
          ),

          SizedBox(height: (10 / 800) * deviceHeight),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                galleryImages.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index; // Update selected thumbnail
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: (8 / 360) * deviceWidth),
                    child: Container(
                      width: (100 / 360) * deviceWidth,
                      height: (80 / 800) * deviceHeight,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular((8 / 360) * deviceWidth),
                        border: Border.all(
                          color: getBorderColor(index),
                          width: (0.8 / 360) * deviceWidth,
                        ),
                      ),
                      child: galleryImages[index].endsWith('.svg')
                          ? SvgPicture.asset(
                              galleryImages[index],
                              fit: BoxFit.cover,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  (8 / 360) * deviceWidth),
                              child: Image.asset(
                                galleryImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Color getBorderColor(int index) {
    switch (index) {
      case 0:
        return Color(0xFFB8FE22); // Video Active
      case 1:
        return Color(0xFF376C7F); // Image Default (Dark Blue)
      case 2:
        return Color(0xFF376C7F); // Image Active (Dark Blue)
      default:
        return Colors.transparent; // Default state (no border)
    }
  }
}
