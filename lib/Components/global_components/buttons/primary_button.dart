import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton(
      {super.key,
      required this.buttonWidth,
      required this.buttonHeight,
      required this.buttonText,
      //required this.uniqueButtonId,
      required this.onTap,
      required this.isEnabled});

  final double buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  //final String uniqueButtonId;
  final VoidCallback onTap;
  final bool isEnabled;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.onTap();
        },
        child: Container(
          width: widget.buttonWidth,
          height: widget.buttonHeight,
          decoration: BoxDecoration(
              color: widget.isEnabled
                  ? const Color(0xFFB8FE22)
                  : const Color(0xFFB8FE22).withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  color: const Color(0xFFB8FE22),
                  width: widget.isEnabled ? 0 : 1)),
          child: Center(
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ));
  }
}
