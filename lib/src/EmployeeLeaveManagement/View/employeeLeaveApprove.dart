import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EmployeeLeaveApprove extends StatefulWidget{
  const EmployeeLeaveApprove({super.key});
  @override
  State<EmployeeLeaveApprove> createState() => _EmployeeLeaveApprove();
}

class _EmployeeLeaveApprove extends State<EmployeeLeaveApprove> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Employee Leave Approve'),
          ]
      ),
    ),

  );

}