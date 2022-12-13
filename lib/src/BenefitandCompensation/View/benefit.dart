import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'benefitDetails.dart';


class Benefit extends StatefulWidget{
  const Benefit({super.key});
  @override
  State<Benefit> createState() => _Benefit();
}

class _Benefit extends State<Benefit> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Card(child:ListTile(
                onTap: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BenefitDetails()));},
                title: Text("Insurans Plan"),
                subtitle: Text("20/07/2022"))),
            Card(child:ListTile(
                onTap: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const BenefitDetails()));},
                title: Text("Leave"),
                subtitle: Text("10/06/2022"))),
          ]
      ),
    ),

  );

}