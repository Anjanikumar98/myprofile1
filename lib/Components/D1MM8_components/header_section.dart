import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 70,
      padding: const EdgeInsets.fromLTRB(20, 19, 20, 19),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ), // ✅ Added border radius
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(0, 0, 0, 0.5),
            Color.fromRGBO(0, 0, 0, 0.0),
          ],
          stops: [0.0, 0.8], // 🔹 Explicitly match the 80% stop
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          const Text(
            "My Plan",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            children: const [
              Icon(Icons.notifications, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.menu, color: Colors.white),
            ],
          ),
        ],
      ),
    );
  }
}
