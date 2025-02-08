import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async'; // For Timer

class NavigationController extends GetxController {
  var isMenuOpen = false.obs; // Controls menu visibility
  var selectedNavigationIndex = 0.obs; // Tracks selected icon
}

class FlexFitMenu extends StatefulWidget {
  @override
  _FlexFitMenuState createState() => _FlexFitMenuState();
}

class _FlexFitMenuState extends State<FlexFitMenu> {
  final NavigationController controller = Get.put(NavigationController());

  // Menu items
  final List<String> _menuItems = [
    'Services',
    'Membership',
    'Trainers',
    'Contact us'
  ];

  // Navigation icons
  final List<String> _navigationIconPaths = [
    'assets/images/Property 1=Ball.png',
    'assets/images/Property 1=Ballerina.png',
    'assets/images/Property 1=Dumbell.png',
    'assets/images/Property 1=Glove.png',
    'assets/images/Property 1=Mat.png',
  ];

  late Timer _timer; // For icon change every few seconds

  @override
  void initState() {
    super.initState();

    // Change icon every 2 seconds
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      // Cycle through the icons
      controller.selectedNavigationIndex.value =
          (controller.selectedNavigationIndex.value + 1) %
              _navigationIconPaths.length;
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Main content (Final screen)
        Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              // Header with Navigation Toggle Button
              AppBar(
                title: Obx(() => Row(
                      children: [
                        // Show the icon for the selected navigation item
                        Image.asset(
                          _navigationIconPaths[
                              controller.selectedNavigationIndex.value],
                          width: 30,
                          height: 30,
                          color: const Color(
                              0xFFCCFF00), // Neon green for selected icon
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "FlexFit",
                          style: TextStyle(
                              color: Color(0xFFCCFF00),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                backgroundColor: Colors.black,
                leading: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: () {
                    // Toggle the menu visibility when the menu button is clicked
                    controller.isMenuOpen.toggle();
                  },
                ),
              ),

              // Main Screen Content
              Expanded(
                child: Center(
                  child: Text(
                    "Your Main Content Here",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              // Navigation Icons
              Container(
                width: 540,
                height: 60,
                color: const Color(0xFF1E1E1E),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(_navigationIconPaths.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        controller.selectedNavigationIndex.value = index;
                      },
                      child: Obx(() => Image.asset(
                            _navigationIconPaths[index],
                            // Change the icon color when selected
                            color: controller.selectedNavigationIndex.value ==
                                    index
                                ? const Color(
                                    0xFFCCFF00) // Neon green when selected
                                : Colors.white.withOpacity(
                                    0.6), // Dimmed color when not selected
                            width: 30,
                            height: 30,
                          )),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),

        // Sliding Menu
        Obx(() => AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: controller.isMenuOpen.value ? 0 : -250,
              top: 0,
              bottom: 0,
              child: Container(
                width: 250,
                color: const Color(0xFF1E1E1E),
                child: Column(
                  children: [
                    // Close Button
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: const Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          controller.isMenuOpen.value =
                              false; // Close menu when clicked
                        },
                      ),
                    ),

                    // Menu Items
                    Expanded(
                      child: ListView.builder(
                        itemCount: _menuItems.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              _menuItems[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            onTap: () {
                              controller.isMenuOpen.value =
                                  false; // Close menu on item tap
                              // Add your navigation logic here
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
