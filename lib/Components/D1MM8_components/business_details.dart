import 'package:flutter/material.dart';

import 'business_card.dart';

class BusinessDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 780,
      padding: const EdgeInsets.fromLTRB(15, 136, 15, 14.31),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background_image_header.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF063434),
            Color(0xFF063434).withOpacity(0.25),
          ],
          stops: [0.0, 0.314],
        ),
      ),
      child: Column(
        children: [
          const BusinessCard(),
        ],
      ),
    );
  }
}
