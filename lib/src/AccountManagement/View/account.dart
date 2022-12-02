import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Account extends StatefulWidget{
  const Account({super.key});
  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            Text('Account'),
          ]
      ),
    ),

  );

}