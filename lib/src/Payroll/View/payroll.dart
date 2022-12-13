import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Payroll extends StatefulWidget{
  const Payroll({super.key});
  @override
  State<Payroll> createState() => _Payroll();
}

class _Payroll extends State<Payroll> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: Text('Payroll'),
      backgroundColor: Colors.blueGrey[900],
      centerTitle:true,
      automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); },),
    ),
    body: SingleChildScrollView(
      child: Column(
        children:<Widget>[
          Card(child:ListTile(
              onTap: (){},
              title: Text("January"),
              trailing: Icon(Icons.book))),
          Card(child:ListTile(
              onTap: (){},
              title: Text("February"),
              trailing: Icon(Icons.book))),
        ],
      ),
    ),

  );

}