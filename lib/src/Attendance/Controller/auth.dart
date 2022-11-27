import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class AuthService {
  static Future<bool> authenticateUser() async {
    //initialize Local Authentication plugin.
    final LocalAuthentication auth = LocalAuthentication();

    //status of authentication.
    bool isAuthenticated = false;

    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;

    //check if device supports biometrics authentication.
    bool isBiometricSupported = await auth.isDeviceSupported();

    List<BiometricType> biometricTypes = await auth.getAvailableBiometrics();

    print(biometricTypes);

    options:
    const AuthenticationOptions(useErrorDialogs: false);

    //if device supports biometrics, then authenticate.
    if (isBiometricSupported) {
      try {
        isAuthenticated = await auth.authenticate(
            localizedReason: 'To continue, you must complete the biometrics',
            options: const AuthenticationOptions(
                biometricOnly: true, useErrorDialogs: true, stickyAuth: true));
      } on PlatformException catch (e) {
        print(e);
      }
    }
    return isAuthenticated;
  }
}
