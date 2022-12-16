import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/LeaveApplication/Controller/LeaveAPI.dart';
import 'package:hrms/src/LeaveApplication/Model/leave_information.dart';
import 'package:hrms/src/LeaveApplication/View/leave.dart';

class LeaveApprove extends StatefulWidget {
  const LeaveApprove({super.key});
  @override
  State<LeaveApprove> createState() => _LeaveApprove();
}

late List<Leaves>? leaveModel = []; //
late List<Employee>? employeeModel = [];

class _LeaveApprove extends State<LeaveApprove> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    leaveModel = (await LeaveApiService().getLeave())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  } //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: leaveModel == null || leaveModel!.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: leaveModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (leaveModel![index]
                                  .approval_status
                                  .toString()
                                  .toLowerCase() ==
                              "approved")
                            Text(leaveModel![index].date_created.toString()),
                          Text(leaveModel![index].leave_start.toString()),
                          Text(leaveModel![index].leave_end.toString()),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
