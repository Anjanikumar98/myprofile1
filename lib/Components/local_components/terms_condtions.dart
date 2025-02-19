import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});


  @override
  Widget build(BuildContext context) {

    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: (328 / 360) * deviceWidth,
      height: (36 / 800) * deviceHeight,
      padding: EdgeInsets.symmetric(horizontal: (16 / 360) * deviceWidth),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline, // Info icon
            color: Colors.white,
            size: (24 / 800) * deviceHeight,
          ),
          SizedBox(
              width: (8 / 360) * deviceWidth), // Spacing between icon and text
          Expanded(
            child: Text(
              "By clicking the Update button, you'll agree to the T&C.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: (12 / 800) * deviceHeight,
                height: (18 / 12), // Line height conversion
                letterSpacing: 0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}