import 'package:fitbody/app/utils/image_paths.dart';
import 'package:fitbody/app/utils/strings.dart';
import 'package:fitbody/app/utils/widgets/snack_bar/snack_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../../../helper/biometric_helper.dart';
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
  String loginDescription = Strings.empty;
  String passwordDescription = Strings.empty;
  GlobalKey<FormState> loginValidateKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordValidateKey = GlobalKey();
  GlobalKey<FormState> setNewPasswordValidateKey = GlobalKey();
  GlobalKey<FormState> signUpValidateKey = GlobalKey();

  List loginMethodIcon = [
    IP.google,
    IP.facebook,
    IP.fingerprint,
  ];



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
        messageType: MessageType.success(Strings.loginSuccess),
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

  String setupNewPasswordDescription = Strings.empty;

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
      Get.offAndToNamed(Routes.setupScreen);
    } else {
      showSnack(
        context: context,
        messageType: MessageType.info(Strings.checkMandatory),
      );
    }
  }


  void fingerPrintTap(BuildContext context)async{
    final biometricHelper = BiometricHelper();
      bool success = await biometricHelper.authenticateWithBiometrics();
      if (success) {
        Get.offNamedUntil(Routes.customNavBarScreen, (route) => false,);
      } else {
       if(context.mounted){
         showSnack(
           context: context,
           messageType: MessageType.info(Strings.biometricFailed),
         );
       }
      }

    // Get.toNamed(Routes.fingerPrintScreen);
  }

  void onSkipTap(){
    Get.back();
  }

  void onFingerPrintContinueTap(){
    Get.back();
  }
}
