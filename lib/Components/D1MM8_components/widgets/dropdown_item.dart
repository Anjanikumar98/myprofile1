import 'package:flutter/material.dart';

class DropdownItem extends StatelessWidget {
  final String feature;
  final VoidCallback onTap;
  final bool isSelected;

  DropdownItem(
      {required this.feature, required this.onTap, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: (308 / 360) * deviceWidth,
        height: (41 / 800) * deviceHeight,
        margin: EdgeInsets.only(bottom: (4 / 800) * deviceHeight),
        padding: EdgeInsets.symmetric(
            vertical: (6 / 800) * deviceHeight,
            horizontal: (16 / 360) * deviceWidth),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blueAccent : Color(0xFF2F5B6C),
          borderRadius: BorderRadius.circular((4 / 800) * deviceHeight),
        ),
        child: Text(
          feature,
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: (14 / 800) * deviceHeight,
            color: Color(0xFFF4F4F4), // Off-White
          ),
        ),
      ),
    );
  }
}
