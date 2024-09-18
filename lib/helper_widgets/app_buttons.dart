import 'package:flutter/material.dart';
import 'package:week_calandhar/helper_widgets/app_colors.dart';
import 'package:week_calandhar/helper_widgets/app_text.dart';


class AppButtons extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxBorder? border;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? borderRadius;
  final Color? color;
  final VoidCallback? onTap;
  final String text;
  final double? textSize;
  final double? borderWidth;
  final Color? textColor;
  final Color? borderColor;
  final IconData? icon;
  final FontWeight? fontWeight;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;
  final String? fontFamily;

  const AppButtons(
      {super.key,
      this.height,
      this.width,
      this.icon,
      this.margin,
      this.padding,
      this.borderRadius,
      this.border,
      this.color,
      this.onTap,
      this.alignment = Alignment.center,
      required this.text,
      this.textSize,
      this.textColor,
      this.fontWeight,
      this.boxShadow,
      this.child,
      this.gradient,
      this.borderWidth,
      this.borderColor,
      this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: padding,
        alignment: alignment,
        decoration: BoxDecoration(
            border: border ?? Border.all(color: borderColor ?? Colors.transparent, width: borderWidth ?? 0.0),
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
            color: color ?? AppColors.appColor,
            gradient: gradient,
            boxShadow: boxShadow),
        child: child ??
            AppText(
              text: text,
              textSize: textSize ?? 15,
              color: textColor ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.w600,
            ),
      ),
    );
  }
}
