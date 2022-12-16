import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../AccountManagement/Model/employee.dart';
import '../Controller/LeaveAPI.dart';
import '../Model/leave_information.dart';

class LeavePending extends StatefulWidget {
  const LeavePending({super.key});
  @override
  State<LeavePending> createState() => _LeavePending();
}

late List<Leaves>? leaveModel = []; //
late List<Employee>? employeeModel = [];

class _LeavePending extends State<LeavePending> {
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
                          if (leaveModel![index].approval_status.toString() ==
                              " ")
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
