import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Shift extends StatefulWidget{
  const Shift({super.key});
  @override
  State<Shift> createState() => _Shift();
}

class _Shift extends State<Shift> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: Text('Shift'),
      backgroundColor: Colors.blueGrey[900],
      centerTitle:true,
      automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); },),
    ),
    body: Center(
      child: Column(
          children:<Widget>[
            SizedBox(height: 30),
            Text("Monday",style: TextStyle(height:2,fontSize:20,color: Colors.black45)),
            Card(child:ListTile(
                title: Text("Date"),
                subtitle: Text("Time"))),
            Card(child:ListTile(
                title: Text("Date"),
                subtitle: Text("Time"))),
          ]
      ),
    ),

  );

}