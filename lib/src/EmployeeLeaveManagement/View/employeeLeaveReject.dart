import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EmployeeLeaveReject extends StatefulWidget{
  const EmployeeLeaveReject({super.key});
  @override
  State<EmployeeLeaveReject> createState() => _EmployeeLeaveReject();
}

class _EmployeeLeaveReject extends State<EmployeeLeaveReject> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Employee Leave Reject'),
          ]
      ),
    ),

  );

}