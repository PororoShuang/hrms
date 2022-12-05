// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:hrms/src/AccountManagement/Controller/geofencing.dart';
import 'package:hrms/src/AccountManagement/View/signUp.dart';
// import 'package:hrms/src/Attendance/Controller/scheduleNotification.dart';
// import 'package:hrms/src/Attendance/View/ViewAttendanceOption.dart';

// Future<void> main() async {
//   await NotificationController.initializeLocalNotifications();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),

//       //home: SignUp(),
//       home: AttendanceHome(),
//       //home: determinePosition(),
//     );
//   }
// }

import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';

/// Importing the configuration file to pass them to the EmailAuth instance
/// You can have a custom path and a variable name,
/// but the Map should be in the pattern {server : "", serverKey : ""}
//import 'package:email_auth_example/auth.config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// The boolean to handle the dynamic operations
  bool submitValid = false;

  /// Text editing controllers to get the value from text fields
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _otpcontroller = TextEditingController();

  // Declare the object
  //EmailAuth emailAuth;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    // emailAuth = new EmailAuth(
    //   sessionName: "Sample session",
    // );

    /// Configuring the remote server
    //emailAuth.config(remoteServerConfiguration);
  }

  /// a void function to verify if the Data provided is true
  /// Convert it into a boolean function to match your needs.
  // void verify() {
  //   print(emailAuth.validateOtp(
  //       recipientMail: _emailcontroller.value.text,
  //       userOtp: _otpcontroller.value.text));
  // }

  /// a void funtion to send the OTP to the user
  /// Can also be converted into a Boolean function and render accordingly for providers
  // void sendOtp() async {
  //   bool result = await emailAuth.sendOtp(
  //       recipientMail: _emailcontroller.value.text, otpLength: 5);
  //   if (result) {
  //     setState(() {
  //       submitValid = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
      //Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Email Auth sample'),
      //   ),
      //   body: Container(
      //     margin: EdgeInsets.all(5),
      //     child: Center(
      //         child: Center(
      //       child: Column(
      //         children: <Widget>[
      //           TextField(
      //             controller: _emailcontroller,
      //           ),
      //           Card(
      //             margin: EdgeInsets.only(top: 20),
      //             elevation: 6,
      //             child: Container(
      //               height: 50,
      //               width: 200,
      //               color: Colors.green[400],
      //               child: GestureDetector(
      //                 //onTap: sendOtp,
      //                 child: Center(
      //                   child: Text(
      //                     "Request OTP",
      //                     style: TextStyle(
      //                       fontWeight: FontWeight.bold,
      //                       color: Colors.white,
      //                       fontSize: 20,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ),

      //           /// A dynamically rendering text field
      //           (submitValid)
      //               ? TextField(
      //                   controller: _otpcontroller,
      //                 )
      //               : Container(height: 1),
      //           (submitValid)
      //               ? Container(
      //                   margin: EdgeInsets.only(top: 20),
      //                   height: 50,
      //                   width: 200,
      //                   color: Colors.green[400],
      //                   child: GestureDetector(
      //                     //onTap: verify,
      //                     child: Center(
      //                       child: Text(
      //                         "Verify",
      //                         style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           color: Colors.white,
      //                           fontSize: 20,
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 )
      //               : SizedBox(height: 1)
      //         ],
      //       ),
      //     )),
      //   ),
      // ),
    );
  }
}
