import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EmployeeLeavePending extends StatefulWidget{
  const EmployeeLeavePending({super.key});
  @override
  State<EmployeeLeavePending> createState() => _EmployeeLeavePending();
}

class _EmployeeLeavePending extends State<EmployeeLeavePending> {

  @override
  Widget build(BuildContext context)=> Scaffold(
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              width: 400,
              child: TextField(
                //controller: controller,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color:Colors.black),
                    )
                ),
              ),
            ),
          ]
      ),
    ),

  );

}