import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/EmployeeLeaveManagement/View/employeeLeaveDetails.dart';



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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: 319,
                        height: 100,
                        color: Colors.green,
                        alignment: Alignment.center,
                        child: const Text(
                          '\$5200.00',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        width: 319,
                        height: 100,
                        color: Colors.green,
                        alignment: Alignment.center,
                        child: const Text(
                          '\$1200.00',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Recent Transactions",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              width: 400,
              child:  TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: (){Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const EmployeeLeaveDetails()));},
                child: const Text('Disabled'),
              ),
            ),
          ]
      ),
      ],
    ),
    ),

  );

}