import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FlexFitFooter extends StatelessWidget {
  const FlexFitFooter({super.key});

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
              /// **Logo Frame**
              SizedBox(
                width: (116 / 360) * deviceWidth,
                height: (30 / 800) * deviceHeight,
                child: Image.asset(
                  'assets/images/Property 1=Ballerina.png',
                  width: (30 / 360) * deviceWidth,
                  height: (30 / 800) * deviceHeight,
                ),
              ),

              SizedBox(width: (10 / 360) * deviceWidth),

              /// **FlexFit Text**
              Text(
                'FlexFit',
                style: TextStyle(
                  color: Color(0xFFB8FE22),
                  fontSize: (25 / 360) * deviceWidth, // ✅ Matches Figma 25px
                  fontWeight: FontWeight.w700, // ✅ Matches Figma 700
                  height: 27.5 / 25, // ✅ Matches line-height 27.5px
                ),
              ),
            ],
          ),

          SizedBox(height: (16 / 800) * deviceHeight),

          /// **Navigation Links**
          Wrap(
            alignment: WrapAlignment.center,
            spacing: (12 / 360) * deviceWidth, // ✅ Even spacing
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _navLink('Services', deviceWidth),
                    _navLink('Membership', deviceWidth),
                    _navLink('Trainers', deviceWidth),
                    _navLink('Contact Us', deviceWidth),
                  ],
                ),
              )
            ].map((widget) => InkWell(onTap: () {}, child: widget)).toList(),
          ),
          SizedBox(height: (16 / 800) * deviceHeight),

          /// **Social Media Icons**
          Wrap(
            alignment: WrapAlignment.center,
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
            height: 1.0,
            width: 372.0, // Matches the width from CSS
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF666666), // Matches the border color (#666666)
                width: 1.0, // Matches the border width (1px)
              ),
            ),
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
          fontSize: (12 / 360) * deviceWidth, // ✅ Corrected to 12px
          height: 1.5, // ✅ Matches line-height 18px (18/12)
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, double deviceWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: (10 / 360) * deviceWidth),
      child: Icon(
        icon,
        color: Color(0xFFB8FE22),
        size: (24 / 360) * deviceWidth,
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
            fontSize: (12 / 360) * deviceWidth, // ✅ Corrected font size
            fontWeight: FontWeight.w400, // ✅ Added correct font weight
            fontFamily: 'Poppins', // ✅ Ensuring correct font family
            height: 1.5, // ✅ Matching 18px line height
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
