import 'package:flutter/material.dart';

class ImageViewerWidget extends StatelessWidget {
  final String imageUrl;

  const ImageViewerWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        width: 372,
        height: 178.14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.48),
          border: Border.all(
            color: const Color(0xFF376C7F),
            width: 0.65,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              alignment: Alignment.center,
              child: const Icon(
                Icons.broken_image,
                color: Colors.red,
                size: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}
