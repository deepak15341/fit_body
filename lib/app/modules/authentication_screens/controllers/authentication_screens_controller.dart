import 'package:fitbody/app/utils/strings.dart';
import 'package:fitbody/app/utils/widgets/toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../../../routes/app_pages.dart';

class AuthenticationScreensController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController forgotPasswordEmailController = TextEditingController();
  TextEditingController setNewPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  GlobalKey<FormState> loginValidateKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordValidateKey = GlobalKey();
  GlobalKey<FormState> setNewPasswordValidateKey = GlobalKey();
  List loginMethodIcon = [
    "assets/images/google_icon.png",
    "assets/images/facebook_icon.png",
    "assets/images/fingerprint_icon.png",
  ];

  String getDescription() {
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
    } else {
      showSnack(
        context: context,
        messageType: MessageType.info("Please Fill Mandatory Fields !!"),
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
        messageType: MessageType.info("Please Fill Mandatory Fields !!"),
      );
    }
  }

  void onResetTap({required BuildContext context}) {
    if (setNewPasswordValidateKey.currentState!.validate() && setNewPasswordController.text == confirmNewPasswordController.text) {
      Get.offAllNamed(Routes.loginScreen);
    } else {
      showSnack(
        context: context,
        messageType: MessageType.info("Please Fill Mandatory Fields !!"),
      );
    }
  }
}
