import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Model/benefit_information.dart';


class BenefitDetails extends StatefulWidget{

  const BenefitDetails({super.key,required this.myBenefits});

  final Benefits myBenefits;

  @override
  State<BenefitDetails> createState() => _BenefitDetails();
}

class _BenefitDetails extends State<BenefitDetails> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: Text('Details'),
      backgroundColor: Colors.blueGrey[900],
      centerTitle:true,
      automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context); },),
    ),
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(" "),
                ),
                Container(
                  child: Text(widget.myBenefits.benefitDesc ?? "-"),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ]
      ),
    ),

  );

}