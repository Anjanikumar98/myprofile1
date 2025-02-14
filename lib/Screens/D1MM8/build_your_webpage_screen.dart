import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildYourWebpageScreen extends StatefulWidget {
  const BuildYourWebpageScreen({super.key});

  @override
  State<BuildYourWebpageScreen> createState() => _BuildYourWebpageScreenState();
}

class _BuildYourWebpageScreenState extends State<BuildYourWebpageScreen> {
  @override
  Widget build(BuildContext context) {

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight((56 / 800) * deviceHeight), // Responsive AppBar height
        child: SafeArea(
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: (16 / 360) * deviceWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back, color: Colors.white, size: (24 / 360) * deviceWidth),
                    ),
                    SizedBox(width: (8 / 360) * deviceWidth),
                    Text(
                      "My Plan",
                      style: TextStyle(
                        fontSize: (18 / 360) * deviceWidth,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: (32 / 360) * deviceWidth,
                          height: (32 / 800) * deviceHeight,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Icon(Icons.notifications_none, size: (24 / 360) * deviceWidth, color: Colors.white),
                        Positioned(
                          top: (1 / 800) * deviceHeight,
                          left: (16 / 360) * deviceWidth,
                          child: Container(
                            padding: EdgeInsets.all((4 / 360) * deviceWidth),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: (8 / 360) * deviceWidth,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: (16 / 360) * deviceWidth),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.circle, size: (4 / 360) * deviceWidth, color: Colors.white),
                        SizedBox(height: (4 / 800) * deviceHeight),
                        Icon(Icons.circle, size: (4 / 360) * deviceWidth, color: Colors.white),
                        SizedBox(height: (4 / 800) * deviceHeight),
                        Icon(Icons.circle, size: (4 / 360) * deviceWidth, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/gym_app_background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Color(0xFF063434).withOpacity(0.8),
                  BlendMode.srcOver,
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF121212).withOpacity(0.25),
                    Color(0xFF121212).withOpacity(0.25),
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: (16 / 800) * deviceHeight), // Responsive Spacing
                  Padding(
                    padding: EdgeInsets.all((5 / 360) * deviceWidth),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          // Add Stats Section Content Here
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
