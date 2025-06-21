import 'package:fitbody/app/utils/image_paths.dart';
import 'package:fitbody/app/utils/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets/text_widgets.dart';
import '../controllers/on_boarding_screens_controller.dart';

class OnBoardingScreensView extends GetView<OnBoardingScreensController> {
  const OnBoardingScreensView({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () {
        return Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                itemCount: controller.bgImage.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(controller.bgImage[index]),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
              SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.only(
                            left: 14,
                            right: 14,
                            top: controller.index.value == 0 ? height * 0.28 : height * 0.32,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: controller.index.value == 0 ? null : AppColors.purple,
                          ),
                          child:
                          controller.index.value == 0
                              ? fragment1(context, height)
                              : fragment2(context, controller.index.value, height, width),
                        ),
                        SizedBox(height: height * 0.02),
                        if (controller.index.value != 0)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 100.0,
                            ),
                            child: CustomButton(
                              text:
                              controller.index.value == 1 || controller.index.value == 2
                                  ? Strings.next
                                  : Strings.getStarted,
                              buttonTextSize: 16,
                              fw: FontWeight.w700,
                              onTap: () {
                                controller.onNextTap();
                              },
                            ),
                          ),
                      ],
                    ),
                    if (controller.index.value < controller.bgImage.length - 1)
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: TextButton(
                            onPressed: () {
                              controller.onTapSkip();
                            },
                            child: Text(
                              Strings.skip,
                              style: TextWidgets.textStyle(
                                fontColor: AppColors.yellow,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget fragment1(BuildContext context, height) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        Text(
          '${Strings.welcome} ${Strings.to}',
          textAlign: TextAlign.center,
          style: TextWidgets.textStyle(
            fontColor: AppColors.yellow,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
        Center(
          child: Image.asset(
            IP.appLogo,
            filterQuality: FilterQuality.high,
            scale: 2.8,
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: Strings.fit,
                style: TextWidgets.textStyle(
                  fontColor: AppColors.yellow,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 54,
                ),
              ),
              TextSpan(
                text: Strings.body,
                style: TextWidgets.textStyle(
                  fontColor: AppColors.yellow,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w400,
                  fontSize: 54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget fragment2(BuildContext context, int index, height, width) {
    return Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      children: [
        Center(
          child: Image.asset(
            controller.onBoardIcon[index - 1],
            filterQuality: FilterQuality.high,
            scale: 5.5,
          ),
        ),
        SizedBox(height: height * 0.04),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            Strings.onBoardScreenTextList[index - 1],
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontColor: AppColors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: height * 0.065),
        ...List.generate(3, (index1) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            height: height * 0.003,
            width: width * 0.05,
            color: index == index1 + 1 ? AppColors.white : AppColors.violet,
          );
        }),
      ],
    );
  }
}
