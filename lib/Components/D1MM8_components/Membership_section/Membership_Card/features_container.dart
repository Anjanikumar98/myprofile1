import 'package:flutter/material.dart';

class FeaturesContainer extends StatefulWidget {
  final List<String> features;
  final double width;
  final double height;

  const FeaturesContainer({
    super.key,
    required this.features,
    this.height = 177.05, // Simplified
    this.width = 188.79, // Simplified
  });

  @override
  _FeaturesContainerState createState() => _FeaturesContainerState();
}

class _FeaturesContainerState extends State<FeaturesContainer> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.symmetric(vertical: 4.48),
      decoration: BoxDecoration(
        color: const Color(0xFF063434), // Dark Grey Background
        borderRadius: BorderRadius.circular(7.84),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: Container(
              width: 177.58,
              height: 168.08,
              padding: EdgeInsets.fromLTRB(
                5.6,
                4.48,
                1.68,
                4.48,
              ),
              child: Scrollbar(
                controller: _scrollController,
                thumbVisibility: true, // Ensures thumb is always visible
                thickness: 11.2057, // Matched Figma width
                radius: const Radius.circular(
                    6), // Soft rounded edges for scrollbar
                trackVisibility: true, // Ensures track visibility
                interactive: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.8, horizontal: 5.6), // Matched Figma padding
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount: widget.features.length,
                    itemBuilder: (context, index) {
                      return FeatureItem(featureText: widget.features[index]);
                    },
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

class FeatureItem extends StatelessWidget {
  final String featureText;
  final double width;
  final double height;

  const FeatureItem({
    super.key,
    required this.featureText,
    this.height = 24,
    this.width = 170.3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Circular check icon
          Stack(
            alignment: Alignment.center,
            children: [
              // Outer Border Circle
              Container(
                width: 11.21,
                height: 11.21,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 0.84, // Border width
                    color: Color(0xFFB8FE22), // Primary green border color
                  ),
                  color: Colors.transparent, // Transparent background
                ),
              ),

              // Inner Green Circle
              Container(
                width: 10.085, // Inner circle width
                height: 10.085, // Inner circle height
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF063434), // Checkmark background color
                ),
              ),

              // Vector Check Icon
              Positioned(
                top: 4.09, // From Figma
                left: 3.59, // From Figma
                child: Icon(
                  Icons.check,
                  color: Color(0xFFB8FE22),
                  size: 4.538, // Exact Figma width
                ),
              ),
            ],
          ),
          const SizedBox(width: 5.6), // Spacing between icon and text

          // Feature text
          SizedBox(
            width: 153.496, // Matched Figma width
            height: 24, // Matched Figma height
            child: Text(
              featureText,
              textAlign: TextAlign.start, // Ensures left alignment
              style: const TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: 8, // Matched Figma
                height: 12 / 8, // Matched Figma line-height (1.5 ratio)
                letterSpacing: 0, // No extra spacing
                color: Colors.white, // Matches Pure White (#FFFFFF)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
