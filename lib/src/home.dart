import 'package:flutter/material.dart';

import 'Attendance/Controller/scheduleNotification.dart';
import 'Attendance/View/attendance.dart';
import 'BenefitandCompensation/View/compensation.dart';
import 'EmployeeLeaveManagement/View/employeeLeaveStatus.dart';
import 'LeaveApplication/View/leave.dart';
import 'Payroll/View/payroll.dart';
import 'ShiftManagement/View/shift.dart';
import 'Training/View/training.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    super.initState();
    NotificationController.scheduleNewNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey[900],
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Center(
          child: Column(
            children:<Widget>[
              SizedBox(height: 50),
              Column(children:[
                //accProfile()
              ],),
              // SizedBox(height: 20),
              // Container(
              //     padding:EdgeInsets.symmetric(horizontal:10),
              //     child:Container(
              //       height:3,
              //       width:1000,
              //       color:Colors.black54,)
              // ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Leave()));},
                      child: Card(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade900),
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.none,
                                  image: AssetImage('assets/leave.png'))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 160, 0, 0),
                            child: Text('Apply Leave', textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Attendance()));},
                      child: Card(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade900),
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.none,
                                  image: AssetImage('assets/attendance.png'))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 160, 0, 0),
                            child: Text('Attendance',textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Payroll()));},
                      child: Card(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade900),
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.none,
                                  image: AssetImage('assets/payroll.png'))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 160, 0, 0),
                            child: Text('Payroll',textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Shift()));},
                      child: Card(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade900),
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.none,
                                  image: AssetImage('assets/shift.png'))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 160, 0, 0),
                            child: Text('Shift',textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Training()));},
                      child: Card(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade900),
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.none,
                                  image: AssetImage('assets/training.png'))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 160, 0, 0),
                            child: Text('Training',textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Compensation()));},
                      child: Card(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade900),
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.none,
                                  image: AssetImage('assets/compensation.png'))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 160, 0, 0),
                            child: Text('Benefit And Compensation',textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const EmployeeLeaveStatus()));},
                      child: Card(
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blueGrey.shade900),
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  fit: BoxFit.none,
                                  image: AssetImage('assets/employee.png'))),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 160, 0, 0),
                            child: Text('Employee Leave Application', textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap:(){},
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                          ],
                        ),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ) ,

      ),

    );
  }
}

Widget accProfile(){
  return Row(
    children:<Widget>[
      Container(
        padding:EdgeInsets.symmetric(horizontal:50),
        child: CircleAvatar(
          radius: 40.4,
          backgroundColor: Colors.grey,
        ),
      ),
      Container(
        padding:EdgeInsets.symmetric(horizontal:10),
        child: Text('Hi, Name',style:TextStyle(fontSize: 16)),
      ),
    ],
  );

}


