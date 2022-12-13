import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'compensationApprove.dart';
import 'compensationPending.dart';
import 'compensationReject.dart';

class CompensationStatus extends StatefulWidget{
  const CompensationStatus({super.key});
  @override
  State<CompensationStatus> createState() => _CompensationStatus();
}

class _CompensationStatus extends State<CompensationStatus>
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
      title: Text('Compensation Status'),
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
        CompensationPending(),
        CompensationApprove(),
        CompensationReject(),
      ],
    ),
  );
}