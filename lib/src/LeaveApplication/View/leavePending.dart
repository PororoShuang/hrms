import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Controller/LeaveAPI.dart';
import '../Model/leave_information.dart';

class LeavePending extends StatefulWidget {
  const LeavePending({super.key});
  @override
  State<LeavePending> createState() => _LeavePending();
}

class _LeavePending extends State<LeavePending> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<Leaves> myLeaveList = [];
  late List<Leaves> leavePendingList = [];

  void getData() async {
    myLeaveList = (await LeaveApiService().getLeave())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (mounted) setState(() {});
    for (int i = 0; i < myLeaveList.length; i++) {
      if (myLeaveList[i].approval_status.toString().toLowerCase() == " ") {
        leavePendingList.add(myLeaveList[i]);
      }
    }
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
        body: leavePendingList == null || leavePendingList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: leavePendingList.map((e) {
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
                              child: (Text(e.leave_start!)),
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
                      ],
                    ),
                  );
                }).toList(),
              ),
      );
}
