import 'package:fitbody/app/utils/color_constants.dart';
import 'package:fitbody/app/utils/widgets/text_widgets.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final double? buttonTextSize;
  final FontWeight? fw;
  final double? height;
  final Color? boxColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.buttonTextSize,
    this.fw,
    this.height,
    this.boxColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: height ?? 45,
        decoration: BoxDecoration(
          color: boxColor ?? AppColors.white.withValues(alpha: 0.2),
          border: Border.all(color: AppColors.white,width: 1.5),
          borderRadius: BorderRadius.circular(30),
          backgroundBlendMode: BlendMode.luminosity,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(2, 4),
              color: AppColors.black.withValues(alpha: 0.3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            textScaler: TextScaler.noScaling,
            style: TextWidgets.textStyle(
              fontColor: AppColors.white,
              fontWeight: fw ?? FontWeight.bold,
              fontSize: buttonTextSize ?? 15,
            ),
          ),
        ),
      ),
    );
  }
}
