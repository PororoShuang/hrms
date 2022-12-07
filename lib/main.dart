import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hrms/src/Attendance/Controller/geofencing.dart';
import 'package:hrms/src/AccountManagement/View/signUp.dart';
import 'package:hrms/src/Attendance/Controller/scheduleNotification.dart';
import 'package:hrms/src/Attendance/View/ViewAttendanceOption.dart';
import 'package:hrms/src/Attendance/View/attendanceRegistration.dart';
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
      title: 'Excalic HRMS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: Home(),
      //home: AttendanceRegistration(),
      //home: AttendanceHome(),
      //home: determinePosition(),
    );
  }
}
