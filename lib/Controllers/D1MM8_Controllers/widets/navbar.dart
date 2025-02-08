import 'dart:ui'; // ✅ Required for BackdropFilter
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../scroll_controller.dart';
import '../views/menu_screen.dart';

class NavbarWithMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324, // ✅ Fixed width
      height: 64, // ✅ Fixed height
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 17), // ✅ Correct padding
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 50, offset: Offset(0, 25)),
          BoxShadow(color: Colors.black.withOpacity(0.25), blurRadius: 4, offset: Offset(0, 4)),
        ],
      ),
      child: Stack(
        children: [
          // ✅ Backdrop Blur Effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 54, sigmaY: 54), // ✅ Blur Effect
              child: Container(color: Colors.transparent),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("FlexFit", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.limeAccent)),
              GestureDetector(
                onTap: () {
                  Get.lazyPut(() => ScrollControllerX());
                  Get.to(() => MenuScreen());
                },
                child: Icon(Icons.menu, size: 30, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
