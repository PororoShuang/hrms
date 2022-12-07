import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LeaveReject extends StatefulWidget{
  const LeaveReject({super.key});
  @override
  State<LeaveReject> createState() => _LeaveReject();
}

class _LeaveReject extends State<LeaveReject> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Leave Reject'),
          ]
      ),
    ),

  );

}