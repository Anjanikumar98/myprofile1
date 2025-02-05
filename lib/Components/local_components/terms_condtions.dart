import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 36,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.info_outline, // Info icon
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width: 8), // Spacing between icon and text
          Expanded(
            child: Text(
              "By clicking the Update button, you'll agree to the T&C.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}