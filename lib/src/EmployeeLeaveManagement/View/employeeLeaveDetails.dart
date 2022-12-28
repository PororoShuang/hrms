import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/EmployeeLeaveManagement/Controller/employeeLeaveAPI.dart';
import 'package:hrms/src/EmployeeLeaveManagement/Model/employeeLeave_information.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/LeaveApplication/Controller/LeaveAPI.dart';

class EmployeeLeaveDetails extends StatefulWidget {
  const EmployeeLeaveDetails({super.key, required this.myLeave});

  final EmployeeLeaves myLeave;

  @override
  State<EmployeeLeaveDetails> createState() => _EmployeeLeaveDetails();
}

class _EmployeeLeaveDetails extends State<EmployeeLeaveDetails> {
  TextEditingController managerleaveReason = new TextEditingController();

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
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text("Start Time:"),
                  ),
                  Container(
                    child: Text(widget.myLeave.leave_start_time ?? "-"),
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
                    child: Text(widget.myLeave.leave_end_time ?? "-"),
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
                    child: Text(widget.myLeave.date_created ?? "-"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Text("Leave ID is ${widget.myLeave.leave_id}"),
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
              Container(
                padding: EdgeInsets.only(right: 270.0),
                child: Text(userModel.getEmployeeId),
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
                          controller: managerleaveReason,
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
                      child: TextButton(
                        child: Text("Approve", style: TextStyle(fontSize: 19)),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(112)),
                        ),
                        onPressed: () async {
                          await EmployeeLeaveApiService().approveOrRejectLeave(
                              widget.myLeave.leave_id,
                              widget.myLeave.staff_id,
                              widget.myLeave.leave_type,
                              widget.myLeave.leave_start,
                              widget.myLeave.leave_end,
                              widget.myLeave.leave_reason,
                              "Approved",
                              managerleaveReason.text);

                          //await LeaveApiService().getLeave();
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 5.0),
                    child: SizedBox(
                      height: 55,
                      width: 180,
                      child: TextButton(
                        child: Text("Reject", style: TextStyle(fontSize: 19)),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red[400],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(112)),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
