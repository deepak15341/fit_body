import 'package:fitbody/app/utils/color_constants.dart';
import 'package:fitbody/app/utils/widgets/app_text_field.dart';
import 'package:fitbody/app/utils/widgets/custom_app_bar.dart';
import 'package:fitbody/app/utils/widgets/text_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets/custom_button.dart';
import '../controllers/authentication_screens_controller.dart';

class LoginView
    extends GetView<AuthenticationScreensController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: customAppBar(title: Strings.login,showBack: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SizedBox(height: height * 0.07),
              Text(
                Strings.welcome,
                textAlign: TextAlign.center,
                style: TextWidgets.textStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                controller.loginDescription,
                textAlign: TextAlign.center,
                style: TextWidgets.textStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(
                  left: 6,
                  right: 6,
                  top: height * 0.04,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: AppColors.purple,
                ),
                child: fragment(context, height, width),
              ),
              SizedBox(height: height * 0.05),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.25),
                child: CustomButton(
                  text: Strings.login,
                  height: height * 0.05,
                  buttonTextSize: 18,
                  fw: FontWeight.w600,
                  onTap: () {
                    controller.onLoginTap(context: context);
                  },
                ),
              ),
              SizedBox(height: height * 0.04),
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
              SizedBox(height: height * 0.06),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: Strings.haveAccount,
                      style: TextWidgets.textStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(recognizer: TapGestureRecognizer()..onTap = (){
                      controller.onSignUpNavigationTapped();
                    },
                      text: Strings.signUp,
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
      return InkWell(onTap: () {
        if(index==2){
          controller.fingerPrintTap(context);
        }
      },splashColor: AppColors.transparent,highlightColor: AppColors.transparent,
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

  Widget fragment(BuildContext context, height, width) {
    return Form(
      key: controller.loginValidateKey,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          AppTextField(
            controller: controller.userNameController,
            title: Strings.username,
            titleFontSize: 16,
            boxColor: AppColors.white,
            borderColor: AppColors.white,
            borderRadius: 18,
            mandatory: true,
            textColor: AppColors.black,
            addPadding: true,
            validator: Validator.notEmpty,
          ),
          SizedBox(height: height * 0.1),
          AppTextField(
            controller: controller.passwordController,
            title: Strings.password,
            titleFontSize: 16,
            obscureText: true,
            boxColor: AppColors.white,
            borderColor: AppColors.white,
            borderRadius: 18,
            mandatory: true,
            textColor: AppColors.black,
            addPadding: true,
            validator: Validator.password,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              onPressed: () {
                controller.onForgotPasswordTap();
              },
              child: Text(
                Strings.forgotPassword,
                textAlign: TextAlign.center,
                style: TextWidgets.textStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontColor: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
