import 'package:flutter/material.dart';
import 'package:hrms/src/Attendace/View/ViewAttendanceOption.dart';

void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: ViewAttendanceOption();
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(home: AttendanceHome());
}
