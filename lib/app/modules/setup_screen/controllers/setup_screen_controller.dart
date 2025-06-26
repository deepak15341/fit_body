import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/strings.dart';
import '../../../utils/widgets/snack_bar/snack_message.dart';
import '../views/setup_screen_view.dart';

class SetupScreenController extends GetxController {
  @override
  onInit() {
    setupDescription = getSetupDescription();
    super.onInit();
  }

  String setupDescription = Strings.empty;

  String getSetupDescription() {
    final random = Random();
    return Strings.setUpListDescription[random.nextInt(
      Strings.setUpListDescription.length,
    )];
  }

  Rx<int> fragmentIndex = 0.obs;
  List<Widget> fragmentPages = [
    Fragment1(),
    Fragment2(),
    Fragment3(),
    Fragment4(),
    Fragment5(),
    Fragment6(),
    Fragment7(),
    Fragment8(),
  ];
  void onTapNext(BuildContext context) {
    if (fragmentIndex.value != fragmentPages.length - 1) {
      fragmentIndex.value++;
    } else {
      if (setUpValidateKey.currentState!.validate() && context.mounted) {
        Get.offNamedUntil(Routes.customNavBarScreen, (route) => false,);
      } else {
        showSnack(
          context: context,
          messageType: MessageType.info(Strings.checkMandatory),
        );
      }
    }
  }

  void onBackPressed() {
    if (fragmentIndex.value != 0) {
      fragmentIndex.value--;
    }
  }

  Rx<int?> selectedGender = Rxn();
  Rx<int> selectedAge = 16.obs;
  Rx<int> selectedWeight = 16.obs;
  Rx<int> selectedHeight = 50.obs;
  List<IconData> icon = [Icons.male, Icons.female];
  Rx<String> selectedWeightStandard = Strings.lb.obs;

  Rx<String> selectedGoal = Strings.empty.obs;
  Rx<String> selectedActivityGoal = Strings.empty.obs;
  TextEditingController setUpFullNameController = TextEditingController();
  TextEditingController setUpNickNameController = TextEditingController();
  TextEditingController setUpEmailController = TextEditingController();
  TextEditingController setUpMobileController = TextEditingController();
  GlobalKey<FormState> setUpValidateKey = GlobalKey();
}
