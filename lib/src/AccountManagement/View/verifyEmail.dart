import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrms/src/AccountManagement/View/forgotPassword.dart';
import '../../AccountManagement/View/createNewPassword.dart';
import '../Controller/emailOTP.dart';

class VerifyEmail extends StatefulWidget {
  //const VerifyEmail({super.key});
  String emailAddressPassed;
  VerifyEmail({required this.emailAddressPassed});
  @override
  State<VerifyEmail> createState() => _VerifyEmail(this.emailAddressPassed);
}

class _VerifyEmail extends State<VerifyEmail> {
  String emailAddressPassed;
  _VerifyEmail(this.emailAddressPassed);
  TextEditingController otpController1 = TextEditingController();
  TextEditingController otpController2 = TextEditingController();
  TextEditingController otpController3 = TextEditingController();
  TextEditingController otpController4 = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Verify Your Email'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //padding
              children: [
                SizedBox(height: 360),
                SizedBox(
                  height: 64,
                  width: 60,
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: TextFormField(
                      controller: otpController1,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 60,
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: TextFormField(
                      controller: otpController2,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 60,
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: TextFormField(
                      controller: otpController3,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 64,
                  width: 60,
                  child: AspectRatio(
                    aspectRatio: 0.7,
                    child: TextFormField(
                      controller: otpController4,
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      style: Theme.of(context).textTheme.headline6,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                          counter: Offstage(),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2, color: Colors.black12),
                            borderRadius: BorderRadius.circular(12),
                          )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 55,
              child: TextButton(
                //onPressed: () {emailController.sendingOTP()},
                onPressed: () {
                  emailController.sendingOTP(emailAddressPassed);
                },
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 55,
              width: 300,
              child: TextButton(
                child: Text("Verify", style: TextStyle(fontSize: 19)),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(112)),
                ),
                onPressed: () async {
                  String otpInput = otpController1.text +
                      otpController2.text +
                      otpController3.text +
                      otpController4.text;
                  if (await emailController.verifyOTP(otpInput) == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateNewPassword()),
                    );
                  } else
                    print("Failed");
                },
              ),
            ),
          ],
        ),
      );
}
