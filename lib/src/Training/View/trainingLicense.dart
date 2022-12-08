import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TrainingLicense extends StatefulWidget{
  const TrainingLicense({super.key});
  @override
  State<TrainingLicense> createState() => _TrainingLicense();
}

class _TrainingLicense extends State<TrainingLicense> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Card(child:ListTile(
                onTap: (){},
                title: Text("Technical Training"),
                subtitle: Text("Exp Date 07/2023"),
                trailing: Icon(Icons.density_medium))),
          ]
      ),
    ),

  );

}