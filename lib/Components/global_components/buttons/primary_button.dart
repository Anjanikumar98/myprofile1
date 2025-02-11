import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonText,
    required this.onTap,
    required this.isEnabled,

    this.icon,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.padding,
    this.backgroundColor,
  });

  final double buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  final VoidCallback onTap;
  final bool isEnabled;

  final Widget? icon;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;


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
        padding: widget.padding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: widget.backgroundColor ??
              (widget.isEnabled
                  ? const Color(0xFFB8FE22)
                  : const Color(0xFFB8FE22).withOpacity(0.5)),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          border: Border.all(
            color: widget.borderColor ?? const Color(0xFFB8FE22),
            width: widget.borderWidth ?? (widget.isEnabled ? 0 : 1),
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
              const SizedBox(width: 8),
              widget.icon!,
            ],
          ],
        ),
      ),
    );
  }
}
