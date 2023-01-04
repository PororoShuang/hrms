import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../AccountManagement/Model/employee.dart';
import '../../LeaveApplication/Model/leave_information.dart';
import '../Controller/accountAPI.dart';
import '../Controller/employeeLeaveAPI.dart';
import 'employeeLeaveApproveDetails.dart';

class EmployeeLeaveApprove extends StatefulWidget {
  const EmployeeLeaveApprove({super.key});

  @override
  State<EmployeeLeaveApprove> createState() => _EmployeeLeaveApprove();
}

class _EmployeeLeaveApprove extends State<EmployeeLeaveApprove> {
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getAccountData();
      await getData();
    });
  }

  List<Leaves> leaveDescendedApproveList = [];
  List<Employee> employeeList = [];
  bool isLoading = false;

  Future<void> getAccountData() async {
    List<Employee> myEmployeeList = [];

    myEmployeeList = await ApiServiceEmployeeInfo().getUsers() ?? <Employee>[];

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
    bool isLoading = false;
    List<Leaves> myLeaveList = [];
    myLeaveList = (await EmployeeLeaveApiService().getTotalLeave())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (mounted) setState(() {});
    List<Leaves> leaveRejectList = [];
    for (int i = 0; i < myLeaveList.length; i++) {
      if (myLeaveList[i].approval_status.toString().toLowerCase() ==
          "approved") {
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

        leaveRejectList.add(myLeaveList[i]);
      }
    }
    leaveDescendedApproveList = leaveRejectList.toList();
    isLoading = true;
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
        body: leaveDescendedApproveList == null ||
                leaveDescendedApproveList.isEmpty
            ? (isLoading
            ? Image.asset(
          "assets/noDataFound.png",
          height: 500,
          width: 1000,
        )
            : const Center(child: CircularProgressIndicator()))
            : ListView.builder(
                itemCount: leaveDescendedApproveList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(
                                    leaveDescendedApproveList[index].staff_id ??
                                        "-"),
                                subtitle: Text(leaveDescendedApproveList[index]
                                        .staff_name ??
                                    "-"),
                              ),
                            ),
                       Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EmployeeLeaveApproveDetails(
                                                      myLeave:
                                                          leaveDescendedApproveList[
                                                              index])),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3.0),
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
                                  )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      );
}
