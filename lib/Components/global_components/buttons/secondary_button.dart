import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({
    super.key,
    required this.width,
    required this.height,
    this.primaryText,
    required this.secondaryText,
    required this.isEnabled,
    required this.isPrimary,
    required this.hasIcon,
    this.iconPath,
    required this.OnTap,
    this.borderWidth,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  final double height;
  final double width;
  final String? primaryText;
  final String secondaryText;
  final bool isEnabled;
  final bool isPrimary;
  final String? iconPath;
  final bool hasIcon;
  final VoidCallback OnTap;

  final double? borderWidth;
  final Color? borderColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.OnTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: widget.padding ?? EdgeInsets.zero,
        decoration: BoxDecoration(
          color: widget.isEnabled && widget.isPrimary
              ? const Color(0xFF55A6C4)
              : Colors.transparent,
          border: Border.all(
            color: widget.borderColor ??
                (widget.isPrimary && widget.isEnabled
                    ? Colors.transparent
                    : !widget.isPrimary && widget.isEnabled
                        ? const Color(0xFF55A6C4)
                        : widget.isPrimary && !widget.isEnabled
                            ? const Color(0xFF4D7584)
                            : Colors.transparent),
            width: widget.borderWidth ??
                (widget.isPrimary && widget.isEnabled
                    ? 0
                    : !widget.isPrimary && widget.isEnabled
                        ? 2
                        : widget.isPrimary && !widget.isEnabled
                            ? 1
                            : 0),
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
        ),
        child: Center(
          child: widget.isPrimary && widget.isEnabled
              ? _buildButtonContent(
                  widget.hasIcon,
                  widget.iconPath ?? 'assets/images/edit_icon.svg',
                  widget.primaryText ?? '',
                )
              : !widget.isPrimary && widget.isEnabled
                  ? _buildButtonContent(
                      widget.hasIcon,
                      widget.iconPath ?? 'assets/images/edit_icon.svg',
                      widget.secondaryText,
                    )
                  : widget.isPrimary && !widget.isEnabled
                      ? Text(
                          widget.primaryText ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )
                      : Text(
                          widget.primaryText ?? '',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
        ),
      ),
    );
  }

  Widget _buildButtonContent(bool hasIcon, String iconPath, String text) {
    if (hasIcon) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16,
            height: 16,
            child: SvgPicture.asset(iconPath),
          ),
          const SizedBox(width: 5),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          )
        ],
      );
    } else {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      );
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class SecondaryButton extends StatefulWidget {
//   const SecondaryButton(
//       {super.key,
//       required this.width,
//       required this.height,
//       this.primaryText,
//       required this.secondaryText,
//       required this.isEnabled,
//       required this.isPrimary,
//       required this.hasIcon,
//       this.iconPath /*,this.onTap*/
//       });
//
//   final double height;
//   final double width;
//   final String? primaryText;
//   final String secondaryText;
//   final bool isEnabled;
//   final bool isPrimary;
//   final String? iconPath;
//   final bool hasIcon;
//
//   //final VoidCallback? onTap;
//
//   @override
//   State<SecondaryButton> createState() => _SecondaryButtonState();
// }
//
// class _SecondaryButtonState extends State<SecondaryButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: widget.width,
//         height: widget.height,
//         decoration: BoxDecoration(
//           color: widget.isEnabled && widget.isPrimary
//               ? const Color(0xFF55A6C4)
//               : Colors.transparent,
//           border: Border.all(
//             color: widget.isPrimary && widget.isEnabled
//                 ? Colors.transparent
//                 : !widget.isPrimary && widget.isEnabled
//                     ? const Color(0xFF55A6C4)
//                     : widget.isPrimary && !widget.isEnabled
//                         ? const Color(0xFF4D7584)
//                         : Colors.transparent,
//             width: widget.isPrimary && widget.isEnabled
//                 ? 0
//                 : !widget.isPrimary && widget.isEnabled
//                     ? 2
//                     : widget.isPrimary && !widget.isEnabled
//                         ? 1
//                         : 0,
//           ),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: widget.isPrimary && widget.isEnabled
//             ? widget.hasIcon
//                 ? Center(
//                     child: Row(
//                     children: [
//                       SizedBox(
//                         width: 16,
//                         height: 16,
//                         child: SvgPicture.asset(
//                             widget.iconPath ?? 'assets/images/edit_icon.svg'),
//                       ),
//                       SizedBox(width: 5),
//                       Text(
//                         widget.primaryText ?? '',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//
//                             fontSize: 14),
//                       )
//                     ],
//                   ))
//                 : Center(
//                     child: Text(
//                     widget.primaryText ?? '',
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//
//                         fontSize: 14),
//                   ))
//             : !widget.isPrimary && widget.isEnabled
//                 ? widget.hasIcon
//                     ? Center(
//                         child: Row(
//                         children: [
//                           SizedBox(
//                             width: 16,
//                             height: 16,
//                             child: SvgPicture.asset(widget.iconPath ??
//                                 'assets/images/edit_icon.svg'),
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             widget.secondaryText ?? '',
//                             textAlign: TextAlign.center,
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//
//                                 fontSize: 14),
//                           )
//                         ],
//                       ))
//                     : Center(
//                         child: Text(
//                         widget.secondaryText,
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//
//                             fontSize: 14),
//                       ))
//                 :
//                 //Center(child: Text(widget.secondaryText, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500,  fontSize: 14),)) :
//                 widget.isPrimary && !widget.isEnabled
//                     ? Center(
//                         child: Text(
//                         widget.primaryText ?? '',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                             color: Color(0xFFCCCCCC),
//                             fontWeight: FontWeight.w500,
//
//                             fontSize: 14),
//                       ))
//                     : Center(
//                         child: Text(
//                         widget.primaryText ?? '',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//
//                             fontSize: 14),
//                       )));
//   }
// }
