import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Controller/deviceUUID.dart';
import 'package:hrms/src/Attendance/Controller/auth.dart';
import 'package:hrms/src/Attendance/Controller/geofencing.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';

class AttendanceRegistration extends StatefulWidget {
  const AttendanceRegistration({super.key});
  @override
  State<AttendanceRegistration> createState() => _AttendanceRegistration();
}

class _AttendanceRegistration extends State<AttendanceRegistration> {
  //Call API to retrieve Attendance id from Attendance
  String? attendanceId;
  //Call API here to retrieve shift from Attendance
  List<String> itemsShift = [
    'Select a shift',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4'
  ];
  String? selectedItemShift = 'Select a shift';

  List<String> items = [
    'Select a method',
    'Biometric Authentication',
    'QR Code'
  ];
  String? selectedItem = 'Select a method';

  //API called to store the database UUID, to do validation upon registering attendance
  String? dbdeviceInfo;
  String position = "";
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
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
                    items: itemsShift
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(item,
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
                    onChanged: (item) => setState(() => selectedItem = item),
                  ),
                ),
                SizedBox(height: 50),
                Container(
                  child: SizedBox(
                    height: 55,
                    width: 300,
                    child: TextButton(
                      child: Text("Check In", style: TextStyle(fontSize: 19)),
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
                            String? positionHere = await determinePositionState
                                .determinePosition();
                            if (determinePositionState.validPosition() ==
                                true) {
                              //CALL API HERE TO SAVE INTO DB
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('You are within designated area!'),
                                ),
                              );
                              //take attendance , call api to register attendance
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'You are not within designated area!'),
                                ),
                              );
                            }
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
                          if (qrResult == attendanceId) {
                            String? deviceInfo =
                                await GetUniqueId.getDeviceId();
                            //Compare with database UUID
                            //if (deviceInfo == dbdeviceInfo) {
                            //verify Geofencing
                            String? positionHere = await determinePositionState
                                .determinePosition();
                            if (determinePositionState.validPosition() ==
                                true) {
                              //take attendance , call api to register attendance
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'You are not within designated area!'),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text('Invalid QR Code! Please try again'),
                              ),
                            );
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
                    child: Text("Check Out", style: TextStyle(fontSize: 19)),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red[400],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(112)),
                    ),
                    onPressed: () {
                      if (selectedItem == 'Biometric Authentication') {}
                    },
                  ),
                ),
              ],
            )
          ]),
        ),
      );
}
