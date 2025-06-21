import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/strings.dart';

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
  void onTapNext() {}
}
