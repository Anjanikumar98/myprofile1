import 'package:flutter/material.dart';

class InfoElement extends StatelessWidget {
  const InfoElement(
      {super.key,
      required this.boldInt,
      required this.bottomString,
      required this.topRightString});

  final String bottomString;
  final String boldInt;
  final String topRightString;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //decoration: BoxDecoration(border: Border.all(color: Colors.white)),
      height: 61,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(4),
            child: SizedBox(
              height: 30,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    boldInt.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: (25),
                        fontFamily: 'Barlow_Semi_Condensed',
                        color: Color(0xFFB8FE22),
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  SizedBox(
                    child: Text(
                      topRightString,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 10,
                          fontFamily: 'Poppins',
                          color: Color(0xFFB8FE22),
                          fontStyle: FontStyle.italic),
                    ),
                  ),  
                ],
              ),
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(4),
          // child: Container(
          //     height: 0.5,
          //     width: 20,
          //     color: Color(0xFF55A6C4).withOpacity(0.6),
          // ),
          // ),

          // Divider(
          //   indent: 10,
          //   endIndent: 10,
          //   color: Colors.black,//Color(0xFF55A6C4).withOpacity(0.6),
          //   height: 1,
          // ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 5),
            child: Text(
              bottomString,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                fontFamily: 'Poppins',
                color: Colors.white,
                //fontStyle: FontStyle.italic
              ),
            ),
          )
        ],
      ),
    );
  }
}

// return SizedBox(
//   width: 38.72, // Fixed width
//   height: 33.96, // Fixed height
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     children: [
//       Padding(
//         padding: EdgeInsets.all(2.24), // Padding applied
//         child: SizedBox(
//           height: 17, // Upper element height
//           width: 14, // Upper element width
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 boldInt.toString(),
//                 style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   fontSize: 14, // Adjusted to fit 14px width
//                   fontFamily: 'Barlow_Semi_Condensed',
//                   color: Color(0xFFB8FE22),
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//               SizedBox(width: 2.24), // Gap
//               Text(
//                 topRightString,
//                 style: TextStyle(
//                   fontWeight: FontWeight.w500,
//                   fontSize: 8, // Adjusted to fit 18px width
//                   fontFamily: 'Poppins',
//                   color: Color(0xFFB8FE22),
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 2.24), // Adjusted padding
//         child: SizedBox(
//           width: 25, // Fixed width for bottom text
//           height: 8, // Fixed height for bottom text
//           child: Text(
//             bottomString,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 8, // Adjusted to fit 8px height
//               fontFamily: 'Poppins',
//               color: Colors.white,
//             ),
//           ),
//         ),
//       )
//     ],
//   ),
// );
