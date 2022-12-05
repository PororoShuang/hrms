import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';

class emailController {
  static final EmailOTP myAuth = EmailOTP();

  static Future<void> sendingOTP(String email) async {
    myAuth.setConfig(
        appEmail: "me@rohitchouhan.com",
        appName: "Email OTP",
        userEmail: email,
        otpLength: 4,
        otpType: OTPType.digitsOnly);
    myAuth.sendOTP();
  }

  static Future verifyOTP(String otpInput) async {
    if (await myAuth.verifyOTP(otp: otpInput) == true) {
      return true;
    } else
      return false;
  }
}
