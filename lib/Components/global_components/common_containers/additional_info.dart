import 'package:flutter/material.dart';
import 'dart:ui';
import '../../../models/global_models/info_element_model.dart';
import '../../D1MM8_components/Membership_section/info_element.dart';



class AdditionalInfo extends StatelessWidget {
  const AdditionalInfo({super.key, required this.width, required this.listOfAdditionalInfo});

  final double width;
  final List<InfoModel> listOfAdditionalInfo;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.circular(10)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: (width / 360) * deviceWidth,
          height: (77 / 800) * deviceHeight,
          color: const Color(0xFF55A6C4).withOpacity(0.3),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(listOfAdditionalInfo.length, (index) {
                return Row(
                  children: [
                    InfoElement(
                      boldInt: listOfAdditionalInfo[index].boldInt,
                      bottomString: listOfAdditionalInfo[index].bottomString,
                      topRightString: listOfAdditionalInfo[index].topRightString,
                    ),
                    if (index != listOfAdditionalInfo.length - 1) // Avoid last divider
                      Container(height: 50, width: 1, color: Colors.black),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}


//
// // import 'package:flutter/material.dart';
// // import 'dart:ui';
// //
// // import 'package:flutter_svg/svg.dart';
// //
// // class AdditionalInfo extends StatefulWidget {
// //   const AdditionalInfo({super.key});
// //
// //   @override
// //   State<AdditionalInfo> createState() => _AdditionalInfoState();
// // }
// //
// // class _AdditionalInfoState extends State<AdditionalInfo> {
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     double deviceHeight = MediaQuery.of(context).size.height;
// //     double deviceWidth = MediaQuery.of(context).size.width;
// //
// //     return ClipRRect(
// //         borderRadius:const BorderRadius.vertical(top: Radius.circular(10), bottom: Radius.circular(10)),
// //         child: Container(
// //           width: (330/360)*deviceWidth,
// //           height: (77/800)*deviceHeight,
// //           color: Color(0xFF48616A).withOpacity(0.30),
// //           child: Stack(
// //             children: [
// //               BackdropFilter(
// //                 filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20,),
// //                 child: Container(
// //                   height: 100,
// //                   width: 100,
// //                   child: Text('Helllooooooo'),
// //                 ),
// //
// //
// //           ),
// //
// //             ],
// //           ),
// //         ),
// //
// //         // BackdropFilter(
// //         //     filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
// //         //     child:  Container(
// //         //       width: (330/360)*deviceWidth,
// //         //       height: (77/800)*deviceHeight,
// //         //       color: Color(0xFF48616A).withOpacity(0.30),
// //         //       child: Row(
// //         //         children: [
// //         //
// //         //
// //         //
// //         //
// //         //           Padding(
// //         //             padding: EdgeInsets.symmetric(vertical:(13/800)*deviceHeight),
// //         //             child: Column(
// //         //               crossAxisAlignment: CrossAxisAlignment.start,
// //         //               mainAxisAlignment: MainAxisAlignment.start,
// //         //               children: [
// //         //
// //         //               ],
// //         //             ),
// //         //           )
// //         //
// //         //
// //         //         ],
// //         //
// //         //       ),
// //         //     )
// //         // )
// //     );
// //   }
// // }
// //
//
//
//
//
//

//
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_svg/svg.dart';
//
// class AdditionalInfo extends StatefulWidget {
//   const AdditionalInfo({super.key});
//
//   @override
//   State<AdditionalInfo> createState() => _AdditionalInfoState();
// }
//
// class _AdditionalInfoState extends State<AdditionalInfo> {
//   @override
//   Widget build(BuildContext context) {
//     double deviceHeight = MediaQuery.of(context).size.height;
//     double deviceWidth = MediaQuery.of(context).size.width;
//
//     return ClipRRect(
//       borderRadius: const BorderRadius.vertical(
//           top: Radius.circular(10),
//           bottom: Radius.circular(10)
//       ),
//       child: Container(
//         width: (330/360) * deviceWidth,
//         height: (77/800) * deviceHeight,
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.vertical(
//               top: Radius.circular(10),
//               bottom: Radius.circular(10)
//           ),
//           color: Color(0xFF48616A).withOpacity(0.75),
//         ),
//         child: Stack(
//           children: [
//             // Blur effect
//             Positioned.fill(
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
//                 child: Container(
//                   color: Colors.transparent,
//                 ),
//               ),
//             ),
//             // Content
//             Row(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                       vertical: (13/800) * deviceHeight
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [],
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
