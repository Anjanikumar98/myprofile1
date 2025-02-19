import 'package:flutter/material.dart';

GlobalKey<_ShowOverlayState> overlayKey = GlobalKey<_ShowOverlayState>();

class ShowOverlay extends StatefulWidget {
  const ShowOverlay({super.key});

  @override
  _ShowOverlayState createState() => _ShowOverlayState();
}

class _ShowOverlayState extends State<ShowOverlay>
    with TickerProviderStateMixin {
  OverlayEntry? overlayEntry;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300), // Duration of the animation
    );

    // Define the animation (moves from below the screen to the final position)
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void showOverlay(BuildContext context) {
    // Create the OverlayEntry with animated position
    overlayEntry = OverlayEntry(
      builder: (context) {
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Positioned(
              bottom: _animation.value * 200, // Animates from 200 to 0
              left: 0,
              right: 0,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    removeOverlay();
                  },
                  child: Container(
                    height: 200,
                    color: Colors.black.withOpacity(0.7),
                    child: Center(
                      child: Text(
                        'D1MM8.2 Enterprise Request Submitted Popup 2',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );

    // Insert the overlay entry into the overlay
    Overlay.of(context).insert(overlayEntry!);

    // Start the animation
    _animationController.forward();

    // Remove overlay after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      removeOverlay();
    });
  }

  // Helper method to remove the overlay
  void removeOverlay() {
    _animationController.reverse().then((_) {
      overlayEntry?.remove();
      overlayEntry = null; // Avoid memory leak
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Can be an empty container or your widget tree
  }
}
