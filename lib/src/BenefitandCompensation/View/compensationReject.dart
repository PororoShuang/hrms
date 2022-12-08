import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CompensationReject extends StatefulWidget{
  const CompensationReject({super.key});
  @override
  State<CompensationReject> createState() => _CompensationReject();
}

class _CompensationReject extends State<CompensationReject> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Compensation Reject'),
          ]
      ),
    ),

  );

}