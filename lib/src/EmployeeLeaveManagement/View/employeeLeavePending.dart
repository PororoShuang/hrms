import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrms/src/EmployeeLeaveManagement/View/employeeLeavePendingDetails.dart';
import '../../AccountManagement/Model/employee.dart';
import '../../LeaveApplication/Model/leave_information.dart';
import '../Controller/accountAPI.dart';
import '../Controller/employeeLeaveAPI.dart';

class EmployeeLeavePending extends StatefulWidget {
  EmployeeLeavePending({super.key, required this.currentLoginID});

  final String? currentLoginID;

  @override
  State<EmployeeLeavePending> createState() => _EmployeeLeavePending();
}

class _EmployeeLeavePending extends State<EmployeeLeavePending> {

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getAccountData();
      await getData();
    });
  }

  List<Leaves> leaveDescendedPendingList = [];
  List<Employee> employeeList = [];
  bool isLoading = false;

  Future<void> getAccountData() async {
    List<Employee> myEmployeeList = [];

    myEmployeeList = await ApiServiceEmployeeInfo().getUsers() ?? <Employee>[];

    print("employeeList length  ${myEmployeeList.length}");

    for (int i = 0; i < myEmployeeList.length; i++) {
      employeeList.add(myEmployeeList[i]);
      print("employeeList employee employeeId ${employeeList[i].employeeId}");
    }

    print("employeeList ${employeeList.length}");

    if (mounted) setState(() {});
  }

  Future<void> getData() async {
    isLoading = false;
    List<Leaves> myLeaveList = [];
    myLeaveList = (await EmployeeLeaveApiService().getTotalLeave())!;

    if (mounted) setState(() {});
    List<Leaves> leavePendingList = [];
    for (int i = 0; i < myLeaveList.length; i++) {
      if (myLeaveList[i].approval_status == "") {
        print("myLeaveList staff id ${myLeaveList[i].staff_id}");

        for (int k = 0; k < employeeList.length; k++) {
          if (employeeList[k].employeeId == myLeaveList[i].staff_id) {
            myLeaveList[i].staff_name = employeeList[k].employeeName;
          }
        }
        leavePendingList.add(myLeaveList[i]);
      }
    }
    leaveDescendedPendingList = leavePendingList.toList();
    isLoading = true;
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
        body: leaveDescendedPendingList == null ||
                leaveDescendedPendingList.isEmpty
            ? (isLoading
                ? Image.asset(
                    "assets/noDataFound.png",
                    height: 500,
                    width: 1000,
                  )
                : const Center(child: CircularProgressIndicator()))
            : ListView.builder(
                itemCount: leaveDescendedPendingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(
                                    leaveDescendedPendingList[index].staff_id ??
                                        "-"),
                                subtitle: Text(leaveDescendedPendingList[index]
                                        .staff_name ??
                                    "-"),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EmployeeLeavePendingDetails(
                                                myLeave:
                                                    leaveDescendedPendingList[
                                                        index])),
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " ",
                                      ),
                                      Icon(
                                        Icons.density_medium,
                                        color: Colors.indigo,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      );
}
