import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LeavePending extends StatefulWidget{
  const LeavePending({super.key});
  @override
  State<LeavePending> createState() => _LeavePending();
}

class _LeavePending extends State<LeavePending> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Leave Pending'),
          ]
      ),
    ),

  );

}