import 'dart:math' as math;

import 'package:fitbody/app/utils/image_paths.dart';
import 'package:fitbody/app/utils/strings.dart';
import 'package:fitbody/app/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/color_constants.dart';
import '../../../utils/widgets/text_widgets.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(
        title: '${Strings.hi}${Strings.deepak}',
        titleColor: AppColors.purple,
        titleSize: 32,
        centreTitle: false,
        titleSpacing: 30,
        actionPadding: 30,
        showBack: false,
        actions: List.generate(controller.appBarIcons.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(controller.appBarIcons[index], color: AppColors.purple),
          );
        }),
      ),
      
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Strings.challengeLimits,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 10,
                  style: TextWidgets.textStyle(
                    fontSize: 14,
                    fontColor: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            topIconRow(width, height),
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            Strings.recommendation,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 10,
                            style: TextWidgets.textStyle(
                              fontSize: 16,
                              fontColor: AppColors.yellow,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Flexible(
                                child: Text(
                                  Strings.seeAll,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 10,
                                  style: TextWidgets.textStyle(
                                    fontSize: 16,
                                    fontColor: AppColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Transform.rotate(
                                angle: -math.pi / 2,
                                child: Icon(
                                  Icons.arrow_drop_down_rounded,
                                  color: AppColors.yellow,
                                  size: 50,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  recommendationCards(width, height),
                  SizedBox(height: height * 0.04),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.scaffoldColor,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  Strings.weekChallenge,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 10,
                                  style: TextWidgets.textStyle(
                                    fontSize: 25,
                                    fontColor: AppColors.yellow,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  Strings.plankTwist,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 10,
                                  style: TextWidgets.textStyle(
                                    fontSize: 14,
                                    fontColor: AppColors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Image.asset(
                            IP.weeklyChallenge,
                            height: height * 0.15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      Strings.articleTips,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      maxLines: 10,
                      style: TextWidgets.textStyle(
                        fontSize: 15,
                        fontColor: AppColors.yellow,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  articleRow(width, height),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  articleRow(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(controller.articleImageList.length, (index) {
          return Expanded(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      controller.articleImageList[index],
                      width: width * 0.4,
                      height: height * 0.175,
                    ),
                    Positioned(
                      right: 5,
                      top: 15,
                      child: Icon(Icons.star, color: AppColors.yellow),
                    ),
                  ],
                ),
                Text(
                  Strings.articleStringList[index],
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  maxLines: 10,
                  style: TextWidgets.textStyle(
                    fontSize: 14,
                    fontColor: AppColors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  recommendationCards(double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(controller.cardImage.length, (index) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.scaffoldColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                width: width / 2.5,
                child: Column(
                  children: [
                    Image.asset(
                      controller.cardImage[index],
                      height: height * 0.11,
                      width: width / 2.5,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                        border: Border(
                          bottom: BorderSide(color: AppColors.white),
                          left: BorderSide(color: AppColors.white),
                          right: BorderSide(color: AppColors.white),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Strings.dashboardCardStrings[index],
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            maxLines: 10,
                            style: TextWidgets.textStyle(
                              fontSize: 14,
                              fontColor: AppColors.yellow,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: height * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              Strings.dashboardCardInnerStrings.length,
                              (index1) {
                                return Flexible(
                                  child: Row(
                                    children: [
                                      Icon(
                                        controller
                                            .dashboardCardInnerIcons[index][index1],
                                        size: 14,
                                        color: AppColors.purple,
                                      ),
                                      SizedBox(width: width * 0.01),
                                      Flexible(
                                        child: Text(
                                          Strings
                                              .dashboardCardInnerStrings[index][index1],
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.left,
                                          maxLines: 10,
                                          style: TextWidgets.textStyle(
                                            fontSize: 10,
                                            fontColor: AppColors.yellow,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Icon(Icons.star, color: AppColors.yellow),
              ),
              Positioned(
                right: height * 0.01,
                top: height * 0.095,
                child: Image.asset(IP.play, scale: 3.5),
              ),
            ],
          );
        }),
      ),
    );
  }

  topIconRow(double width, double height) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 2,
          children: List.generate(controller.topImages.length, (index) {
            return Row(
              spacing: 2,
              children: [
                InkWell(
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  onTap: () {
                    controller.selectedTopImage.value =
                        controller.topImages[index];
                  },
                  child: SizedBox(
                    width: width * 0.195,
                    child: Column(
                      children: [
                        Image.asset(
                          controller.topImages[index],
                          color:
                              controller.selectedTopImage.value ==
                                      controller.topImages[index]
                                  ? AppColors.yellow
                                  : AppColors.purple,
                          scale:
                              index == controller.topImages.length - 1 ? 3 : 4,
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          Strings.dashboardTopIconStrings[index],
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: TextWidgets.textStyle(
                            fontSize: 14,
                            fontColor:
                                controller.selectedTopImage.value ==
                                        controller.topImages[index]
                                    ? AppColors.yellow
                                    : AppColors.purple,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (index != controller.topImages.length - 1)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 50,
                    width: 1,
                    color: AppColors.purple,
                  ),
              ],
            );
          }),
        ),
      );
    });
  }
}
