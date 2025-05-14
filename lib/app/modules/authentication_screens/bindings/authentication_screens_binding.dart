import 'package:get/get.dart';

import '../controllers/authentication_screens_controller.dart';

class AuthenticationScreensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationScreensController>(
      () => AuthenticationScreensController(),
    );
  }
}
