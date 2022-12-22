import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Controller/deviceUUID.dart';
import 'package:hrms/src/Attendance/Controller/AttendanceAPI.dart';
import 'package:hrms/src/Attendance/Controller/auth.dart';
import 'package:hrms/src/Attendance/Controller/geofencing.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';

class AttendanceRegistration extends StatefulWidget {
  const AttendanceRegistration({super.key});
  @override
  State<AttendanceRegistration> createState() => _AttendanceRegistration();
}

class _AttendanceRegistration extends State<AttendanceRegistration> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<String> shiftTime = [];
  List<Attendance> itemsShift = [];

  void getData() async {
    itemsShift = (await AttendanceApiService().getAttendance())!;

    for (int i = 0; i < itemsShift.length; i++) {
      shiftTime.add(itemsShift[i].shift_date_.toString() +
          "\n " +
          itemsShift[i].supposed_start_.toString() +
          " - " +
          itemsShift[i].supposed_end_.toString() +
          "&" +
          itemsShift[i].attendance_id_.toString());
    }
    Future.delayed(const Duration(seconds: 5)).then((value) => setState(() {}));
  }

  String? attendanceId;
  late String? selectedItemShift = shiftTime[0].toString();

  List<String> items = [
    'Select a method',
    'Biometric Authentication',
    'QR Code'
  ];
  //String? selectedItem = 'Select a method';
  String? selectedItem = 'Select a method';

  //API called to store the database UUID, to do validation upon registering attendance
  String? dbdeviceInfo;
  String position = "";
  @override
  Widget build(BuildContext context) => Scaffold(
        body: shiftTime.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(children: <Widget>[
                  Column(
                    children: [
                      Align(
                          alignment: Alignment(-0.65, 1.2),
                          child: Text('Select Shift',
                              style: TextStyle(
                                height: 5,
                                fontSize: 20,
                              ))),
                      SizedBox(
                        width: 300,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          value: selectedItemShift,
                          items: shiftTime
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item.substring(0, 34),
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontStyle: FontStyle.italic)),
                                  ))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedItemShift = item),
                        ),
                      ),
                      Align(
                          alignment: Alignment(-0.35, 1.2),
                          child: Text('Select Check In/Out Method',
                              style: TextStyle(
                                height: 3,
                                fontSize: 20,
                              ))),
                      SizedBox(
                        width: 300,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          value: selectedItem,
                          items: items
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(item,
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontStyle: FontStyle.italic)),
                                  ))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => selectedItem = item),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        child: SizedBox(
                          height: 55,
                          width: 300,
                          child: TextButton(
                            child: Text("Check In",
                                style: TextStyle(fontSize: 19)),
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(112)),
                            ),
                            onPressed: () async {
                              if (selectedItem == 'Biometric Authentication') {
                                bool isAuthenticated =
                                    await AuthService.authenticateUser();
                                //Call server timestamp, verify UUID, verify Geofencing
                                if (isAuthenticated) {
                                  // Get Current UUID
                                  String? deviceInfo =
                                      await GetUniqueId.getDeviceId();
                                  //Compare with database UUID
                                  //if (deviceInfo == dbdeviceInfo) {
                                  //verify Geofencing
                                  String? positionHere =
                                      await determinePositionState
                                          .determinePosition();
                                  // if (determinePositionState.validPosition() ==
                                  //     true) {

                                  //Get Attendance ID from selected item shift
                                  String selectedAttId =
                                      selectedItemShift!.substring(35);
                                  //Compare with <Attendance> itemShift , then pass in as argument
                                  for (int i = 0; i < itemsShift.length; i++) {
                                    if (selectedAttId ==
                                        itemsShift[i].attendance_id_) {
                                      AttendanceApiService()
                                          .updateCheckInAttendance(
                                        itemsShift[i].attendance_id_.toString(),
                                        itemsShift[i].shift_id_.toString(),
                                        itemsShift[i].end_time_.toString(),
                                        itemsShift[i]
                                            .supposed_start_
                                            .toString(),
                                        itemsShift[i].supposed_end_.toString(),
                                        itemsShift[i].validity_.toString(),
                                        itemsShift[i].on_leave_.toString(),
                                        itemsShift[i]
                                            .check_out_valid_
                                            .toString(),
                                        itemsShift[i].leave_id_.toString(),
                                        itemsShift[i].shift_date_.toString(),
                                      );
                                    }
                                  }

                                  //CALL API HERE TO SAVE INTO DB
                                  //take attendance , call api to register attendance
                                  //AttendanceApiService().

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'You are within designated area!'),
                                    ),
                                  );
                                  // } else {
                                  //   ScaffoldMessenger.of(context).showSnackBar(
                                  //     const SnackBar(
                                  //       content: Text(
                                  //           'You are not within designated area!'),
                                  //     ),
                                  //   );
                                  // }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Authentication failed.'),
                                    ),
                                  );
                                }
                              } else if (selectedItem == 'QR Code') {
                                var scaning = await BarcodeScanner.scan();
                                String qrResult = scaning.rawContent;
                                String selectedAttId =
                                    selectedItemShift!.substring(35);
                                //Compare with <Attendance> itemShift , then pass in as argument
                                for (int i = 0; i < itemsShift.length; i++) {
                                  if (selectedAttId ==
                                      itemsShift[i].attendance_id_) {
                                    if (qrResult == itemsShift[i].shift_id_) {
                                      String? deviceInfo =
                                          await GetUniqueId.getDeviceId();
                                      //Compare with database UUID
                                      //if (deviceInfo == dbdeviceInfo) {
                                      //verify Geofencing
                                      String? positionHere =
                                          await determinePositionState
                                              .determinePosition();
                                      // if (determinePositionState.validPosition() ==
                                      //     true) {
                                      //   //take attendance , call api to register attendance
                                      //   //  AttendanceApiService().updateAttendance();
                                      // } else {
                                      //   ScaffoldMessenger.of(context).showSnackBar(
                                      //     const SnackBar(
                                      //       content: Text(
                                      //           'You are not within designated area!'),
                                      //     ),
                                      //   );
                                      // }
                                      AttendanceApiService()
                                          .updateCheckInAttendance(
                                        itemsShift[i].attendance_id_.toString(),
                                        itemsShift[i].shift_id_.toString(),
                                        itemsShift[i].end_time_.toString(),
                                        itemsShift[i]
                                            .supposed_start_
                                            .toString(),
                                        itemsShift[i].supposed_end_.toString(),
                                        itemsShift[i].validity_.toString(),
                                        itemsShift[i].on_leave_.toString(),
                                        itemsShift[i]
                                            .check_out_valid_
                                            .toString(),
                                        itemsShift[i].leave_id_.toString(),
                                        itemsShift[i].shift_date_.toString(),
                                      );
                                      break;
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Invalid QR Code! Please try again'),
                                        ),
                                      );
                                    }
                                    break;
                                  }
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please select a method!'),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        height: 55,
                        width: 300,
                        child: TextButton(
                          child:
                              Text("Check Out", style: TextStyle(fontSize: 19)),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.red[400],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(112)),
                          ),
                          onPressed: () async {
                            if (selectedItem == 'Biometric Authentication') {
                              bool isAuthenticated =
                                  await AuthService.authenticateUser();
                              //Call server timestamp, verify UUID, verify Geofencing
                              if (isAuthenticated) {
                                // Get Current UUID
                                String? deviceInfo =
                                    await GetUniqueId.getDeviceId();
                                //Compare with database UUID
                                //if (deviceInfo == dbdeviceInfo) {
                                //verify Geofencing
                                String? positionHere =
                                    await determinePositionState
                                        .determinePosition();
                                // if (determinePositionState.validPosition() ==
                                //     true) {

                                //Get Attendance ID from selected item shift
                                String selectedAttId =
                                    selectedItemShift!.substring(35);
                                //Compare with <Attendance> itemShift , then pass in as argument
                                for (int i = 0; i < itemsShift.length; i++) {
                                  if (selectedAttId ==
                                      itemsShift[i].attendance_id_) {
                                    //check if can check out already or not
                                    bool shiftEnded =
                                        await AttendanceApiService()
                                            .checkSupposedEndTime(
                                                itemsShift[i]
                                                    .shift_date_
                                                    .toString(),
                                                itemsShift[i]
                                                    .supposed_end_
                                                    .toString());

                                    AttendanceApiService()
                                        .updateCheckOutAttendance(
                                            itemsShift[i]
                                                .attendance_id_
                                                .toString(),
                                            itemsShift[i].shift_id_.toString(),
                                            itemsShift[i]
                                                .start_time_
                                                .toString(),
                                            itemsShift[i]
                                                .supposed_start_
                                                .toString(),
                                            itemsShift[i]
                                                .supposed_end_
                                                .toString(),
                                            itemsShift[i].validity_.toString(),
                                            itemsShift[i].on_leave_.toString(),
                                            itemsShift[i]
                                                .check_in_valid_
                                                .toString(),
                                            itemsShift[i].leave_id_.toString(),
                                            itemsShift[i]
                                                .shift_date_
                                                .toString(),
                                            shiftEnded);
                                  }
                                }

                                //CALL API HERE TO SAVE INTO DB
                                //take attendance , call api to register attendance
                                //AttendanceApiService().

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('You are within designated area!'),
                                  ),
                                );
                                // } else {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     const SnackBar(
                                //       content: Text(
                                //           'You are not within designated area!'),
                                //     ),
                                //   );
                                // }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Authentication failed.'),
                                  ),
                                );
                              }
                            } else if (selectedItem == 'QR Code') {
                              var scaning = await BarcodeScanner.scan();
                              String qrResult = scaning.rawContent;
                              String selectedAttId =
                                  selectedItemShift!.substring(35);
                              //Compare with <Attendance> itemShift , then pass in as argument
                              for (int i = 0; i < itemsShift.length; i++) {
                                if (selectedAttId ==
                                    itemsShift[i].attendance_id_) {
                                  if (qrResult == itemsShift[i].shift_id_) {
                                    String? deviceInfo =
                                        await GetUniqueId.getDeviceId();
                                    //Compare with database UUID
                                    //if (deviceInfo == dbdeviceInfo) {
                                    //verify Geofencing
                                    String? positionHere =
                                        await determinePositionState
                                            .determinePosition();
                                    // if (determinePositionState.validPosition() ==
                                    //     true) {
                                    //   //take attendance , call api to register attendance
                                    //   //  AttendanceApiService().updateAttendance();
                                    // } else {
                                    //   ScaffoldMessenger.of(context).showSnackBar(
                                    //     const SnackBar(
                                    //       content: Text(
                                    //           'You are not within designated area!'),
                                    //     ),
                                    //   );
                                    // }
                                    bool shiftEnded =
                                        await AttendanceApiService()
                                            .checkSupposedEndTime(
                                                itemsShift[i]
                                                    .shift_date_
                                                    .toString(),
                                                itemsShift[i]
                                                    .supposed_end_
                                                    .toString());
                                    AttendanceApiService()
                                        .updateCheckOutAttendance(
                                            itemsShift[i]
                                                .attendance_id_
                                                .toString(),
                                            itemsShift[i].shift_id_.toString(),
                                            itemsShift[i]
                                                .start_time_
                                                .toString(),
                                            itemsShift[i]
                                                .supposed_start_
                                                .toString(),
                                            itemsShift[i]
                                                .supposed_end_
                                                .toString(),
                                            itemsShift[i].validity_.toString(),
                                            itemsShift[i].on_leave_.toString(),
                                            itemsShift[i]
                                                .check_in_valid_
                                                .toString(),
                                            itemsShift[i].leave_id_.toString(),
                                            itemsShift[i]
                                                .shift_date_
                                                .toString(),
                                            shiftEnded);

                                    break;
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Invalid QR Code! Please try again'),
                                      ),
                                    );
                                  }
                                  break;
                                }
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ]),
              ),
      );
}
