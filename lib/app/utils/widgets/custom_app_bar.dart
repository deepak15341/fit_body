import 'package:fitbody/app/utils/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../color_constants.dart';

AppBar customAppBar({
  required String title,
  Color? titleColor,
  List<Widget>? actions,
  bool showBack = true,
}) {
  return AppBar(
    iconTheme: IconThemeData(color: titleColor ?? AppColors.yellow),
    leading:
        showBack
            ? IconButton(
              icon: Icon(
                Icons.arrow_left,
                size: 32,
              ), // Use custom or default back icon
              color: titleColor ?? AppColors.yellow,
              onPressed: () {
                if (Get.key.currentState!.canPop()) {
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
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    centerTitle: true,
    actions: actions,
  );
}
