import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/leave_information.dart';

import '../../AccountManagement/Model/employee.dart';
import '../Controller/LeaveAPI.dart';
import '../Model/leave_information.dart';

class LeaveReject extends StatefulWidget {
  const LeaveReject({super.key});
  @override
  State<LeaveReject> createState() => _LeaveReject();
}

class _LeaveReject extends State<LeaveReject> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<Leaves> myLeaveList = [];
  List<Leaves> rejectList = [];

  void getData() async {
    myLeaveList = (await LeaveApiService().getLeave())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (mounted) setState(() {});
    for (int i = 0; i < myLeaveList.length; i++) {
      if (myLeaveList[i].approval_status.toString().toLowerCase() ==
          "rejected") {
        rejectList.add(myLeaveList[i]);
      }
    }
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
        body: rejectList == null || rejectList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: rejectList.map((e) {
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
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("Approved by:"),
                            ),
                            Container(
                              child: Text(e.approved_by!),
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
                              child: Text("Comment:"),
                            ),
                            Container(
                              child: Text(e.response_message!),
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
