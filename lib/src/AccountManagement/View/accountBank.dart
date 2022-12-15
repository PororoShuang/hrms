import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AccountBank extends StatefulWidget{
  const AccountBank({super.key});
  @override
  State<AccountBank> createState() => _AccountBank();
}

class _AccountBank extends State<AccountBank> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: Text('Account Bank'),
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
                      labelText:"Bank Name"
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
                      labelText:"Bank Account"
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
