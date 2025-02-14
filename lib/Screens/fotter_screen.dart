import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlexFitFooter extends StatelessWidget {
  const FlexFitFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: (20 / 800) * deviceHeight,
        horizontal: (16 / 360) * deviceWidth,
      ),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// **Logo and Name**
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Property 1=Ballerina.png',
                width: (50 / 360) * deviceWidth, // ✅ Responsive logo size
                height: (50 / 800) * deviceHeight,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.fitness_center,
                  color: Colors.limeAccent,
                  size: 28,
                ),
              ),
              SizedBox(width: (8 / 360) * deviceWidth),
              Text(
                'FlexFit',
                style: TextStyle(
                  color: Colors.limeAccent,
                  fontSize: (22 / 360) * deviceWidth,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: (16 / 800) * deviceHeight),

          /// **Navigation Links**
          Wrap(
            spacing: (12 / 360) * deviceWidth, // ✅ Even spacing
            children: [
              _navLink('Services', deviceWidth),
              _navLink('Membership', deviceWidth),
              _navLink('Trainers', deviceWidth),
              _navLink('Contact Us', deviceWidth),
            ].map((widget) => InkWell(onTap: () {}, child: widget)).toList(),
          ),
          SizedBox(height: (16 / 800) * deviceHeight),

          /// **Social Media Icons**
          Wrap(
            spacing: (12 / 360) * deviceWidth,
            children: [
              FontAwesomeIcons.facebookF,
              FontAwesomeIcons.instagram,
              FontAwesomeIcons.xTwitter,
              FontAwesomeIcons.linkedinIn,
              FontAwesomeIcons.youtube,
            ]
                .map((icon) => InkWell(
                      onTap: () {}, // Add action here if needed
                      child: _socialIcon(icon, deviceWidth),
                    ))
                .toList(),
          ),
          SizedBox(height: (16 / 800) * deviceHeight),

          /// **Divider Line**
          Container(
            height: 1,
            width: double.infinity,
            color: Colors.white24,
            margin: EdgeInsets.symmetric(vertical: (16 / 800) * deviceHeight),
          ),

          /// **Powered by Membes**
          Text(
            'Powered by Membes',
            style: TextStyle(
              color: Colors.white,
              fontSize: (14 / 360) * deviceWidth,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: (16 / 800) * deviceHeight),

          /// **Footer Links**
          Wrap(
            spacing: (12 / 360) * deviceWidth,
            children: [
              _footerLink('Privacy Policy', deviceWidth),
              _footerLink('Terms of Service', deviceWidth),
              _footerLink('Cookies Settings', deviceWidth),
            ].map((widget) => InkWell(onTap: () {}, child: widget)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _navLink(String text, double deviceWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (12 / 360) * deviceWidth),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: (14 / 360) * deviceWidth, // ✅ Responsive font size
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, double deviceWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (10 / 360) * deviceWidth),
      child: Icon(
        icon,
        color: Colors.limeAccent,
        size: (22 / 360) * deviceWidth, // ✅ Responsive icon size
      ),
    );
  }

  Widget _footerLink(String text, double deviceWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (12 / 360) * deviceWidth),
      child: InkWell(
        onTap: () {}, // Add action here if needed
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: (14 / 360) * deviceWidth, // ✅ Responsive font size
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
