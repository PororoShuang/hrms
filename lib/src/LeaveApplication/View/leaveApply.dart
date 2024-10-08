import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/LeaveApplication/View/leavePending.dart';
import 'package:hrms/src/LeaveApplication/View/leaveStatus.dart';
import 'package:image_picker/image_picker.dart';

import '../Controller/LeaveAPI.dart';
import '../Model/leave_information.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeave();
}

class _ApplyLeave extends State<ApplyLeave> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<Leaves> myLeaveList = [];
  late List<Leaves> totalList = [];
  void getData() async {
    myLeaveList = (await LeaveApiService().getTotalLeave())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (mounted) setState(() {});
  } //

  XFile? image;
  final ImagePicker picker = ImagePicker();
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  String? dateToString;
  String? dateFromString;
  String? startTimeString;
  String? endTimeString;
  TextEditingController leaveReason = new TextEditingController();
  List<String> itemsType = [
    'Select a type',
    'Paid',
    'Sick',
    'Unpaid',
  ];
  String? leaveType = 'Select a type';

  DateTime dateFrom = DateTime.now();
  DateTime dateTo = DateTime.now();
  TimeOfDay StartTime = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay EndTime = TimeOfDay(hour: 00, minute: 00);

  void showToastSubmitted() {
    Fluttertoast.showToast(
        msg: 'Leave Submitted',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal,
        textColor: Colors.white);
  }
  //Could implement in future as enhancement
  // void myAlert() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //           title: Text('Please choose media to select'),
  //           content: Container(
  //             height: MediaQuery.of(context).size.height / 6,
  //             child: Column(
  //               children: [
  //                 ElevatedButton(
  //                   //if user click this button, user can upload image from gallery
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     getImage(ImageSource.gallery);
  //                   },
  //                   child: Row(
  //                     children: [
  //                       Icon(Icons.image),
  //                       Text('From Gallery'),
  //                     ],
  //                   ),
  //                 ),
  //                 ElevatedButton(
  //                   //if user click this button. user can upload image from camera
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     getImage(ImageSource.camera);
  //                   },
  //                   child: Row(
  //                     children: [
  //                       Icon(Icons.camera),
  //                       Text('From Camera'),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    final hoursStartTime = StartTime.hour.toString().padLeft(2, '0');
    final minutesStartTime = StartTime.minute.toString().padLeft(2, '0');
    final hoursEndTime = EndTime.hour.toString().padLeft(2, '0');
    final minutesEndTime = EndTime.minute.toString().padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Leave'),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Row(
                    children: [
                      Text('Date From : ',
                          style: TextStyle(
                              height: 2, fontSize: 18, color: Colors.black)),
                      Text(
                        '${dateFrom.year}/${dateFrom.month}/${dateFrom.day}',
                        style: TextStyle(
                            height: 2, fontSize: 18, color: Colors.black),
                      ),
                      IconButton(
                        icon: const Icon(Icons.date_range),
                        color: Colors.green,
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateFrom,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          //if 'Cancel' return null
                          if (newDate == null) return;
                          //if 'ok' date time
                          setState(() {
                            dateFrom = newDate;
                            dateFromString = dateFrom.year.toString() +
                                "-" +
                                dateFrom.month.toString().padLeft(2, "0") +
                                "-" +
                                dateFrom.day.toString().padLeft(2, "0");
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  child: Row(
                    children: [
                      Text('Date To      : ',
                          style: TextStyle(
                              height: 1, fontSize: 18, color: Colors.black)),
                      Text(
                        '${dateTo.year}/${dateTo.month}/${dateTo.day}',
                        style: TextStyle(
                            height: 1, fontSize: 18, color: Colors.black),
                      ),
                      IconButton(
                        icon: const Icon(Icons.date_range),
                        onPressed: () async {
                          DateTime? newDate = await showDatePicker(
                            context: context,
                            initialDate: dateTo,
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                          );
                          //if 'Cancel' return null
                          if (newDate == null) return;
                          //if 'ok' date time
                          setState(() {
                            dateTo = newDate;
                            dateToString = dateTo.year.toString() +
                                "-" +
                                dateTo.month.toString().padLeft(2, "0") +
                                "-" +
                                dateTo.day.toString().padLeft(2, "0");
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment(-0.8, 1.0),
                  child: Text('Leave Type  ',
                      style: TextStyle(
                        height: 1,
                        fontSize: 18,
                      )),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 3),
                      SizedBox(
                        width: 350,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          value: leaveType,
                          items: itemsType
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontStyle: FontStyle.italic)),
                                  ))
                              .toList(),
                          onChanged: (item) => setState(() => leaveType = item),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment(-0.8, 1.0),
                  child: Text('Reasons  ',
                      style: TextStyle(
                        height: 1,
                        fontSize: 18,
                      )),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                  child: Column(
                    children: [
                      SizedBox(
                          width: 350,
                          child: TextFormField(
                            controller: leaveReason,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  child: Row(
                    children: [
                      Text('Leave Start Time : ',
                          style: TextStyle(
                              height: 1, fontSize: 18, color: Colors.black)),
                      Text('$hoursStartTime:$minutesStartTime',
                          style: TextStyle(
                              height: 1, fontSize: 18, color: Colors.black)),
                      IconButton(
                        icon: const Icon(Icons.access_time_filled_sharp),
                        color: Colors.green,
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: StartTime,
                          );
                          //if 'Cancel' return null
                          if (newTime == null) return;
                          //if 'ok' date time
                          setState(() {
                            StartTime = newTime;
                            startTimeString =
                                StartTime.hour.toString().padLeft(2, "0") +
                                    ":" +
                                    StartTime.minute.toString().padLeft(2, "0");
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  child: Row(
                    children: [
                      Text('Leave End Time   : ',
                          style: TextStyle(
                              height: 1, fontSize: 18, color: Colors.black)),
                      Text('$hoursEndTime:$minutesEndTime',
                          style: TextStyle(
                              height: 1, fontSize: 18, color: Colors.black)),
                      IconButton(
                        icon: const Icon(Icons.access_time_filled_sharp),
                        color: Colors.black,
                        onPressed: () async {
                          TimeOfDay? newTime = await showTimePicker(
                            context: context,
                            initialTime: EndTime,
                          );
                          //if 'Cancel' return null
                          if (newTime == null) return;
                          //if 'ok' date time
                          setState(() {
                            EndTime = newTime;
                            endTimeString =
                                EndTime.hour.toString().padLeft(2, "0") +
                                    ":" +
                                    EndTime.minute.toString().padLeft(2, "0");
                          });
                        },
                      ),
                    ],
                  ),
                ),
                // Column(
                //   children: [
                //     Container(
                //       padding: const EdgeInsets.only(left: 0.0),
                //       child: ElevatedButton(
                //         onPressed: () {
                //           myAlert();
                //         },
                //         child: Text('Upload Photo'),
                //       ),
                //     ),
                //     SizedBox(
                //       height: 10,
                //     ), //if image not null show the image
                //     //if image null show text
                //     image != null
                //         ? Container(
                //             alignment: Alignment.centerLeft,
                //             padding: const EdgeInsets.symmetric(horizontal: 20),
                //             child: ClipRRect(
                //               borderRadius: BorderRadius.circular(8),
                //               child: Image.file(
                //                 //to show image, you type like this.
                //                 File(image!.path),
                //                 fit: BoxFit.cover,
                //                 //width: MediaQuery.of(context).size.width,
                //                 width: 150,
                //                 height: 250,
                //               ),
                //             ),
                //           )
                //         : Text(
                //             "No Image",
                //             style: TextStyle(fontSize: 20),
                //           ),
                //   ],
                // ),
                SizedBox(height: 10),
                SizedBox(
                  height: 55,
                  width: 300,
                  child: TextButton(
                    child: Text("Submit", style: TextStyle(fontSize: 19)),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.indigo[900],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(112)),
                    ),
                    onPressed: () {
                      if (startTimeString == null || endTimeString == null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text(
                                'Please select leave start time or end time'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'))
                            ],
                          ),
                        );
                      } else if (dateFromString == null ||
                          dateToString == null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Please Select Date'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'))
                            ],
                          ),
                        );
                      } else if (leaveType!.toLowerCase() == "select a type") {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Please Select a Leave Type'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'))
                            ],
                          ),
                        );
                      } else {
                        String? leaveStart =
                            "${dateFromString}T$startTimeString:00";
                        String? leaveEnd = "${dateToString}T$endTimeString:00";

                        DateTime leaveStartDT =
                        DateTime.parse(leaveStart.replaceAll("T", " "));
                        DateTime leaveEndDT =
                        DateTime.parse(leaveEnd.replaceAll("T", " "));

                        //if leaveEnd Date Time is earlier than Leave Start, got error
                        if (leaveEndDT.compareTo(leaveStartDT) < 0) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text(
                                  'Invalid Leave Start Time and Leave End Time'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('OK'))
                              ],
                            ),
                          );
                        } else if (leaveEndDT.compareTo(leaveStartDT) == 0 ||
                            leaveEndDT.compareTo(leaveStartDT) > 0) {
                          LeaveApiService().postLeave(
                            myLeaveList.length + 1,
                            leaveStart,
                            leaveEnd,
                            leaveType,
                            leaveReason.text,
                          );
                          showToastSubmitted();
                          Future.delayed(Duration(milliseconds: 600), () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LeaveStatus()));
                          });
                        }
                      }

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const LeavePending()));
                    },
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  child: Row(
                    children: [
                      Text('Total Paid Leave Left     : ',
                          style: TextStyle(
                              height: 2, fontSize: 18, color: Colors.black)),
                      Text(userModel.paidLeaveHourLeft.toString() + " Hours",
                          style: TextStyle(
                              height: 2, fontSize: 18, color: Colors.black)),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                //   child: Row(
                //     children: [
                //       Text('Total Paid Leave Pending  : ',
                //           style: TextStyle(
                //               height: 2, fontSize: 18, color: Colors.black)),
                //       Text(userModel.paidLeaveOnBargain.toString() + " Hours",
                //           style: TextStyle(
                //               height: 2, fontSize: 18, color: Colors.black)),
                //     ],
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                  child: Row(
                    children: [
                      Text('Total Sick Leave Left   : ',
                          style: TextStyle(
                              height: 2, fontSize: 18, color: Colors.black)),
                      Text(userModel.sickLeaveHourLeft.toString() + " Hours",
                          style: TextStyle(
                              height: 2, fontSize: 18, color: Colors.black)),
                    ],
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                //   child: Row(
                //     children: [
                //       Text('Total Sick Leave Pending   : ',
                //           style: TextStyle(
                //               height: 2, fontSize: 18, color: Colors.black)),
                //       Text(userModel.sickLeaveOnBargain.toString() + " Hours",
                //           style: TextStyle(
                //               height: 2, fontSize: 18, color: Colors.black)),
                //     ],
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
