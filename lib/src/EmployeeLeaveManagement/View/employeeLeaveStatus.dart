import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'employeeLeaveApprove.dart';
import 'employeeLeavePending.dart';
import 'employeeLeaveReject.dart';

class EmployeeLeaveStatus extends StatefulWidget{
  const EmployeeLeaveStatus({super.key});
  @override
  State<EmployeeLeaveStatus> createState() => _EmployeeLeaveStatus();
}

class _EmployeeLeaveStatus extends State<EmployeeLeaveStatus>
    with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState(){
    super.initState();
    controller=TabController(length: 3, vsync: this);
  }

  @override
  void dispose(){
    controller.dispose();

    super.dispose();}

  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(
      title: Text('Employee Leave'),
      backgroundColor: Colors.blueGrey[900],
      centerTitle: true,
      bottom: TabBar(
        controller: controller,
        tabs: [
          Tab(text:'Pending'),
          Tab(text:'Approved'),
          Tab(text:'Rejected'),
        ],
      ),
    ),
    body: TabBarView(
      controller: controller,
      children: [
        EmployeeLeavePending(),
        EmployeeLeaveApprove(),
        EmployeeLeaveReject(),
      ],
    ),
  );
}