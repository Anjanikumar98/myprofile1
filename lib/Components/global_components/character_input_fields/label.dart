import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label(
      {super.key,
      required this.fieldLabel,
      required this.optionalTextAvailable,
      this.optionalText});

  final String fieldLabel;
  final bool optionalTextAvailable;
  final String? optionalText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18,
      //width: 214,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
            child: Text(
              fieldLabel,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          optionalTextAvailable
              ? Padding(
                  padding: const EdgeInsets.only(left: 5, top: 3, bottom: 3),
                  child: SizedBox(
                    child: Text(
                      '(${optionalText})',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
