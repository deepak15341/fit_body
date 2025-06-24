import 'package:get/get.dart';

import '../modules/authentication_screens/bindings/authentication_screens_binding.dart';
import '../modules/authentication_screens/views/fingerprint_view.dart';
import '../modules/authentication_screens/views/forgotpassword_view.dart';
import '../modules/authentication_screens/views/login_view.dart';
import '../modules/authentication_screens/views/signup_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/launch_screen/views/launch_screen_view.dart';
import '../modules/on_boarding_screens/bindings/on_boarding_screens_binding.dart';
import '../modules/on_boarding_screens/views/on_boarding_screens_view.dart';
import '../modules/setup_screen/bindings/setup_screen_binding.dart';
import '../modules/setup_screen/views/setup_screen_view.dart';
import '../utils/strings.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.LAUNCH_SCREEN;

  static final routes = [
    GetPage(name: _Paths.launchScreen, page: () => LaunchScreenView()),
    GetPage(
      name: _Paths.onBoardScreens,
      page: () => OnBoardingScreensView(),
      binding: OnBoardingScreensBinding(),
    ),
    GetPage(
      name: _Paths.loginScreen,
      page: () => const LoginView(),
      binding: AuthenticationScreensBinding(),
    ),
    GetPage(
      name: _Paths.forgotPasswordScreen,
      page: () => ForgotPasswordView(),
    ),
    GetPage(
      name: _Paths.setNewPasswordScreen,
      page: () => SetNewPasswordView(),
    ),
    GetPage(name: _Paths.signUpScreen, page: () => SignUpScreenView()),
    GetPage(
      name: _Paths.fingerPrintScreen,
      page: () => FingerPrintScreenView(),
    ),
    GetPage(
      name: _Paths.setupScreen,
      page: () => const SetupScreenView(),
      binding: SetupScreenBinding(),
    ),
    GetPage(
      name: _Paths.dashboard,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
