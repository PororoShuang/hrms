import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CompensationApprove extends StatefulWidget{
  const CompensationApprove({super.key});
  @override
  State<CompensationApprove> createState() => _CompensationApprove();
}

class _CompensationApprove extends State<CompensationApprove> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Compensation Approve'),
          ]
      ),
    ),

  );

}