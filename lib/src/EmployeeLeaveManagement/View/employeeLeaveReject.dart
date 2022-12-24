import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EmployeeLeaveReject extends StatefulWidget{
  const EmployeeLeaveReject({super.key});
  @override
  State<EmployeeLeaveReject> createState() => _EmployeeLeaveReject();
}

class _EmployeeLeaveReject extends State<EmployeeLeaveReject> {

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
            // GestureDetector(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => const EmployeeLeaveDetails()),
            //     );
            //   },
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 8.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text(
            //           " ",
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.w500,
            //             color: Colors.grey[600],
            //           ),
            //         ),
            //         Icon(
            //           Icons.density_medium,
            //           color: Colors.indigo,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ]
      ),
    ),
  );

}