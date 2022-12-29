import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrms/src/EmployeeLeaveManagement/Controller/employeeLeaveAPI.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import '../../LeaveApplication/Model/leave_information.dart';

class EmployeeLeavePendingDetails extends StatefulWidget {
  const EmployeeLeavePendingDetails({super.key, required this.myLeave});

  final Leaves myLeave;

  @override
  State<EmployeeLeavePendingDetails> createState() => _EmployeeLeavePendingDetails();
}

class _EmployeeLeavePendingDetails extends State<EmployeeLeavePendingDetails> {
  TextEditingController managerLeaveReason = new TextEditingController();

  void showToastApproved() {
    Fluttertoast.showToast(
        msg: 'Leave Approved',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal,
        textColor: Colors.white);
  }

  void showToastRejected() {
    Fluttertoast.showToast(
        msg: 'Leave Rejected',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[400],
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Employee Leave Details'),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: userModel.employeeId=="R00019"? Column(
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
                    child: Text("Approved By:"),
                  ),
                  Container(
                    child: Text(userModel.getEmployeeId),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(right: 280.0),
                child: Text("Reason:"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 2),
                child: Column(
                  children: [
                    SizedBox(
                        width: 330,
                        child: TextFormField(
                          controller: managerLeaveReason,
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
                            managerLeaveReason.text,
                            widget.myLeave.doc_file_path,
                          );

                          showToastApproved();
                          Future.delayed(Duration(milliseconds: 600), () {
                            Navigator.pop(
                              context,'refresh'
                            );
                          });
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
                        onPressed: () async {
                          await EmployeeLeaveApiService().approveOrRejectLeave(
                            widget.myLeave.leave_id,
                            widget.myLeave.staff_id,
                            widget.myLeave.leave_type,
                            widget.myLeave.leave_start,
                            widget.myLeave.leave_end,
                            widget.myLeave.leave_reason,
                            "Rejected",
                            managerLeaveReason.text,
                            widget.myLeave.doc_file_path,
                          );

                          showToastRejected();
                          Future.delayed(Duration(milliseconds: 600), () {
                            Navigator.pop(
                              context,true
                            );
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ): AlertDialog(
            title: const Text('Notice'),
             content: const Text(
                'Yor are not allow to approve or reject the leave by yourself'),
             actions: <Widget>[
              TextButton(
                 onPressed: () =>
                     Navigator.pop(context, 'Cancel'),
                 child: const Text('Cancel'),
               ),
               TextButton(
                 onPressed: () =>
                     Navigator.pop(context, 'OK'),
                child: const Text('OK'),
               ),
             ],
           ),
        ),
      );
}
