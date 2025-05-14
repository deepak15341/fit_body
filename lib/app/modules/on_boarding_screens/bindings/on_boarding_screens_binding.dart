import 'package:get/get.dart';

import '../controllers/on_boarding_screens_controller.dart';

class OnBoardingScreensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingScreensController>(
      () => OnBoardingScreensController(),
    );
  }
}
