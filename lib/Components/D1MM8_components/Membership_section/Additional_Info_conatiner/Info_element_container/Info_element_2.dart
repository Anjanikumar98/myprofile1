import 'package:flutter/material.dart';

class InfoElement2 extends StatelessWidget {
  const InfoElement2({
    super.key,
    required this.boldInt,
    required this.bottomString,
    required this.topRightString,
  });

  final String bottomString;
  final String boldInt;
  final String topRightString;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40, // Fixed width as per design
      height: 36, // Fixed height as per design
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(2.24), // Proper padding
            child: SizedBox(
              height: 17, // Half of the total height (upper part)
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    boldInt,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14, // Adjusted for proportion
                      fontFamily: 'Barlow_Semi_Condensed',
                      color: Color(0xFFB8FE22),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(width: 2.24), // Spacing as per design
                  SizedBox(
                    width: double.infinity, // Expands as needed
                    child: Text(
                      topRightString,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: Color(0xFFB8FE22),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.24),
            child: SizedBox(
              height: 8,
              child: Text(
                bottomString,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  fontFamily: 'Poppins',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
