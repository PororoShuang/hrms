import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/Attendance/Controller/AttendanceAPI.dart';
import '../../Attendance/Model/attendance_information.dart';

class Shift extends StatefulWidget {
  const Shift({super.key});

  @override
  State<Shift> createState() => _Shift();
}

class _Shift extends State<Shift> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<String> shiftTime = [];
  List<Attendance> itemsShift = [];
  bool isLoading = false;

  void getData() async {
    isLoading = false;
    itemsShift = (await AttendanceApiService().getAttendance())!;

    // for (int i = 0; i < itemsShift.length; i++) {
    //   shiftTime.add(itemsShift[i].shift_date_.toString() +
    //       "\n " +
    //       itemsShift[i].supposed_start_.toString() +
    //       " - " +
    //       itemsShift[i].supposed_end_.toString() +
    //       "&" +
    //       itemsShift[i].attendance_id_.toString());
    // }
    Future.delayed(const Duration(seconds: 5)).then((value) => setState(() {
          isLoading = true;
        }));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Shift'),
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
        body: itemsShift.isEmpty || itemsShift == null
            ? (isLoading
                ? Image.asset(
                    "assets/noDataFound.png",
                    height: 500,
                    width: 1000,
                  )
                : const Center(child: CircularProgressIndicator()))
            : ListView(
                children: itemsShift.map((e) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("Shift Date:"),
                            ),
                            Container(
                              child: Text(e.shiftdate_),
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
                              child: (Text(" " +
                                  e.supposed_start_! +
                                  " - " +
                                  e.supposed_end_!)),
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
                // children: itemsShift.map((e) {
                //   return Card(
                //     child: Column(children: <Widget>[
                //       SizedBox(height: 30),
                //       // Text("Monday",
                //       //     style: TextStyle(
                //       //         height: 2, fontSize: 20, color: Colors.black45)),
                //       Card(
                //           child:
                //               ListTile(title: Text(itemsShift), subtitle: Text("Time"))),
                //       Card(
                //           child:
                //               ListTile(title: Text("Date"), subtitle: Text("Time"))),
                //     ]),
                //   );
                // }).toList(),
              ),
      );
}
