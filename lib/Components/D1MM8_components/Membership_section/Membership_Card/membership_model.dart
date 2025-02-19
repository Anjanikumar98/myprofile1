import 'dart:ui';
import 'package:get/get.dart';

class MembershipPlanConstants {
  static double get baseDeviceWidth => Get.width;
  static double get baseDeviceHeight => Get.height;

  static double scaleWidth(double value) => (value / 360) * baseDeviceWidth;
  static double scaleHeight(double value) => (value / 800) * baseDeviceHeight;

  static double get baseWidth => scaleWidth(200);
  static double get recommendedHeight => scaleHeight(428.99);
  static double get standardHeight => scaleHeight(405.26);
  static double get gapBase => scaleHeight(5.6);
  static double get borderBase => scaleWidth(1.12);
  static double get blurBase => scaleWidth(28.01);
}

class MembershipPlanColors {
  static const Color recommendedBorder = Color(0xFFB8FE22);
  static const Color standardBorder = Color(0xFF376C7F);
}

class MembershipPlanModel {
  final String hoverText;
  final double width;
  final double height;
  final double gap;
  final double borderRadius;
  final double borderWidth;
  final double padding;
  final Color borderColor;
  final double backdropBlur;
  final bool isRecommended;
  final Color? recommendedBorderColor;

  MembershipPlanModel._({
    required this.hoverText,
    required this.width,
    required this.height,
    required this.gap,
    required this.borderRadius,
    required this.borderWidth,
    required this.padding,
    required this.borderColor,
    required this.backdropBlur,
    required this.isRecommended,
    this.recommendedBorderColor,
  });

  factory MembershipPlanModel({
    required String hoverText,
    required bool isRecommended,
  }) {
    return MembershipPlanModel._(
      hoverText: hoverText,
      isRecommended: isRecommended,
      width: MembershipPlanConstants.baseWidth,
      height: isRecommended
          ? MembershipPlanConstants.recommendedHeight
          : MembershipPlanConstants.standardHeight,
      gap: MembershipPlanConstants.gapBase,
      borderRadius: MembershipPlanConstants.gapBase,
      borderWidth: MembershipPlanConstants.borderBase,
      padding: MembershipPlanConstants.gapBase,
      borderColor: isRecommended
          ? MembershipPlanColors.recommendedBorder
          : MembershipPlanColors.standardBorder,
      backdropBlur: MembershipPlanConstants.blurBase,
      recommendedBorderColor:
      isRecommended ? MembershipPlanColors.recommendedBorder : null,
    );
  }

  MembershipPlanModel copyWith({
    String? hoverText,
    bool? isRecommended,
    double? width,
    double? height,
    double? gap,
    double? borderRadius,
    double? borderWidth,
    double? padding,
    Color? borderColor,
    double? backdropBlur,
    Color? recommendedBorderColor,
  }) {
    return MembershipPlanModel._(
      hoverText: hoverText ?? this.hoverText,
      isRecommended: isRecommended ?? this.isRecommended,
      width: width ?? this.width,
      height: height ?? this.height,
      gap: gap ?? this.gap,
      borderRadius: borderRadius ?? this.borderRadius,
      borderWidth: borderWidth ?? this.borderWidth,
      padding: padding ?? this.padding,
      borderColor: borderColor ?? this.borderColor,
      backdropBlur: backdropBlur ?? this.backdropBlur,
      recommendedBorderColor:
      recommendedBorderColor ?? this.recommendedBorderColor,
    );
  }

  @override
  String toString() {
    return 'MembershipPlanModel(hoverText: $hoverText, '
        'isRecommended: $isRecommended, '
        'width: $width, '
        'height: $height, '
        'gap: $gap, '
        'borderRadius: $borderRadius, '
        'borderWidth: $borderWidth, '
        'padding: $padding, '
        'borderColor: $borderColor, '
        'backdropBlur: $backdropBlur, '
        'recommendedBorderColor: $recommendedBorderColor)';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MembershipPlanModel &&
              hoverText == other.hoverText &&
              isRecommended == other.isRecommended &&
              width == other.width &&
              height == other.height &&
              gap == other.gap &&
              borderRadius == other.borderRadius &&
              borderWidth == other.borderWidth &&
              padding == other.padding &&
              borderColor == other.borderColor &&
              backdropBlur == other.backdropBlur &&
              recommendedBorderColor == other.recommendedBorderColor;

  @override
  int get hashCode => Object.hash(
    hoverText,
    isRecommended,
    width,
    height,
    gap,
    borderRadius,
    borderWidth,
    padding,
    borderColor,
    backdropBlur,
    recommendedBorderColor,
  );
}
