import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonText,
    required this.onTap,
    required this.isEnabled,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.hasIcon = false,
    this.iconPath,
    this.icon,
  });

  final double buttonHeight;
  final double? buttonWidth;
  final String buttonText;
  final VoidCallback onTap;
  final bool isEnabled;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final String? iconPath;
  final Icon? icon;
  final bool hasIcon;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isEnabled ? widget.onTap : null,
      child: Container(
        width: widget.buttonWidth,
        height: widget.buttonHeight,
        padding: widget.padding ?? const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: widget.isEnabled
              ? (widget.backgroundColor ?? Colors.blue)
              : (widget.backgroundColor ?? Colors.blue).withOpacity(0.5),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
            width: widget.isEnabled ? 1 : 0,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.hasIcon) ...[
                widget.icon ??
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: SvgPicture.asset(
                        widget.iconPath ?? 'assets/images/message_icon.svg',
                      ),
                    ),
                const SizedBox(width: 5),
              ],
              Text(
                widget.buttonText,
                style: TextStyle(
                  color: widget.textColor ?? Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
