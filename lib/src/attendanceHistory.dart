import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AttendanceHistory extends StatefulWidget{
  const AttendanceHistory({super.key});
  @override
  State<AttendanceHistory> createState() => _AttendanceHistory();
}

class _AttendanceHistory extends State<AttendanceHistory> {

  @override
  Widget build(BuildContext context)=> Scaffold(
  body: SingleChildScrollView(
    child: Column(
      children:<Widget>[
        Text('history'),
      ]
    ),
  ),

  );

}