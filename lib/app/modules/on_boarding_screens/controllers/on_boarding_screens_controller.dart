import 'dart:async';

import 'package:fitbody/app/routes/app_pages.dart';
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
    timer?.cancel();
    pageController.dispose();
    super.onClose();
  }

  int index = 0;
  final PageController pageController = PageController();
  Timer? timer;
  List bgImage = [
    "assets/images/on_board1.png",
    "assets/images/on_board2.png",
    "assets/images/on_board3.png",
    "assets/images/on_board4.png",
  ];
  List onBoardIcon = [
    "assets/images/on_board_icon1.png",
    "assets/images/on_board_icon2.png",
    "assets/images/on_board_icon3.png",
  ];

  void startAutoSlide() {
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (index < bgImage.length - 1) {
        index++;
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      } else {
        timer.cancel();
      }
    });
  }

  void onNextTap() {
    if (index == bgImage.length - 1) {
      Get.offAllNamed(Routes.loginScreen);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void onTapSkip() {
    if (index == 1 || index == 2) {
      Get.offAllNamed(Routes.loginScreen);
    }
  }

  void onPageChanged(int index) {
    this.index = index;
    timer?.cancel();
    startAutoSlide();
  }
}
