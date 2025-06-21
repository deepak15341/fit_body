import 'dart:async';

import 'package:fitbody/app/routes/app_pages.dart';
import 'package:fitbody/app/utils/image_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingScreensController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startAutoSlide();
  }

  @override
  void onClose() {
    timer.value?.cancel();
    pageController.dispose();
    super.onClose();
  }

  Rx<int> index = 0.obs;
  PageController pageController = PageController();
  Rx<Timer?> timer = Rxn();

  List bgImage = [IP.onBoard1, IP.onBoard2, IP.onBoard3, IP.onBoard4];
  List onBoardIcon = [IP.onBoardIcon1, IP.onBoardIcon2, IP.onBoardIcon3];

  void startAutoSlide() {
    timer.value = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (index.value < bgImage.length - 1) {
        index.value++;
        pageController.animateToPage(
          index.value,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      } else {
        timer.cancel();
      }
    });
  }

  void onNextTap() {
    if (index.value == bgImage.length - 1) {
      Get.offAllNamed(Routes.loginScreen);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onTapSkip() {
    Get.offAllNamed(Routes.loginScreen);
  }

  void onPageChanged(int index) {
    this.index.value = index;
    timer.value?.cancel();
    startAutoSlide();
  }
}
