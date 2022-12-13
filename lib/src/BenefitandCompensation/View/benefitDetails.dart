import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BenefitDetails extends StatefulWidget{
  const BenefitDetails({super.key});
  @override
  State<BenefitDetails> createState() => _BenefitDetails();
}

class _BenefitDetails extends State<BenefitDetails> {

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
            Text('Benefit Details'),
          ]
      ),
    ),

  );

}