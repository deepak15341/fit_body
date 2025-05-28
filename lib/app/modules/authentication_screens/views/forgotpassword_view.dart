import 'package:fitbody/app/modules/authentication_screens/controllers/authentication_screens_controller.dart';
import 'package:fitbody/app/utils/strings.dart';
import 'package:fitbody/app/utils/widgets/app_text_field.dart';
import 'package:fitbody/app/utils/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/color_constants.dart';
import '../../../utils/widgets/custom_button.dart';
import '../../../utils/widgets/text_widgets.dart';

class ForgotPasswordView extends GetView<AuthenticationScreensController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(title: Strings.forgottenPassword),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SizedBox(height: height * 0.1),
              Text(
                Strings.forgotPasswordQ,
                textAlign: TextAlign.center,
                style: TextWidgets.textStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.04),
              Text(
                controller.passwordDescription,
                textAlign: TextAlign.center,
                style: TextWidgets.textStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                margin: EdgeInsets.only(left: 6, right: 6, top: height * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.purple,
                ),
                child: Form(
                  key: controller.forgotPasswordValidateKey,
                  child: AppTextField(
                    controller: controller.forgotPasswordEmailController,
                    title: Strings.enterEmail,
                    titleFontSize: 16,
                    boxColor: AppColors.white,
                    borderColor: AppColors.white,
                    borderRadius: 18,
                    mandatory: true,
                    textColor: AppColors.black,
                    addPadding: true,
                    validator: Validator.email,
                  ),
                ),
              ),
              SizedBox(height: height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                child: CustomButton(
                  text: Strings.cont,
                  height: height * 0.05,
                  buttonTextSize: 18,
                  fw: FontWeight.w600,
                  onTap: () {
                    controller.onContinueTap(context: context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




class SetNewPasswordView extends GetView<AuthenticationScreensController>  {
  const SetNewPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(title: Strings.setNewPassword),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SizedBox(height: height * 0.1),
              Text(
                controller.setupNewPasswordDescription,
                textAlign: TextAlign.center,
                style: TextWidgets.textStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                margin: EdgeInsets.only(left: 6, right: 6, top: height * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.purple,
                ),
                child: Form(
                  key: controller.setNewPasswordValidateKey,
                  child: Column(
                    children: [
                      AppTextField(
                        controller: controller.setNewPasswordController,
                        title: Strings.enterNewPassword,
                        titleFontSize: 16,
                        boxColor: AppColors.white,
                        borderColor: AppColors.white,
                        borderRadius: 18,
                        mandatory: true,
                        textColor: AppColors.black,
                        addPadding: true,
                        validator: Validator.password,
                      ),
                      SizedBox(height: height * 0.02),
                      AppTextField(
                        controller: controller.confirmNewPasswordController,
                        title: Strings.enterConfirmPassword,
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
              SizedBox(height: height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.175),
                child: CustomButton(
                  text: Strings.resetPassword,
                  height: height * 0.05,
                  buttonTextSize: 18,
                  fw: FontWeight.w600,
                  onTap: () {
                    controller.onResetTap(context: context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
