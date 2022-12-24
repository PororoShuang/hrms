import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/EmployeeLeaveManagement/View/employeeLeaveDetails.dart';
import '../Controller/employeeLeaveAPI.dart';
import '../Model/employeeLeave_information.dart';

class EmployeeLeavePending extends StatefulWidget {
  const EmployeeLeavePending({super.key});

  @override
  State<EmployeeLeavePending> createState() => _EmployeeLeavePending();
}

class _EmployeeLeavePending extends State<EmployeeLeavePending> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<EmployeeLeaves> leaveDescendedPendingList = [];

  void getData() async {
    List<EmployeeLeaves> myLeaveList = [];
    myLeaveList = (await LeaveApiService().getLeave())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (mounted) setState(() {});
    List<EmployeeLeaves> leavePendingList = [];
    for (int i = 0; i < myLeaveList.length; i++) {
      if (myLeaveList[i].approval_status == "") {
        leavePendingList.add(myLeaveList[i]);
      }
    }
    leaveDescendedPendingList = leavePendingList.reversed.toList();
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
        body: leaveDescendedPendingList == null ||
                leaveDescendedPendingList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: leaveDescendedPendingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 8),
                        ListTile(
                          title:Text(leaveDescendedPendingList[index].staff_id??"-"),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmployeeLeaveDetails(myLeave:leaveDescendedPendingList[index])),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " ",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Icon(
                                  Icons.density_medium,
                                  color: Colors.indigo,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      );
}
