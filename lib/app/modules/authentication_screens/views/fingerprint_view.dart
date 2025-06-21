import 'package:fitbody/app/modules/authentication_screens/controllers/authentication_screens_controller.dart';
import 'package:fitbody/app/utils/image_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets/custom_app_bar.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/text_widgets.dart';

class FingerPrintScreenView extends GetView<AuthenticationScreensController> {
  const FingerPrintScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(title: Strings.setFingerprint),
      body: SafeArea(
        child: ListView(padding: EdgeInsets.only(left: 14, right: 14),
          children: [
            SizedBox(height: height * 0.1),
            Text(
              Strings.fingerPrintDescription,
              textAlign: TextAlign.center,
              style: TextWidgets.textStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.04),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.purple,
              ),
              child: Image.asset(
                IP.fingerPrintImage,
                height: height * 0.3,
                width: width * 0.3,
              ),
            ),
            SizedBox(height: height * 0.07),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.22),
              child: CustomButton(
                text: Strings.skip,
                height: height * 0.045,
                buttonTextSize: 18,
                fw: FontWeight.w600,
                onTap: () {
                  controller.onSkipTap();
                },
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.22),
              child: CustomButton(
                text: Strings.cont,
                height: height * 0.045,
                buttonTextSize: 18,
                fw: FontWeight.w600,
                onTap: () {
                  controller.onFingerPrintContinueTap();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
