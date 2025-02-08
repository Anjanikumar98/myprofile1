import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonText,
    required this.onTap,
    required this.isEnabled,
    this.icon, this.borderColor, this.borderWidth, // ✅ Made optional
  });

  final double buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  final VoidCallback onTap;
  final bool isEnabled;
  final Widget? icon; // ✅ Optional icon parameter
  final dynamic borderColor;
  final dynamic borderWidth;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
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
            width: widget.isEnabled ? 0 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.buttonText,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (widget.icon != null) ...[
              const SizedBox(width: 8), // Adds spacing between text and icon
              widget.icon!,
            ],
          ],
        ),
      ),
    );
  }
}
