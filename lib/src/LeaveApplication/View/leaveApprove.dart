import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/leave_information.dart';

class LeaveApprove extends StatefulWidget {
  const LeaveApprove({super.key});
  @override
  State<LeaveApprove> createState() => _LeaveApprove();
}

class _LeaveApprove extends State<LeaveApprove> {
  List<Leaves> myLeaveList = [
    Leaves(
        leave_start: "3/8/2022",
        leave_end: "5/8/2022",
        leave_type: "Annual Leave",
        leave_reason: "Family Trip",
        leave_start_time: "9.00",
        leave_end_time: "18.00",
        date_created: "28/7/2022",
        approval_status: "Approved"),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ListView(
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
                ],
              ),
            );
          }).toList(),
        ),
      );
}
