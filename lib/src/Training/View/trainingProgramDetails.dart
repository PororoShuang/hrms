import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TrainingProgramDetails extends StatefulWidget{
  const TrainingProgramDetails({super.key});
  @override
  State<TrainingProgramDetails> createState() => _TrainingProgramDetails();
}

class _TrainingProgramDetails extends State<TrainingProgramDetails> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: Text('Details'),
      centerTitle:true,
      automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context); },),
    ),
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Training Program Details'),
          ]
      ),
    ),

  );

}