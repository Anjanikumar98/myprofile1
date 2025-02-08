import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollControllerX extends GetxController {
  final ScrollController scrollController = ScrollController();

  // GlobalKeys for different sections
  final GlobalKey servicesKey = GlobalKey();
  final GlobalKey membershipKey = GlobalKey();
  final GlobalKey trainersKey = GlobalKey();
  final GlobalKey contactUsKey = GlobalKey();

  // Scroll to a specific section
  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      print("Key not found in context!");
    }
  }
}
