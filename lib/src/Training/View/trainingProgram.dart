import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/Training/View/trainingProgramDetails.dart';


class TrainingProgram extends StatefulWidget{
  const TrainingProgram({super.key});
  @override
  State<TrainingProgram> createState() => _TrainingProgram();
}

class _TrainingProgram extends State<TrainingProgram> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Card(child:ListTile(
                onTap: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TrainingProgramDetails()));},
                title: Text("Onboarding Training"),
                subtitle: Text("20/07/2022"))),
            Card(child:ListTile(
                onTap: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const TrainingProgramDetails()));},
                title: Text("Product Training"),
                subtitle: Text("10/06/2022"))),
          ]
      ),
    ),

  );

}