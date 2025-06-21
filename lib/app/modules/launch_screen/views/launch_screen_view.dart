import 'package:fitbody/app/utils/image_paths.dart';
import 'package:fitbody/app/utils/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/strings.dart';

class LaunchScreenView extends StatefulWidget {
  const LaunchScreenView({super.key});

  @override
  State<LaunchScreenView> createState() => _LaunchScreenViewState();
}

class _LaunchScreenViewState extends State<LaunchScreenView> {
  @override
  void initState() {
    super.initState();
    callOnBoardingScreen();
  }

  void callOnBoardingScreen() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(Routes.onBoardScreens);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                IP.appLogo,
                filterQuality: FilterQuality.high,
                scale: 5.5,
              ),
            ),
            RichText(textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: Strings.fit,
                    style: TextWidgets.textStyle(
                      fontColor: AppColors.yellow,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                    ),
                  ),
                  TextSpan(
                    text: Strings.body,
                    style: TextWidgets.textStyle(
                      fontColor: AppColors.yellow,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
