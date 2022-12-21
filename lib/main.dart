import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/AccountManagement/View/account.dart';
import 'package:hrms/src/AccountManagement/View/callEmpAPI.dart';
import 'package:hrms/src/Attendance/Controller/scheduleNotification.dart';
import 'package:hrms/src/Authentication/View/login_screen.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';
import 'package:hrms/src/LeaveApplication/View/leave.dart';
import 'package:hrms/src/home.dart';

Future<void> main() async {
  await NotificationController.initializeLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Excalic HRMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
        textTheme: TextTheme(
          subtitle1: TextStyle(color: Colors.black), //<-- SEE HERE
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          border: OutlineInputBorder(borderSide: BorderSide.none),
        ),
      ),
      home: LoginScreen(),
    );
  }
}

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   _HomeState createState() => _HomeState();
// }

// void main() {
//   runApp(const Home());
// }

// class _HomeState extends State<Home> {
//   //late List<Employee>? _userModel = [];
//   //late String? _userModel = "";
//   late List<dynamic>? _userModel = [];
//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }

//   void _getData() async {
//     //_userModel = (await ApiService().getUsers());
//     _userModel = (await ApiService().getUsers());

//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           appBar: AppBar(
//             title: const Text('REST API Example'),
//             // textSelectionTheme:
//             //     TextSelectionThemeData(cursorColor: Colors.black),
//             // textTheme: TextTheme(
//             //   subtitle1: TextStyle(color: Colors.black), //<-- SEE HERE
//             // ),
//             // inputDecorationTheme: InputDecorationTheme(
//             //   hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
//             //   contentPadding:
//             //       EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//             //   border: OutlineInputBorder(borderSide: BorderSide.none),
//             // ),
//           ),
//           body: _userModel == null || _userModel!.isEmpty
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : ListView.builder(
//                   // itemCount: _userModel!.length,
//                   itemBuilder: (context, index) {
//                     return Card(
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               //Text(_userModel!.toString()),
//                               Text(_userModel!.toString()),
//                               //Text(_userModel![index].employee_id.toString()),
//                             ],
//                           ),
//                           const SizedBox(
//                             height: 20.0,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               // Text(_userModel![index].employee_name.toString()),
//                               // Text(_userModel![index].employer_id.toString()),
//                               // Text(_userModel![index].employer_name.toString()),
//                             ],
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//         )
//         //home: LoginScreen(),
//         //home: AttendanceRegistration(),
//         //home: AttendanceHome(),
//         //home: determinePosition(),
//         );
//   }
// }
