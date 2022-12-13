import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CompensationPending extends StatefulWidget{
  const CompensationPending({super.key});
  @override
  State<CompensationPending> createState() => _CompensationPending();
}

class _CompensationPending extends State<CompensationPending> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Compensation Pending'),
          ]
      ),
    ),

  );

}