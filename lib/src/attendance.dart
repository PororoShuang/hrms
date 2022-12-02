import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'attendanceHistory.dart';
import 'attendanceRegistration.dart';


class Attendance extends StatefulWidget{
  const Attendance({super.key});
  @override
  State<Attendance> createState() => _Attendance();
}

class _Attendance extends State<Attendance>
with SingleTickerProviderStateMixin{
late TabController controller;

@override
void initState(){
  super.initState();
  controller=TabController(length: 2, vsync: this);
}

@override
void dispose(){
  controller.dispose();

  super.dispose();
}
  @override
  Widget build(BuildContext context)=> Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        centerTitle: true,
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(text:'Registration'),
            Tab(text:'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          AttendanceRegistration(),
          AttendanceHistory(),
        ],
      ),
  );
}