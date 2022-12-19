import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Controller/LeaveAPI.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeave();
}

class _ApplyLeave extends State<ApplyLeave> {
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
                                dateFrom.month.toString() +
                                "-" +
                                dateFrom.day.toString();
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
                                dateTo.month.toString() +
                                "-" +
                                dateTo.day.toString();
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
                            startTimeString = StartTime.hour.toString() +
                                ":" +
                                StartTime.minute.toString();
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
                            endTimeString = EndTime.hour.toString() +
                                ":" +
                                EndTime.minute.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
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
                      if(startTimeString == null || endTimeString== null){
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Please select leave start time or end time'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'))
                            ],
                          ),
                        );

                      }else if(dateFromString == null || dateToString==null){
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('Please select date'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'))
                            ],
                          ),
                        );

                      } else{
                        String? leaveStart =
                            "${dateFromString}T$startTimeString:00";
                        String? leaveEnd = "${dateToString}T$endTimeString:00";
                        LeaveApiService().postLeave(
                            leaveStart, leaveEnd, leaveType, leaveReason.text);
                      }

                      // setState(() {
                      //   if (postResult == true) {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(
                      //           content: Text('Leave Applied Successfully!')),
                      //     );
                      //   } else {
                      //     ScaffoldMessenger.of(context).showSnackBar(
                      //       const SnackBar(
                      //           content: Text(
                      //               'Something went wrong! Please try again!')),
                      //     );
                      //   }
                      // });
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}