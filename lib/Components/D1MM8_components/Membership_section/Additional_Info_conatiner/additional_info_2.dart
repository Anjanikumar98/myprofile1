import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../../models/global_models/info_element_model.dart';
import 'Info_element_container/Info_element_2.dart';

class AdditionalInfo2 extends StatelessWidget {
  const AdditionalInfo2({
    super.key,
    required this.listOfAdditionalInfo,
  });

  final List<InfoModel> listOfAdditionalInfo;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.6), // Border radius as per design
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          width: 188.79, // Fixed width
          height: 42.93, // Fixed height
          padding: const EdgeInsets.fromLTRB(
              11.21, 4.48, 11.21, 4.48), // Defined padding
          decoration: BoxDecoration(
            color: const Color(0xFF55A6C4)
                .withOpacity(0.3), // Background color with opacity
            borderRadius: BorderRadius.circular(5.6), // Border radius
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Ensures spacing as per design
            children: [
              Expanded(
                child: InfoElement2(
                  boldInt: listOfAdditionalInfo[0].boldInt,
                  bottomString: listOfAdditionalInfo[0].bottomString,
                  topRightString: listOfAdditionalInfo[0].topRightString,
                ),
              ),
              VerticalDivider(
                width: 0.56, // Border width
                thickness: 0.56,
                color: const Color(0xFF063434), // Divider color
              ),
              Expanded(
                child: InfoElement2(
                  boldInt: listOfAdditionalInfo[1].boldInt,
                  bottomString: listOfAdditionalInfo[1].bottomString,
                  topRightString: listOfAdditionalInfo[1].topRightString,
                ),
              ),
              VerticalDivider(
                width: 0.56, // Border width
                thickness: 0.56,
                color: const Color(0xFF063434), // Divider color
              ),
              Expanded(
                child: InfoElement2(
                  boldInt: listOfAdditionalInfo[2].boldInt,
                  bottomString: listOfAdditionalInfo[2].bottomString,
                  topRightString: listOfAdditionalInfo[2].topRightString,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
