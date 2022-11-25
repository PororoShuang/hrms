import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/View/Login.dart';
// import 'package:hrms/src/Attendace/View/ViewAttendanceOption.dart';
import 'package:camera/camera.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hrms/src/Attendace/Controller/Camera.dart';
import 'package:hrms/src/Attendace/Model/HiveBoxes.dart';
import 'package:flutter/services.dart';
import 'package:hrms/src/Attendace/View/ViewAttendanceOption.dart';

// void main() {
//   runApp(MyApp());
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Hive.initFlutter();
  await HiveBoxes.initialize();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      // home: LoginPage(),
      home: AttendanceHome(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(home: AttendanceHome());
// }
