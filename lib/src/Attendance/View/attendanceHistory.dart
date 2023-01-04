import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/Attendance/Controller/AttendanceAPI.dart';
import 'package:intl/intl.dart';
import '../Model/attendance_information.dart';

class AttendanceHistory extends StatefulWidget {
  const AttendanceHistory({super.key});

  @override
  State<AttendanceHistory> createState() => _AttendanceHistory();
}

class _AttendanceHistory extends State<AttendanceHistory> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<Attendance> myAttendanceList = [];
  bool isLoading = false;

  void getData() async {
    isLoading = false;
    myAttendanceList = (await AttendanceApiService().getHistoryAttendance())!;

    myAttendanceList = myAttendanceList.reversed.toList();

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          isLoading = true;
        }));
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
        body: myAttendanceList.isEmpty || myAttendanceList == null
            ? (isLoading
                ? Image.asset(
                    "assets/noDataFound.png",
                    height: 500,
                    width: 1000,
                  )
                : const Center(child: CircularProgressIndicator()))
            : ListView(
                children: myAttendanceList.map((e) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("Is On Time:"),
                            ),
                            Container(
                              //Validity True = Not Late , False = Late
                              child: Text(e.validity),
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
                              child: e.supposed_start_ != null
                                  ?
                                  // Text(
                                  //     "${DateFormat("HH:mm:ss").format(e.shiftTime!)}")
                                  Text(e.supposed_start_.toString())
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
                              child: e.supposed_start_ != null
                                  ?
                                  // Text(
                                  //     "${DateFormat('yyyy-MM-dd').format(e.shiftDate!)}")
                                  Text(e.shift_date_.toString())
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
                              child: e.check_in_valid_ != null
                                  ?
                                  // Text(
                                  //     "${DateFormat('HH:mm:ss').format(e.start_time_!)}")
                                  Text((e.check_in_valid_.toString() +
                                      " " +
                                      e.start_time_.toString()))
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
                              child: e.check_out_valid_ != null
                                  ?
                                  // Text(
                                  //     "${DateFormat('HH:mm:ss').format(e.end_time_!)}")
                                  Text(e.check_out_valid_.toString() +
                                      " " +
                                      e.end_time_.toString())
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
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.only(left: 40.0),
                        //       child: Text("On leave start time:"),
                        //     ),
                        //     Container(
                        //       child: e.supposed_start_ != null
                        //           ? Text(
                        //               "${DateFormat('HH:mm:ss').format(e.supposed_start_!)}")
                        //           : Text("-"),
                        //     ),
                        //     SizedBox(
                        //       height: 30,
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.only(left: 40.0),
                        //       child: Text("On leave end time:"),
                        //     ),
                        //     Container(
                        //       child: e.supposed_end_ != null
                        //           ? Text(
                        //               "${DateFormat('HH:mm:ss').format(e.supposed_end_!)}")
                        //           : Text("-"),
                        //     ),
                        //     SizedBox(
                        //       height: 30,
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  );
                }).toList(),
              ),
      );
}
