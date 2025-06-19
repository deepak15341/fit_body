import 'package:fitbody/app/utils/strings.dart';
import 'package:fitbody/app/utils/widgets/snack_bar/snackMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../../../routes/app_pages.dart';

class AuthenticationScreensController extends GetxController {
  @override
  void onInit() {
    loginDescription = getLoginDescription();
    setupNewPasswordDescription = getSetupNewPasswordDescription();
    passwordDescription = getPasswordDescription();
    super.onInit();
  }

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotPasswordEmailController = TextEditingController();
  TextEditingController setNewPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  TextEditingController signUpEmailOrMobileController = TextEditingController();
  TextEditingController signUpFullNameController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConfirmPasswordController =
      TextEditingController();
  GlobalKey<FormState> loginValidateKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordValidateKey = GlobalKey();
  GlobalKey<FormState> setNewPasswordValidateKey = GlobalKey();
  GlobalKey<FormState> signUpValidateKey = GlobalKey();
  List loginMethodIcon = [
    "assets/images/google_icon.png",
    "assets/images/facebook_icon.png",
    "assets/images/fingerprint_icon.png",
  ];

  String loginDescription = "";
  String passwordDescription = "";

  String getLoginDescription() {
    final random = Random();
    return Strings.loginDescription[random.nextInt(
      Strings.loginDescription.length,
    )];
  }

  String getPasswordDescription() {
    final random = Random();
    return Strings.forgotPasswordDescription[random.nextInt(
      Strings.forgotPasswordDescription.length,
    )];
  }

  void onLoginTap({required BuildContext context}) {
    if (loginValidateKey.currentState!.validate()) {
      showSnack(
        context: context,
        messageType: MessageType.success("Login Successful"),
      );
    } else {
      showSnack(
        context: context,
        messageType: MessageType.info(Strings.checkMandatory),
      );
    }
  }

  void onForgotPasswordTap() {
    Get.toNamed(Routes.forgotPasswordScreen);
  }

  void onContinueTap({required BuildContext context}) {
    if (forgotPasswordValidateKey.currentState!.validate()) {
      Get.toNamed(Routes.setNewPasswordScreen);
    } else {
      showSnack(
        context: context,
        messageType: MessageType.info(Strings.checkMandatory),
      );
    }
  }

  void onResetTap({required BuildContext context}) {
    if (setNewPasswordValidateKey.currentState!.validate() &&
        setNewPasswordController.text == confirmNewPasswordController.text) {
      Get.offAllNamed(Routes.loginScreen);
    } else {
      showSnack(
        context: context,
        messageType: MessageType.info(Strings.checkMandatory),
      );
    }
  }

  String setupNewPasswordDescription = "";

  String getSetupNewPasswordDescription() {
    final random = Random();
    return Strings.passwordDescription[random.nextInt(
      Strings.passwordDescription.length,
    )];
  }

  void onSignUpNavigationTapped() {
    Get.toNamed(Routes.signUpScreen);
  }

  void onLoginNavigationTap() {
    Get.back();
  }

  void onSignUpTapped({required BuildContext context}) {
    if (signUpValidateKey.currentState!.validate()) {
      showSnack(
        context: context,
        messageType: MessageType.success("Account Created"),
      );
    } else {
      showSnack(
        context: context,
        messageType: MessageType.info(Strings.checkMandatory),
      );
    }
  }
}
