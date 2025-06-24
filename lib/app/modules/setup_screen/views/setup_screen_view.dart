import 'package:fitbody/app/utils/color_constants.dart';
import 'package:fitbody/app/utils/image_paths.dart';
import 'package:fitbody/app/utils/strings.dart';
import 'package:fitbody/app/utils/widgets/app_text_field.dart';
import 'package:fitbody/app/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/age_picker.dart';
import '../../../utils/widgets/sclae_ruler.dart';
import '../../../utils/widgets/text_widgets.dart';
import '../controllers/setup_screen_controller.dart';

class SetupScreenView extends GetView<SetupScreenController> {
  const SetupScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Obx(() {
      return Scaffold(
        appBar:
            controller.fragmentIndex.value != 0
                ? customAppBar(
                  title: Strings.back,
                  centreTitle: false,
                  onBackPressed: () {
                    controller.onBackPressed();
                  },
                )
                : null,
        body: Column(
          children: [
            Expanded(
              child: controller.fragmentPages[controller.fragmentIndex.value],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: width * 0.25,
                right: width * 0.25,
                bottom: height * 0.04,
              ),
              child: CustomButton(
                text:
                    controller.fragmentIndex.value == 0
                        ? Strings.next
                        : controller.fragmentIndex.value ==
                            controller.fragmentPages.length - 1
                        ? Strings.start
                        : Strings.cont,
                height: height * 0.05,
                buttonTextSize: 18,
                fw: FontWeight.w600,
                onTap: () {
                  controller.onTapNext(context);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

class Fragment1 extends GetView<SetupScreenController> {
  const Fragment1({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Image.asset(IP.setupBackground1),
        SizedBox(height: height * 0.02),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Strings.setUpDescription,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 32,
              fontColor: AppColors.yellow,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: height * 0.04),
        Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.purple,
          ),
          child: Text(
            controller.setupDescription,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 16,
              fontColor: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class Fragment2 extends GetView<SetupScreenController> {
  const Fragment2({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(height: height * 0.05),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            Strings.whatsYourGender,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 32,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: height * 0.04),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: AppColors.purple,
          ),
          child: Text(
            Strings.selectGender,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 16,
              fontColor: AppColors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Obx(() {
          return getGender(height);
        }),
      ],
    );
  }

  Column getGender(height) {
    return Column(
      children: List.generate(2, (index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                controller.selectedGender.value = index;
              },
              splashColor: AppColors.transparent,
              highlightColor: AppColors.transparent,
              child: Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.only(
                  top: height * 0.04,
                  bottom: height * 0.01,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        controller.selectedGender.value == index
                            ? AppColors.yellow
                            : AppColors.white,
                  ),
                  shape: BoxShape.circle,
                  color:
                      controller.selectedGender.value == index
                          ? AppColors.yellow
                          : AppColors.white.withValues(alpha: 0.2),
                ),
                child: Icon(
                  controller.icon[index],
                  size: 100,
                  color:
                      controller.selectedGender.value == index
                          ? AppColors.black
                          : AppColors.white,
                ),
              ),
            ),
            Text(
              Strings.genderList[index],
              textAlign: TextAlign.center,
              style: TextWidgets.textStyle(
                fontSize: 20,
                fontColor: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class Fragment3 extends GetView<SetupScreenController> {
  const Fragment3({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(height: height * 0.04),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            Strings.ageQuestion,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 32,
              fontColor: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: height * 0.05),
        Text(
          Strings.selectAgeDesc,
          textAlign: TextAlign.center,
          style: TextWidgets.textStyle(
            fontSize: 14,
            fontColor: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: height * 0.06),
        Obx(() {
          return Column(
            children: [
              Text(
                controller.selectedAge.value.toString(),
                textAlign: TextAlign.center,
                style: TextWidgets.textStyle(
                  fontSize: 52,
                  fontColor: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.arrow_drop_up_rounded,
                color: AppColors.yellow,
                size: 80,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: AgePicker(
                      height: 100,
                      backgroundColor: AppColors.purple,
                      activeItemTextColor: AppColors.yellow,
                      passiveItemsTextColor: AppColors.white,
                      initialValue: controller.selectedAge.value,
                      onChanged: (value) {
                        controller.selectedAge.value = value.toInt();
                      },
                      divisions: 104,
                      maxValue: 120,
                      minValue: 16,
                      textSize: 32,
                      barHeight: 25,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 110,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: AppColors.yellow),
                            right: BorderSide(color: AppColors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ],
    );
  }
}

class Fragment4 extends GetView<SetupScreenController> {
  const Fragment4({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(height: height * 0.04),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            Strings.weightQuestion,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 32,
              fontColor: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: height * 0.05),
        Text(
          Strings.selectWeightDesc,
          textAlign: TextAlign.center,
          style: TextWidgets.textStyle(
            fontSize: 14,
            fontColor: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: height * 0.06),
        Obx(() {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 60),
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.selectedWeightStandard.value = Strings.kg;
                      },
                      child: Text(
                        Strings.kg,
                        textAlign: TextAlign.center,
                        style: TextWidgets.textStyle(
                          fontSize: 20,
                          fontColor:
                              controller.selectedWeightStandard.value ==
                                      Strings.kg
                                  ? AppColors.black
                                  : AppColors.gray,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      width: 2.5,
                      decoration: BoxDecoration(
                        color: AppColors.black,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.selectedWeightStandard.value = Strings.lb;
                      },
                      child: Text(
                        Strings.lb,
                        textAlign: TextAlign.center,
                        style: TextWidgets.textStyle(
                          fontSize: 20,
                          fontColor:
                              controller.selectedWeightStandard.value ==
                                      Strings.lb
                                  ? AppColors.black
                                  : AppColors.gray,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.06),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: AgePicker(
                      height: 100,
                      backgroundColor: AppColors.purple,
                      activeItemTextColor: AppColors.yellow,
                      passiveItemsTextColor: AppColors.white,
                      initialValue: controller.selectedAge.value,
                      onChanged: (value) {
                        controller.selectedWeight.value = value.toInt();
                      },
                      divisions: 400 - 16,
                      maxValue: 400,
                      minValue: 16,
                      textSize: 32,
                      barHeight: 25,
                    ),
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 110,
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(color: AppColors.yellow),
                            right: BorderSide(color: AppColors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_drop_up_rounded,
                color: AppColors.yellow,
                size: 80,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: controller.selectedWeight.value.toString(),
                      style: TextWidgets.textStyle(
                        fontSize: 52,
                        fontColor: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: controller.selectedWeightStandard.value,
                      style: TextWidgets.textStyle(
                        fontSize: 18,
                        fontColor: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class Fragment5 extends GetView<SetupScreenController> {
  const Fragment5({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(height: height * 0.04),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            Strings.heightQuestion,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 32,
              fontColor: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: height * 0.05),
        Text(
          Strings.selectHeightDesc,
          textAlign: TextAlign.center,
          style: TextWidgets.textStyle(
            fontSize: 14,
            fontColor: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: height * 0.05),
        Obx(() {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: height / 2,
                margin: EdgeInsets.only(left: width / 2.2, right: width / 4.2),
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: SimpleRulerPicker(
                  minValue: 0,
                  maxValue: 280,
                  initialValue: 50,
                  onValueChanged: (value) {
                    controller.selectedHeight.value = value;
                  },
                  scaleLabelSize: 22,
                  scaleBottomPadding: 8,
                  scaleItemWidth: 12,
                  longLineHeight: 30,
                  shortLineHeight: 15,
                  lineColor: AppColors.white,
                  selectedColor: AppColors.yellow,
                  labelColor: AppColors.white,
                  lineStroke: 2.75,
                  axis: Axis.vertical,
                  height: 300,
                  pointerFontSize: 22,
                  pointerIconSize: 35,
                ),
              ),
              Positioned(
                right: width / 2.25,
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: controller.selectedHeight.value.toString(),
                            style: TextWidgets.textStyle(
                              fontSize: 42,
                              fontColor: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                            text: Strings.cm,
                            style: TextWidgets.textStyle(
                              fontSize: 18,
                              fontColor: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.navigate_next_rounded,
                      color: AppColors.yellow,
                      size: 50,
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class Fragment6 extends GetView<SetupScreenController> {
  const Fragment6({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(height: height * 0.04),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            Strings.goalQuestion,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 32,
              fontColor: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: height * 0.05),
        Text(
          Strings.goalDescription,
          textAlign: TextAlign.center,
          style: TextWidgets.textStyle(
            fontSize: 14,
            fontColor: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: height * 0.05),
        Obx(() {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 32),
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: List.generate(Strings.goalList.length, (index) {
                return InkWell(
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  onTap: () {
                    controller.selectedGoal.value = Strings.goalList[index];
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            Strings.goalList[index],
                            textAlign: TextAlign.left,
                            style: TextWidgets.textStyle(
                              fontSize: 15,
                              fontColor: AppColors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  controller.selectedGoal.value ==
                                          Strings.goalList[index]
                                      ? AppColors.purple
                                      : AppColors.black,
                              width: 2,
                            ),
                          ),
                          child: Container(
                            height: 25,
                            width: 25,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  controller.selectedGoal.value ==
                                          Strings.goalList[index]
                                      ? AppColors.purple
                                      : AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }),
      ],
    );
  }
}

class Fragment7 extends GetView<SetupScreenController> {
  const Fragment7({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        SizedBox(height: height * 0.04),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Text(
            Strings.activityQuestion,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 32,
              fontColor: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: height * 0.05),
        Text(
          Strings.activityDescription,
          textAlign: TextAlign.center,
          style: TextWidgets.textStyle(
            fontSize: 14,
            fontColor: AppColors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: height * 0.08),
        Obx(() {
          return Column(
            children: List.generate(Strings.activityList.length, (index) {
              return InkWell(
                splashColor: AppColors.transparent,
                highlightColor: AppColors.transparent,
                onTap: () {
                  controller.selectedActivityGoal.value =
                      Strings.activityList[index];
                },
                child: Container(
                  width: width / 1.5,
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:
                        controller.selectedActivityGoal.value ==
                                Strings.activityList[index]
                            ? AppColors.yellow
                            : AppColors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      Strings.activityList[index],
                      textAlign: TextAlign.center,
                      style: TextWidgets.textStyle(
                        fontSize: 18,
                        fontColor:
                            controller.selectedActivityGoal.value ==
                                    Strings.activityList[index]
                                ? AppColors.black
                                : AppColors.purple,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            }),
          );
        }),
      ],
    );
  }
}

class Fragment8 extends GetView<SetupScreenController> {
  const Fragment8({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return ListView(
      children: [
        SizedBox(height: height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            Strings.fillProfile,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 32,
              fontColor: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            Strings.fillProfileDescription,
            textAlign: TextAlign.center,
            style: TextWidgets.textStyle(
              fontSize: 14,
              fontColor: AppColors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: height * 0.04),
        Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
          decoration: BoxDecoration(
            color: AppColors.purple,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(150),
                    child: Image.asset(
                      IP.onBoard2,
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 1,
                    bottom: 1,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.yellow,
                      child: Icon(
                        Icons.edit_outlined,
                        size: 22,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Form(
                key: controller.setUpValidateKey,
                child: Column(
                  children: [
                    SizedBox(height: height * 0.02),
                    AppTextField(
                      controller: controller.setUpFullNameController,
                      title: Strings.fullName,
                      titleFontSize: 16,
                      boxColor: AppColors.white,
                      borderColor: AppColors.white,
                      borderRadius: 18,
                      mandatory: true,
                      textColor: AppColors.black,
                      addPadding: true,
                      validator: Validator.notEmpty,
                    ),
                    SizedBox(height: height * 0.01),
                    AppTextField(
                      controller: controller.setUpNickNameController,
                      title: Strings.nickName,
                      titleFontSize: 16,
                      boxColor: AppColors.white,
                      borderColor: AppColors.white,
                      borderRadius: 18,
                      mandatory: true,
                      textColor: AppColors.black,
                      addPadding: true,
                      validator: Validator.notEmpty,
                    ),
                    SizedBox(height: height * 0.01),
                    AppTextField(
                      controller: controller.setUpEmailController,
                      title: Strings.email,
                      titleFontSize: 16,
                      boxColor: AppColors.white,
                      borderColor: AppColors.white,
                      borderRadius: 18,
                      mandatory: true,
                      textColor: AppColors.black,
                      addPadding: true,
                      validator: Validator.email,
                    ),
                    SizedBox(height: height * 0.01),
                    AppTextField(
                      controller: controller.setUpMobileController,
                      title: Strings.mobile,
                      titleFontSize: 16,inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.phone,
                      boxColor: AppColors.white,
                      borderColor: AppColors.white,
                      borderRadius: 18,
                      mandatory: true,
                      textColor: AppColors.black,
                      addPadding: true,
                      validator: Validator.phone,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
