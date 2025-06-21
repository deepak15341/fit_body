import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';
// import 'package:local_auth_android/local_auth_android.dart';
// import 'package:local_auth_darwin/local_auth_darwin.dart';

class BiometricHelper {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> authenticateWithBiometrics() async {
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    bool isDeviceSupported = await auth.isDeviceSupported();

    if (!canCheckBiometrics || !isDeviceSupported) {
      return false;
    }

    try {
      bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Please authenticate to access your account',
        // authMessages: [
        //   const AndroidAuthMessages(
        //     signInTitle: 'Biometric Login',
        //     cancelButton: 'Cancel',
        //     biometricHint: 'Touch the sensor',
        //   ),
        //   IOSAuthMessages(
        //     cancelButton: 'Cancel',lockOut: 'Please try again after sometime'
        //   ),
        // ],
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
      );
      return didAuthenticate;
    } catch (e) {
      debugPrint("Biometric error: $e");
      return false;
    }
  }
}
