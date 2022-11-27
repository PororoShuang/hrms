import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hrms/src/Attendance/View/ViewAttendanceOption.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AttendanceHome(),
    );
  }
}
