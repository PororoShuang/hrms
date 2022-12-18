import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'leaveApprove.dart';
import 'leavePending.dart';
import 'leaveReject.dart';

class LeaveStatus extends StatefulWidget {
  const LeaveStatus({super.key});
  @override
  State<LeaveStatus> createState() => _LeaveStatus();
}

class _LeaveStatus extends State<LeaveStatus>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Leave Status'),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          bottom: TabBar(
            controller: controller,
            tabs: [
              Tab(text: 'Pending'),
              Tab(text: 'Approved'),
              Tab(text: 'Rejected'),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            LeavePending(),
            LeaveApprove(),
            LeaveReject(),
          ],
        ),
      );
}
