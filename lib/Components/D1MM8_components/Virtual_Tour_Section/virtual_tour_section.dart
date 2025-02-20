import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VirtualTourSection extends StatefulWidget {
  const VirtualTourSection({super.key});

  @override
  State<VirtualTourSection> createState() => _VirtualTourSectionState();
}

class _VirtualTourSectionState extends State<VirtualTourSection> {
  int selectedIndex = 0;
  final ScrollController _scrollController = ScrollController();

  final List<String> galleryImages = [
    'assets/images/video_tour1.png',
    'assets/images/video_tour2.png',
    'assets/images/video_tour3.png',
    'assets/images/video_tour4.png',
  ];

  void _scrollToSelected(int index) {
    _scrollController.animateTo(
      index * 108.0, // 100 width + 8 padding
      duration: const Duration(milliseconds: 0), // Instant scroll
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      height: 402.43,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(11.44),
      ),
      child: Column(
        children: [
          // Title Section
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Positioned(
                top: -15,
                child: Text(
                  "Tour",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.05),
                    letterSpacing: 2,
                  ),
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "Have a ",
                  style: TextStyle(
                    fontFamily: "Urbanist",
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "Virtual Tour",
                      style: TextStyle(
                        color: Color(0xFFB8FE22),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Divider
          Center(
            child: Container(
              width: 372,
              height: 1, // Border height
              color: Color(0xFF2F5B6C), // Icons Primary Blue Dark
            ),
          ),

          const SizedBox(height: 20),

          // Main Image
          Container(
            width: 372,
            height: 178.14,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF376C7F),
                width: 0.65,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius:
                  BorderRadius.circular(8), // Only needed here to clip image
              child: Image.asset(
                'assets/images/video_tour.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Second Divider
          Container(
            width: 372,
            height: 1,
            color: const Color(0xFF2F5B6C),
          ),

          const SizedBox(height: 10),

          // Thumbnail Gallery
          SizedBox(
            height: 80,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  galleryImages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        setState(() => selectedIndex = index);
                        _scrollToSelected(index);
                      },
                      child: AnimatedContainer(
                        duration:
                            const Duration(milliseconds: 300), // Smart animate
                        curve: Curves.easeOut,
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: selectedIndex == index
                                ? const Color(0xFFB8FE22)
                                : const Color(0xFF376C7F),
                            width: 0.8,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: galleryImages[index].endsWith('.svg')
                              ? SvgPicture.asset(
                                  galleryImages[index],
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  galleryImages[index],
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
