import 'package:flutter/material.dart';

class FeaturesList extends StatelessWidget {
  final List<String> features;

  FeaturesList({required this.features, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth * 0.5, // Responsive width
      height: deviceHeight * 0.22, // Responsive height
      padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.0056),
      decoration: BoxDecoration(
        color: Color(0xFF063434), // Dark greenish background
        borderRadius: BorderRadius.circular(deviceWidth * 0.022),
      ),
      child: Scrollbar(
        thickness: 3.0, // Thinner scrollbar
        radius: Radius.circular(deviceWidth * 0.022),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                top: deviceHeight * 0.0056,
                right: deviceWidth * 0.0046,
                bottom: deviceHeight * 0.0056,
                left: deviceWidth * 0.0156),
            child: Column(
              children: features
                  .map((feature) =>
                      _buildFeatureItem(feature, deviceHeight, deviceWidth))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(
      String feature, double deviceHeight, double deviceWidth) {
    return Padding(
      padding: EdgeInsets.only(bottom: deviceHeight * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Checkmark Circle
          Container(
            width: deviceWidth * 0.03,
            height: deviceWidth * 0.03,
            padding: EdgeInsets.all(deviceWidth * 0.0015),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: Color(0xFFCBFB5E), width: 1.0),
            ),
            child: Icon(
              Icons.check,
              size: deviceWidth * 0.02,
              color: Color(0xFFCBFB5E),
            ),
          ),
          SizedBox(width: deviceWidth * 0.0156),

          // Feature Text
          Expanded(
            child: Text(
              feature,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: deviceHeight * 0.0125,
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
