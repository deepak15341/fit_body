import 'package:fitbody/app/modules/authentication_screens/controllers/authentication_screens_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_constants.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets/app_text_field.dart';
import '../../../utils/widgets/custom_app_bar.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/text_widgets.dart';

class SignUpScreenView extends GetView<AuthenticationScreensController> {
  const SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(title: Strings.createAccount),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SizedBox(height: height * 0.02),
              Text(
                Strings.letsStart,
                textAlign: TextAlign.center,
                style: TextWidgets.textStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.03),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                margin: EdgeInsets.only(left: 6, right: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.purple,
                ),
                child: Form(
                  key: controller.signUpValidateKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: controller.signUpFullNameController,
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
                        controller: controller.signUpEmailOrMobileController,
                        title: Strings.emailOrMobile,
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
                        controller: controller.signUpPasswordController,
                        title: Strings.signUpPassword,
                        titleFontSize: 16,
                        boxColor: AppColors.white,
                        borderColor: AppColors.white,
                        borderRadius: 18,
                        mandatory: true,
                        textColor: AppColors.black,
                        addPadding: true,
                        validator: Validator.password,
                      ),
                      SizedBox(height: height * 0.01),
                      AppTextField(
                        controller: controller.signUpConfirmPasswordController,
                        title: Strings.signUpConfirmPassword,
                        titleFontSize: 16,
                        boxColor: AppColors.white,
                        borderColor: AppColors.white,
                        borderRadius: 18,
                        mandatory: true,
                        textColor: AppColors.black,
                        addPadding: true,
                        validator: Validator.password,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: Strings.termsConditionText,
                      style: TextWidgets.textStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: Strings.termsOfUse,
                      style: TextWidgets.textStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontColor: AppColors.yellow,
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                    TextSpan(
                      text: Strings.and,
                      style: TextWidgets.textStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: Strings.privacyPolicy,
                      style: TextWidgets.textStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontColor: AppColors.yellow,
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                child: CustomButton(
                  text: Strings.signUp,
                  height: height * 0.05,
                  buttonTextSize: 18,
                  fw: FontWeight.w600,
                  onTap: () {
                    controller.onSignUpTapped(context: context);
                  },
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                Strings.orSignUpWith,
                textAlign: TextAlign.center,
                style: TextWidgets.textStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: iconList(context),
              ),
              SizedBox(height: height * 0.04),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: Strings.alreadyHaveAccount,
                      style: TextWidgets.textStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              controller.onLoginNavigationTap();
                            },
                      text: Strings.login,
                      style: TextWidgets.textStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontColor: AppColors.yellow,
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  iconList(BuildContext context) {
    return List.generate(3, (index) {
      return InkWell(
        onTap: () {
          if (index == 2) {
            controller.fingerPrintTap();
          }
        },
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColors.white,
          ),
          child: ImageIcon(
            AssetImage(controller.loginMethodIcon[index]),
            color: AppColors.violet,
            size: 32,
          ),
        ),
      );
    }).toList();
  }
}
