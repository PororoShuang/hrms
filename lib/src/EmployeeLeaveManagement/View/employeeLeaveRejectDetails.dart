import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../LeaveApplication/Model/leave_information.dart';

class EmployeeLeaveRejectDetails extends StatefulWidget {
  const EmployeeLeaveRejectDetails({super.key, required this.myLeave});

  final Leaves myLeave;

  @override
  State<EmployeeLeaveRejectDetails> createState() => _EmployeeLeaveRejectDetails();
}

class _EmployeeLeaveRejectDetails extends State<EmployeeLeaveRejectDetails> {

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
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 40.0),
                child: Text("Date From:"),
              ),
              Container(
                child: Text(widget.myLeave.leave_start ?? "-"),
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
                child: Text(widget.myLeave.leave_end ?? "-"),
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
                child: Text(widget.myLeave.leave_type ?? "-"),
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
                child: Text(widget.myLeave.leave_reason ?? "-"),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(left: 40.0),
          //       child: Text("Start Time:"),
          //     ),
          //     Container(
          //       child: Text(widget.myLeave.leave_start_time ?? "-"),
          //     ),
          //     SizedBox(
          //       height: 30,
          //     ),
          //   ],
          // ),
          // Row(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(left: 40.0),
          //       child: Text("End Time:"),
          //     ),
          //     Container(
          //       child: Text(widget.myLeave.leave_end_time ?? "-"),
          //     ),
          //     SizedBox(
          //       height: 30,
          //     ),
          //   ],
          // ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 40.0),
                child: Text("Date Submitted:"),
              ),
              Container(
                child: Text(widget.myLeave.date_created ?? "-"),
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
                child: Text(widget.myLeave.approval_status ?? "-"),
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
                child: Text("Rejected By:"),
              ),
              Container(
                child: Text(widget.myLeave.approved_by ?? "-"),
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
                child: Text(widget.myLeave.response_message ?? "-"),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),

        ],
      ),
    ),
  );
}
