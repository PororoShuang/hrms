import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OtherAccount extends StatefulWidget{
  const OtherAccount({super.key});
  @override
  State<OtherAccount> createState() => _OtherAccount();
}

class _OtherAccount extends State<OtherAccount> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: Text('Other Account Number'),
      backgroundColor: Colors.blueGrey[900],
      centerTitle:true,
      automaticallyImplyLeading: true,
    ),
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            SizedBox(height: 30),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                      labelText:"EPF No"
                  ),
                )
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                      labelText:"SOSCO No"
                  ),
                )
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                      labelText:"I-Tax No"
                  ),
                )
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 55,
              width: 300,
              child:TextButton(
                child:Text("Save",style:TextStyle(fontSize: 19)),
                style: TextButton.styleFrom(
                  backgroundColor:Colors.indigo[900],
                  foregroundColor:Colors.white,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                ), onPressed: () {},
              ),
            ),
          ]
      ),
    ),
  );
}
