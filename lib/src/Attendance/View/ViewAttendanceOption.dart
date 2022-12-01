import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Controller/deviceUUID.dart';
import 'package:hrms/src/Attendance/Controller/ScanQR.dart';
import 'package:hrms/src/Attendance/Controller/scheduleNotification.dart';
import 'package:hrms/src/Attendance/View/FaceRecognition.dart';

class AttendanceHome extends StatefulWidget {
  @override
  _AttendanceHomeState createState() => _AttendanceHomeState();
}

class _AttendanceHomeState extends State<AttendanceHome> {
  @override
  void initState() {
    super.initState();
    NotificationController.scheduleNewNotification();
    // WidgetsBinding.instance.addPostFrameCallback(
    //     (_) =>);
  }

  final NotificationController nc = new NotificationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Taking Options'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            textButton("QR Code", Scan()),
            SizedBox(
              height: 10.0,
            ),

            textButton("Facial Recognition", FaceRecognition()),
            FloatingActionButton(
              heroTag: '2',
              onPressed: () => NotificationController.scheduleNewNotification(),
              tooltip: 'Schedule New notification',
              child: const Icon(Icons.access_time_outlined),
            ),
            // textButton("Facial Recognition",NotificationController.scheduleNewNotification() ),
          ],
        ),
      ),
    );
  }

  Widget textButton(String text, Widget widget) {
    return TextButton(
      // padding: EdgeInsets.all(15.0),
      child: Text(text),
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
  }
}
