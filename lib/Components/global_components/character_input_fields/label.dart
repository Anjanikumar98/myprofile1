import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  final String fieldLabel;
  final String optionalTextAvailable;
  final Widget? description;

  const Label({
    super.key,
    required this.fieldLabel,
    required this.optionalTextAvailable,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(
          0xFF1E1E1E), // Background color updated to match your provided image
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: fieldLabel,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.0,
                color: Colors.white,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: optionalTextAvailable,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w300,
                    height: 1.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          if (description != null) description!,
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class Label extends StatelessWidget {
//   final String fieldLabel;
//   final String optionalTextAvailable;
//   final Widget? description;
//   final double? width;
//   final double? height;
//   final EdgeInsetsGeometry? padding;
//   final double? gap;
//
//   const Label({
//     super.key,
//     required this.fieldLabel,
//     required this.optionalTextAvailable,
//     this.description,
//     this.width,
//     this.height,
//     this.padding,
//     this.gap,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     double deviceWidth = MediaQuery.of(context).size.width;
//     double deviceHeight = MediaQuery.of(context).size.height;
//
//     return Padding(
//       padding: padding ?? EdgeInsets.only(
//         top: (20 / 800) * deviceHeight,
//         left: (20 / 360) * deviceWidth,
//       ), // Default padding (top & left)
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: width ?? (214 / 360) * deviceWidth,
//             height: height ?? (18 / 800) * deviceHeight,
//             color: const Color(0xFF1E1E1E), // Background color
//             child: RichText(
//               text: TextSpan(
//                 text: fieldLabel,
//                 style: TextStyle(
//                   fontSize: (14 / 800) * deviceHeight,
//                   fontWeight: FontWeight.w400,
//                   height: 1.0,
//                   color: Colors.white,
//                 ),
//                 children: <TextSpan>[
//                   TextSpan(
//                     text: optionalTextAvailable,
//                     style: TextStyle(
//                       fontSize: (10 / 800) * deviceHeight,
//                       fontWeight: FontWeight.w300,
//                       height: 1.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: gap ?? (2 / 800) * deviceHeight), // Default gap of 2px
//           if (description != null) description!,
//         ],
//       ),
//     );
//   }
// }

