import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrms/src/EmployeeLeaveManagement/View/employeeLeavePendingDetails.dart';
import '../../AccountManagement/Model/employee.dart';
import '../../LeaveApplication/Controller/LeaveAPI.dart';
import '../../LeaveApplication/Model/leave_information.dart';
import '../Controller/accountAPI.dart';
import '../Controller/employeeLeaveAPI.dart';


class EmployeeLeavePending extends StatefulWidget {
  const EmployeeLeavePending({super.key});

  @override
  State<EmployeeLeavePending> createState() => _EmployeeLeavePending();
}

class _EmployeeLeavePending extends State<EmployeeLeavePending> {
  bool value = false;
  void RefreshData(){
    setState(() {
      value=true;
    });
  }
  void showToast() {
    Fluttertoast.showToast(
        msg: 'Leave Rejected',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[400],
        textColor: Colors.white);
  }
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

  Future<void> getAccountData() async {
    List<Employee> myEmployeeList = [];

    myEmployeeList =
        await ApiServiceEmployeeInfo().getUsers() ?? <Employee>[];

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
    List<Leaves> myLeaveList = [];
    myLeaveList = (await EmployeeLeaveApiService().getTotalLeave())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (mounted) setState(() {});
    List<Leaves> leavePendingList = [];
    for (int i = 0; i < myLeaveList.length; i++) {
      if (myLeaveList[i].approval_status == "") {
        print("myLeaveList staff id ${myLeaveList[i].staff_id}");

        // for (int j = 0; j < employeeList.length; j++) {
        //   print("myLeaveList employeeList userId ${employeeList[j].userId}");
        //   print("myLeaveList employeeList aspId ${employeeList[j].aspId}");
        //   print("myLeaveList employeeList employeeId ${employeeList[j].employeeId}");
        // }

        for (int k = 0; k < employeeList.length; k++) {
          if (employeeList[k].employeeId == myLeaveList[i].staff_id) {
            myLeaveList[i].staff_name = employeeList[k].employeeName;
          }
        }
        leavePendingList.add(myLeaveList[i]);
      }
    }
    leaveDescendedPendingList = leavePendingList.toList();
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
        body: leaveDescendedPendingList == null ||
                leaveDescendedPendingList.isEmpty || value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: leaveDescendedPendingList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                      Row(
                        children: [

                          Expanded(child:
                          ListTile(
                            title: Text(
                                leaveDescendedPendingList[index].staff_id ??
                                    "-"),
                            subtitle:Text(
                                leaveDescendedPendingList[index].staff_name ??
                                    "-"),
                          ),
                          ),
                          // userModel.employeeId == "E00002"
                          //     ?
                              Expanded(child: GestureDetector(
                                onTap: () async {
                                  String refresh = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EmployeeLeavePendingDetails(
                                                myLeave:
                                                    leaveDescendedPendingList[
                                                        index])),
                                  );
                                  if(refresh == 'refresh'){
                                    RefreshData();
                                    await EmployeeLeaveApiService().getTotalLeave();
                                  }
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
                            )
                          //         :AlertDialog(
                          //   title: const Text('Log Out'),
                          //   content: const Text(
                          //       'Are you confirm want to log out?'),
                          //   actions: <Widget>[
                          //     TextButton(
                          //       onPressed: () =>
                          //           Navigator.pop(context, 'Cancel'),
                          //       child: const Text('Cancel'),
                          //     ),
                          //     TextButton(
                          //       onPressed: () =>
                          //           Navigator.pop(context, 'Cancel'),
                          //       child: const Text('Cancel'),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                       
                      ],
                    ),
                  );
                },
              ),
      );
}
