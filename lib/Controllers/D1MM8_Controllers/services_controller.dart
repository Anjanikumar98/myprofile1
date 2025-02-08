import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class ServicesController extends GetxController {
  var isHovered = false.obs;
  ScrollController scrollController = ScrollController();

  void setHover(bool value) {
    isHovered.value = value;
  }

  void scrollLeft() {
    scrollController.animateTo(
      scrollController.offset - 300, // Adjust based on card width
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollRight() {
    scrollController.animateTo(
      scrollController.offset + 300, // Adjust based on card width
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
