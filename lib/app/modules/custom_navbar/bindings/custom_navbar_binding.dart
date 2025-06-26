import 'package:get/get.dart';

import '../controllers/custom_navbar_controller.dart';

class CustomNavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomNavbarController>(
      () => CustomNavbarController(),
    );
  }
}
