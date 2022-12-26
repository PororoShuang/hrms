import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TrainingProgram extends StatefulWidget{
  const TrainingProgram({super.key});
  @override
  State<TrainingProgram> createState() => _TrainingProgram();
}

class _TrainingProgram extends State<TrainingProgram> {
  @override
  void initstate(){
    super.initState();
    getDate();
  }

  List trainingList=[];

  void getDate() async{

  }

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Card(child:ListTile(
                title: Text("Onboarding Training"),
                subtitle: Text("20/07/2022"))),
            Card(child:ListTile(
                title: Text("Product Training"),
                subtitle: Text("10/06/2022"))),
          ]
      ),
    ),

  );

}