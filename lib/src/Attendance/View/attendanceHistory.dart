import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Model/attendance_information.dart';


class AttendanceHistory extends StatefulWidget {
  const AttendanceHistory({super.key});

  @override
  State<AttendanceHistory> createState() => _AttendanceHistory();
}

class _AttendanceHistory extends State<AttendanceHistory> {
  List<Attendance> myAttendanceList = [
    Attendance(
      attendance_id_: "",
      staff_id_: "",
      shift_id_: "",
      start_time_: DateTime.tryParse('2022-01-10 10:00:00'),
      end_time_: DateTime.tryParse('2022-01-10 19:00:00'),
      validity_: true,
      on_leave_: true,
      leave_id_: "",
      supposed_start_: DateTime.tryParse('2022-01-10 11:30:00'),
      supposed_end_: DateTime.tryParse('2022-01-10 18:30:00'),
      status:"On Time",
      shiftTime:DateTime.tryParse('2022-01-10 18:00:00'),
      shiftDate: DateTime.tryParse('2022-01-10 18:00:00'),
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView(
      children: myAttendanceList.map((e) {
        return Card(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 280.0),
                    child: Text("Status:"),
                  ),
                  Container(
                    child: Text(e.status!),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text("Shift Time:"),
                  ),
                  Container(
                    //child:Text("${DateFormat('yyyy-MM-dd kk:mm').format(e.shiftTime!)}")
                    //child: Text("${e.shiftTime!=null?e.shiftTime:"9.00"}"),
                    //"${DateFormat('yyyy-MM-dd kk:mm').format(e.shiftTime!)}"
                    child: e.shiftTime != null
                        ? Text(
                        "${DateFormat("HH:mm:ss").format(e.shiftTime!)}")
                        : Text("-"),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text("Shift Date:"),
                  ),
                  Container(
                    child:e.shiftDate != null
                        ? Text(
                        "${DateFormat('yyyy-MM-dd').format(e.shiftDate!)}")
                        : Text("-"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text("Check In:"),
                  ),
                  Container(
                    child: e.start_time_ != null
                        ? Text(
                        "${DateFormat('HH:mm:ss').format(e.start_time_!)}")
                        : Text("-"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text("Check Out:"),
                  ),
                  Container(
                    child: e.end_time_ != null
                        ? Text(
                        "${DateFormat('HH:mm:ss').format(e.end_time_!)}")
                        : Text("-"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text("On leave start time:"),
                  ),
                  Container(
                    child: e.supposed_start_ != null
                        ? Text(
                        "${DateFormat('HH:mm:ss').format(e.supposed_start_!)}")
                        : Text("-"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text("On leave end time:"),
                  ),
                  Container(
                    child: e.supposed_end_ != null
                        ? Text(
                        "${DateFormat('HH:mm:ss').format(e.supposed_end_!)}")
                        : Text("-"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    ),
  );
}
