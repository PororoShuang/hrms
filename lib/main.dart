import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hrms/src/Attendance/Controller/geofencing.dart';
import 'package:hrms/src/AccountManagement/View/signUp.dart';
import 'package:hrms/src/Attendance/Controller/scheduleNotification.dart';
import 'package:hrms/src/Attendance/View/ViewAttendanceOption.dart';
import 'package:hrms/src/Attendance/View/attendanceRegistration.dart';
import 'package:hrms/src/home.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';
import 'package:hrms/src/Attendance/Controller/testAPI.dart';

// Future<void> main() async {
//   await NotificationController.initializeLocalNotifications();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   late List<Attendance>? _userModel = [];
//   @override
//   void initState() {
//     super.initState();
//     _getData();
//   }

//   void _getData() async {
//     _userModel = (await ApiService().getUsers())!;
//     Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Excalic HRMS',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),

//       home: Home(),
//       //home: AttendanceRegistration(),
//       //home: AttendanceHome(),
//       //home: determinePosition(),
//     );
//   }
// }

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Attendance>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].attendance_id_.toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].start_time_.toString()),
                          Text(_userModel![index].end_time_.toString()),
                          Text(_userModel![index].validity_.toString()),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
