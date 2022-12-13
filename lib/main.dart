import 'package:flutter/material.dart';
import 'package:hrms/src/Attendance/Controller/scheduleNotification.dart';
import 'package:hrms/src/Authentication/View/login_screen.dart';

void main() {
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
      //home: AttendanceRegistration(),
      //home: AttendanceHome(),
      //home: determinePosition(),
    );
  }
}
