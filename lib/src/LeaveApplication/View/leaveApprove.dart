import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LeaveApprove extends StatefulWidget{
  const LeaveApprove({super.key});
  @override
  State<LeaveApprove> createState() => _LeaveApprove();
}

class _LeaveApprove extends State<LeaveApprove> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Leave Approve'),
          ]
      ),
    ),

  );

}