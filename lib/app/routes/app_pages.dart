import 'package:get/get.dart';

import '../modules/authentication_screens/bindings/authentication_screens_binding.dart';
import '../modules/authentication_screens/views/fingerprint_view.dart';
import '../modules/authentication_screens/views/forgotpassword_view.dart';
import '../modules/authentication_screens/views/login_view.dart';
import '../modules/authentication_screens/views/signup_view.dart';
import '../modules/custom_navbar/bindings/custom_navbar_binding.dart';
import '../modules/custom_navbar/views/custom_navbar_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/launch_screen/views/launch_screen_view.dart';
import '../modules/on_boarding_screens/bindings/on_boarding_screens_binding.dart';
import '../modules/on_boarding_screens/views/on_boarding_screens_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/setup_screen/bindings/setup_screen_binding.dart';
import '../modules/setup_screen/views/setup_screen_view.dart';
import '../utils/strings.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final initial = _Paths.customNavBarScreen;

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
      name: _Paths.dashboardScreen,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.customNavBarScreen,
      page: () => const CustomNavbarView(),
      binding: CustomNavbarBinding(),
    ),
    GetPage(
      name: _Paths.profileScreen,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
