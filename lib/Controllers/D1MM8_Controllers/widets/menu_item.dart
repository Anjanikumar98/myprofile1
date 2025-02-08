import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  MenuItem(this.title, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
        Get.back();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
