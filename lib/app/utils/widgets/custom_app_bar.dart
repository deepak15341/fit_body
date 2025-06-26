import 'package:fitbody/app/utils/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color_constants.dart';

AppBar customAppBar({
  required String title,
  Color? titleColor,
  Color? backButtonColor,
  double? titleSize,
  List<Widget>? actions,
  Function? onBackPressed,
  bool showBack = true,
  bool centreTitle = true,
  double? titleSpacing,
  double? actionPadding,
  Color? backgroundColor,
}) {
  return AppBar(
    titleSpacing: titleSpacing,
    backgroundColor: backgroundColor,
    actionsPadding: EdgeInsets.only(right: actionPadding ?? 0),
    iconTheme: IconThemeData(color: titleColor ?? AppColors.yellow),
    leading:
        showBack
            ? IconButton(
              icon: Icon(
                Icons.arrow_left,
                size: 32,
              ), // Use custom or default back icon
              color: backButtonColor ?? AppColors.yellow,
              onPressed: () {
                if (onBackPressed != null) {
                  onBackPressed();
                } else if (Get.key.currentState!.canPop()) {
                  Get.back();
                }
              },
            )
            : null,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextWidgets.textStyle(
        fontColor: titleColor ?? AppColors.yellow,
        fontSize: titleSize ?? 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    centerTitle: centreTitle,
    actions: actions,
  );
}
