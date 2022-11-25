// import 'package:flutter/material.dart';

// class ViewAttendanceOption extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Attendance Option UI'),
//           ),
//           body: Center(
//               child: Column(children: <Widget>[
//             Container(
//               margin: EdgeInsets.all(25),
//               child: TextButton(
//                 child: Text(
//                   'Facial Recognition',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 onPressed: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: (context) => CotrollerG));
//                 },
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.all(25),
//               child: TextButton(
//                 style: TextButton.styleFrom(primary: Colors.blueAccent),
//                 child: Text(
//                   'QR Code',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//                 onPressed: () {},
//               ),
//             ),
//           ]))),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hrms/src/Attendace/Controller/Camera.dart';
import 'package:hrms/src/Attendace/Controller/ScanQR.dart';

class AttendanceHome extends StatefulWidget {
  @override
  _AttendanceHomeState createState() => _AttendanceHomeState();
}

class _AttendanceHomeState extends State<AttendanceHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter FlatButton Example'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //textButton("Facial Recognition",widget),
            textButton("QR Code", Scan()),
            SizedBox(
              height: 10.0,
            ),
            textButton("Facial Recognition", FaceScanScreen()),
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
