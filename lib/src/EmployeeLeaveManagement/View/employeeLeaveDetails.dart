import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../LeaveApplication/Model/leave_information.dart';

class EmployeeLeaveDetails extends StatefulWidget {
  const EmployeeLeaveDetails({super.key});

  @override
  State<EmployeeLeaveDetails> createState() => _EmployeeLeaveDetails();
}

class _EmployeeLeaveDetails extends State<EmployeeLeaveDetails> {
  List<Leaves> myLeaveList = [
    Leaves(
        leave_start: "3/8/2022",
        leave_end: "5/8/2022",
        leave_type: "Annual Leave",
        leave_reason: "Family Trip",
        leave_start_time: "9.00",
        leave_end_time: "18.00",
        date_created: "28/7/2022",
        approval_status: "Pending"),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Employee Leave Details'),
      backgroundColor: Colors.blueGrey[900],
      centerTitle: true,
      automaticallyImplyLeading: true,
    ),
        body: SingleChildScrollView(
          child: Column(
            children: myLeaveList.map((e) {
              return Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text("Date From:"),
                        ),
                        Container(
                          child: Text(e.leave_start!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text("Date To:"),
                        ),
                        Container(
                          child: Text(e.leave_end!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text("Leave Type:"),
                        ),
                        Container(
                          child: Text(e.leave_type!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text("Reason:"),
                        ),
                        Container(
                          child: Text(e.leave_reason!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text("Start Time:"),
                        ),
                        Container(
                          child: Text(e.leave_start_time!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text("End Time:"),
                        ),
                        Container(
                          child: Text(e.leave_end_time!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text("Date Submitted:"),
                        ),
                        Container(
                          child: Text(e.date_created!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 40.0),
                          child: Text("Status:"),
                        ),
                        Container(
                          child: Text(e.approval_status!),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 270.0),
                      child: Text("View By:"),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 270.0),
                      child: Text("Reason:"),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                      child: Column(
                        children: [
                          SizedBox(
                              width: 330,
                              child: TextFormField(
                                //controller: leaveReason,
                                maxLines: 3,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.teal,
                                      )),
                                ),
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20.0),
                          child: SizedBox(
                            height: 55,
                            width: 180,
                            child:TextButton(
                              child:Text("Approve",style:TextStyle(fontSize: 19)),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.teal,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                              ), onPressed: () {},
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5.0),
                          child: SizedBox(
                            height: 55,
                            width: 180,
                            child:TextButton(
                              child:Text("Reject",style:TextStyle(fontSize: 19)),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red[400],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                              ), onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

              );
            }).toList(),
          ),
        ),
      );
}
