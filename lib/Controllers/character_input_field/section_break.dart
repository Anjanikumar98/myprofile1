import 'package:flutter/material.dart';

class SectionBreak extends StatelessWidget {
  const SectionBreak(
      {super.key,
      required this.sectionTitle,
      required this.sectionDescription,
      required this.optional});

  final String sectionTitle;
  final String sectionDescription;
  final bool optional;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 21,
                  child: Text(
                    sectionTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                optional == true
                    ? SizedBox(
                        child: Text(
                          '(Optional)',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    : Container()
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                height: 0.2,
                width: 314,
                color: Color(0xFFF4F4F4),
              ),
            ),
            Container(
              width: 314,
              child: Text(
                sectionDescription,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
