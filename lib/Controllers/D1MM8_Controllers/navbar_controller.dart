import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavbarController extends GetxController {
  RxBool isMenuOpen = false.obs;
  RxInt currentIcon = 0.obs;
  late ScrollController scrollController;
  late Timer _iconTimer;

  final List<String> iconAssets = [
    'assets/images/Property 1=Ball.png',
    'assets/images/Property 1=Ballerina.png',
    'assets/images/Property 1=Dumbell.png',
    'assets/images/Property 1=Glove.png',
    'assets/images/Property 1=Mat.png',
  ];

  NavbarController(this.scrollController) {
    _startIconAnimation();
  }

  void _startIconAnimation() {
    _iconTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      currentIcon.value = (currentIcon.value + 1) % iconAssets.length;
    });
  }

  void scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      isMenuOpen.value = false;
    }
  }

  @override
  void onClose() {
    _iconTimer.cancel();
    super.onClose();
  }
}

class Navbar extends StatelessWidget {
  final Function(String) onItemSelected;
  final NavbarController controller = Get.find<NavbarController>();

  Navbar({super.key, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Obx(() => Image.asset(
                            controller.iconAssets[controller.currentIcon.value],
                            width: 30,
                            height: 30,
                            color: const Color(0xFFA7FF46),
                          )),
                      const SizedBox(width: 10),
                      const Text(
                        'FlexFit',
                        style: TextStyle(
                          color: Color(0xFFA7FF46),
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white24),
            const SizedBox(height: 20),
            _buildMenuItem('Services'),
            _buildMenuItem('Membership'),
            _buildMenuItem('Trainers'),
            _buildMenuItem('Contact us'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String text) {
    return InkWell(
      onTap: () {
        onItemSelected(text);
        Get.back();
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
