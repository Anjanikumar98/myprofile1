import 'package:flutter/material.dart';


class FinalOverviewSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 282,
      height: 73,
      padding: const EdgeInsets.symmetric(horizontal: 10), // ✅ padding-right: 10px, padding-left: 10px
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // ✅ Centers content vertically
        children: [
          SizedBox(
            width: 262, // ✅ Matches the required width
            height: 48, // ✅ Matches the required height
            child: Text(
              "Final Overview",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 40, // ✅ font-size: 40px
                fontWeight: FontWeight.w700, // ✅ font-weight: 700
                fontStyle: FontStyle.italic, // ✅ font-style: italic
                fontFamily: "Barlow Semi Condensed", // ✅ font-family: Barlow Semi Condensed
                height: 48 / 40, // ✅ line-height: 48px (48/40)
                color: Colors.white, // ✅ Background color applied via text color
              ),
            ),
          ),
          const SizedBox(height: 4), // ✅ Matches gap: 4px
          SizedBox(
            width: 262, // ✅ Matches required width
            height: 21, // ✅ Matches required height
            child: const Text(
              "Check the final look of your webpage.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14, // ✅ font-size: 14px
                fontWeight: FontWeight.w400, // ✅ font-weight: 400
                fontFamily: "Poppins", // ✅ font-family: Poppins
                height: 21 / 14, // ✅ line-height: 21px (21/14)
                color: Colors.white, // ✅ Text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}
