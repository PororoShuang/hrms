import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/EmployeeLeaveManagement/Model/employee_information.dart';
import 'package:hrms/src/EmployeeLeaveManagement/View/employeeLeaveDetails.dart';
import '../Controller/accountAPI.dart';
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

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getAccountData();
      await getData();
    });
  }

  List<EmployeeLeaves> leaveDescendedPendingList = [];
  List<EmployeeInfo> employeeList = [];

  Future<void> getAccountData() async {
    List<EmployeeInfo> myEmployeeList = [];

    myEmployeeList =
        await ApiServiceEmployeeInfo().getUsers() ?? <EmployeeInfo>[];

    print("employeeList length  ${myEmployeeList.length}");

    for (int i = 0; i < myEmployeeList.length; i++) {
      print("looping $i");
      employeeList.add(myEmployeeList[i]);
      print("employeeList employee employeeId ${employeeList[i].employeeId}");
    }

    print("employeeList ${employeeList.length}");

    if (mounted) setState(() {});
  }

  Future<void> getData() async {
    List<EmployeeLeaves> myLeaveList = [];
    myLeaveList = (await EmployeeLeaveApiService().getLeave())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (mounted) setState(() {});
    List<EmployeeLeaves> leavePendingList = [];
    for (int i = 0; i < myLeaveList.length; i++) {
      if (myLeaveList[i].approval_status == "") {
        print("myLeaveList staff id ${myLeaveList[i].staff_id}");

        for (int j = 0; j < employeeList.length; j++) {
          print("myLeaveList employeeList userId ${employeeList[j].userId}");
          print("myLeaveList employeeList aspId ${employeeList[j].aspId}");
          print(
              "myLeaveList employeeList employeeId ${employeeList[j].employeeId}");
        }

        for (int k = 0; k < employeeList.length; k++) {
          if (employeeList[k].employeeId == myLeaveList[i].staff_id) {
            myLeaveList[i].staff_name = employeeList[k].employeeName;
          }
        }

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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmployeeLeaveDetails(
                                      myLeave:
                                      leaveDescendedPendingList[index])),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        ListTile(
                          title: Text(
                              leaveDescendedPendingList[index].staff_id ??
                                  "-"),
                          subtitle:Text(
                              leaveDescendedPendingList[index].staff_name ??
                                  "-"),
                        ),
                      ],
                    ),
                  );
                },
              ),
      );
}
