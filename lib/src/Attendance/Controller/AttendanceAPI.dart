import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';
import 'package:http/http.dart' as http;

class AttendanceApiService {
  Future<List<Attendance>?> getAttendance() async {
    try {
      List<Attendance> attendance = [];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/AttendanceAPI');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          Attendance attendanceModel = new Attendance();
          attendanceModel.attendance_id_ = retrievedData[++i];
          attendanceModel.staff_id_ = retrievedData[++i];
          if (attendanceModel.staff_id_ == userModel.employeeId) {
            attendanceModel.shift_id_ = retrievedData[++i];
            attendanceModel.start_time_ = retrievedData[++i];
            attendanceModel.end_time_ = retrievedData[++i];

            String shiftDateTime = retrievedData[++i];
            String shiftDate = shiftDateTime.split(" ")[0];
            String shiftStart =
                shiftDateTime.split(" ")[1] + shiftDateTime.split(" ")[2];
            attendanceModel.shift_date_ = shiftDate;
            attendanceModel.supposed_start_ = shiftStart;
            //Assign into Supposed start to substring into Date and Start Time
            String supposeEndTime = retrievedData[++i];
            supposeEndTime = supposeEndTime.substring(11);

            attendanceModel.supposed_end_ = supposeEndTime;
            attendanceModel.validity_ = retrievedData[++i];
            attendanceModel.on_leave_ = retrievedData[++i];
            attendanceModel.check_in_valid_ = retrievedData[++i];
            attendanceModel.check_out_valid_ = retrievedData[++i];
            attendance.add(attendanceModel);
          }
        }
      }
      ;
      return attendance;
    } catch (e) {
      log(e.toString());
    }
  }

  void updateCheckInAttendance(
      String selectedAttendanceId,
      String selectedShiftId,
      String selectedEndTime,
      String selectedSupposedStart,
      String selectedSupposedEnd,
      String selectedValidity,
      String selectedOnLeave,
      String selectedCheckOutValid,
      String selectedLeaveId,
      String selectedShiftDate) async {
    try {
      //Log check in Time
      //Get serverTime for Start Time
      //Start Time refers to the time the employee checks in
      //serverCurrentTime = 2022-12-21 04:35:33
      var serverDateTimeRetrieved = await getServerTime();
      DateTime serverTime = DateTime.parse(serverDateTimeRetrieved);
      //Compare serverDT with current DateTime.Now to know if employee is late , then set validity
      //Validity True = Not Late , False = Late
      String currentDeviceTime = DateTime.now().year.toString() +
          "-" +
          DateTime.now().month.toString().padLeft(2, "0") +
          "-" +
          DateTime.now().day.toString().padLeft(2, "0") +
          " " +
          DateTime.now().hour.toString().padLeft(2, "0") +
          ":" +
          DateTime.now().minute.toString().padLeft(2, "0") +
          ":00";
      DateTime deviceTime = DateTime.parse(currentDeviceTime);
      if (deviceTime.compareTo(serverTime) < 0 ||
          deviceTime.compareTo(serverTime) == 0) {
        selectedValidity = "True"; //Not Late
      } else
        selectedValidity = "False"; //Late

      serverDateTimeRetrieved = serverDateTimeRetrieved.replaceAll(" ", "T");
      selectedShiftDate = selectedShiftDate.replaceAll("\/", "\-");
      List splittedDate = selectedShiftDate.split("-");
      //Month Day Year
      selectedShiftDate =
          splittedDate[2] + "-" + splittedDate[0] + "-" + splittedDate[1];

      //Selected Supposed Start Time : "7:00:00AM"
      //splittedSupposedStartTime
      //[0] 7
      //[1] 00
      //[2] 00 AM

      List<String> splittedSupposedStartTime = selectedSupposedStart.split(":");

      selectedSupposedStart = formatStartDTServer(selectedSupposedStart);
      selectedSupposedEnd = formatEndDTServer(selectedSupposedEnd);

      selectedSupposedStart = selectedShiftDate + "T" + selectedSupposedStart;
      selectedSupposedEnd = selectedShiftDate + "T" + selectedSupposedEnd;

      Attendance attendanceModel = new Attendance();
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/LeaveAPI');
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';
      var response = await http.put(url,
          headers: headers,
          body: jsonEncode({
            "attendance_id": selectedAttendanceId,
            "staff_id": userModel.employeeId,
            "shift_id ": selectedAttendanceId,
            "start_time":
                serverDateTimeRetrieved, //use server time to log the check in timestamp to prevent time travel
            "end_time": selectedEndTime,
            "supposed_start ": selectedSupposedStart,
            "suppose_end ": selectedSupposedEnd,
            "validity ": selectedValidity,
            "checkInValid ": "True",
            "checkOutValid ": selectedCheckOutValid,
            "leave_id": selectedLeaveId,
            "on_leave": selectedOnLeave,
          }));
      print(response.body);
      print(response.statusCode);
      print(response.reasonPhrase);
    } catch (e) {
      log(e.toString());
    }
  }

  void updateCheckOutAttendance(
      String selectedAttendanceId,
      String selectedShiftId,
      String selectedStartTime,
      String selectedEndTime,
      String selectedSupposedStart,
      String selectedSupposedEnd,
      String selectedValidity,
      String selectedOnLeave,
      String selectedCheckInValid,
      String selectedLeaveId,
      String selectedShiftDate) async {
    bool shiftEnded;
    //Log check out Time
    //Get serverTime for EndTime
    //EndTime refers to the time the employee checks out
    //serverCurrentTime = 2022-12-21 04:35:33
    var serverDateTimeRetrieved = await getServerTime();
    DateTime serverTime = DateTime.parse(serverDateTimeRetrieved);
    //Compare serverDT with current DateTime.Now to know if employee is late , then set validity
    //Validity True = Not Late , False = Late
    String currentDeviceTime = DateTime.now().year.toString() +
        "-" +
        DateTime.now().month.toString().padLeft(2, "0") +
        "-" +
        DateTime.now().day.toString().padLeft(2, "0") +
        " " +
        DateTime.now().hour.toString().padLeft(2, "0") +
        ":" +
        DateTime.now().minute.toString().padLeft(2, "0") +
        ":" +
        DateTime.now().millisecond.toString().padLeft(2, "0");
    DateTime deviceTime = DateTime.parse(currentDeviceTime);
    if (deviceTime.compareTo(serverTime) > 0 ||
        deviceTime.compareTo(serverTime) == 0) {
      shiftEnded = true; //Shift has ended
      try {
        serverDateTimeRetrieved = serverDateTimeRetrieved.replaceAll(" ", "T");
        selectedShiftDate = selectedShiftDate.replaceAll("\/", "\-");
        List splittedDate = selectedShiftDate.split("-");
        //Month Day Year
        selectedShiftDate =
            splittedDate[2] + "-" + splittedDate[0] + "-" + splittedDate[1];

        //Selected Supposed Start Time : "7:00:00AM"
        //splittedSupposedStartTime
        //[0] 7
        //[1] 00
        //[2] 00 AM
        selectedSupposedStart = formatStartDTServer(selectedSupposedStart);
        selectedSupposedEnd = formatEndDTServer(selectedSupposedEnd);

        selectedSupposedStart = selectedShiftDate + "T" + selectedSupposedStart;
        selectedSupposedEnd = selectedShiftDate + "T" + selectedSupposedEnd;

        Attendance attendanceModel = new Attendance();
        var url = Uri.parse(
            'https://finalyearproject20221212223004.azurewebsites.net/api/LeaveAPI');
        Map<String, String> headers = new HashMap();
        headers['Accept'] = 'application/json';
        headers['Content-type'] = 'application/json';
        var response = await http.put(url,
            headers: headers,
            body: jsonEncode({
              "attendance_id": selectedAttendanceId,
              "staff_id": userModel.employeeId,
              "shift_id ": selectedAttendanceId,
              "start_time":
                  selectedStartTime, //use server time to log the check in timestamp to prevent time travel
              "end_time": null,
              "supposed_start ": selectedSupposedStart,
              "suppose_end ": selectedSupposedEnd,
              "validity ": selectedValidity,
              "checkInValid ": selectedCheckInValid,
              "checkOutValid ": "True",
              "leave_id": selectedLeaveId,
              "on_leave": selectedOnLeave,
            }));
        print(response.body);
        print(response.statusCode);
        print(response.reasonPhrase);
      } catch (e) {
        log(e.toString());
      }
    } else
      shiftEnded = false; //Late
  }

  String formatStartDTServer(String selectedSupposedStart) {
    List<String> splittedSupposedStartTime = selectedSupposedStart.split(":");
    //[2] 00 AM
    if (splittedSupposedStartTime[2].contains("PM")) {
      int hourPM = int.parse(splittedSupposedStartTime[0]);
      hourPM = hourPM + 12;
      splittedSupposedStartTime[0] = hourPM.toString();
    }
    // splittedSupposedStartTime = splittedSupposedStartTime[1].split(":");
    splittedSupposedStartTime[0] = splittedSupposedStartTime[0].padLeft(2, "0");
    splittedSupposedStartTime[1] = splittedSupposedStartTime[1].padLeft(2, "0");
    splittedSupposedStartTime[2] = splittedSupposedStartTime[2].padLeft(2, "0");
    selectedSupposedStart = splittedSupposedStartTime[0] +
        ":" +
        splittedSupposedStartTime[1] +
        ":" +
        splittedSupposedStartTime[2].substring(0, 2);
    return selectedSupposedStart;
  }

  String formatEndDTServer(String selectedSupposedEnd) {
    //Selected Supposed End Time
    List<String> splittedEndTime = selectedSupposedEnd.split(":");
    if (splittedEndTime[2].contains("PM")) {
      int hourPM = int.parse(splittedEndTime[0]);
      hourPM = hourPM + 12;
      splittedEndTime[0] = hourPM.toString();
    }
    splittedEndTime[0] = splittedEndTime[0].padLeft(2, "0");
    splittedEndTime[1] = splittedEndTime[1].padLeft(2, "0");
    splittedEndTime[2] = splittedEndTime[2].padLeft(2, "0");
    selectedSupposedEnd = splittedEndTime[0] +
        ":" +
        splittedEndTime[1] +
        ":" +
        splittedEndTime[2].substring(0, 2);

    return selectedSupposedEnd;
  }

  Future<String> getServerTime() async {
    String errorMsg = "Could not retrieve server time!";

    var url = Uri.parse(
        'https://finalyearproject20221212223004.azurewebsites.net/api/DateTimeAPI');
    // var response = await http.put(url,
    var responseGetTime = await http.get(url);

    if (responseGetTime.statusCode == 200) {
      //"2022-12-21T04:35:33.9249038+00:00"
      String dateTimeRetrieved = responseGetTime.body;
      //"2022-12-21T04:35:33"
      dateTimeRetrieved = dateTimeRetrieved.substring(1, 20);
      //"2022-12-21 04:35:33"
      // dateTimeRetrieved = dateTimeRetrieved.replaceAll("T", " ");

      //[0] 2022-12-21
      //[1] 04:35:33"
      //List<String> dateTimeSplitted = dateTimeRetrieved.split(" ");
      List<String> dateTimeSplitted = dateTimeRetrieved.split("T");

      //[0] 04
      //[1] 35
      //[2] 33
      List<String> timeSplitted = dateTimeSplitted[1].split(":");

      //Parse hour into Integer, then +8 , Eg: now 12pm , return server time 4am, 4+8 =12pm
      int malaysiaHourPlusEight = int.parse(timeSplitted[0]);
      malaysiaHourPlusEight = malaysiaHourPlusEight + 8;
      //Convert the +8 hour time to String and assign into the timesplitted hour
      timeSplitted[0] = malaysiaHourPlusEight.toString();
      //Combine the date and time together
      //[0] 2022-12-21 \
      //[0] 04:
      //[1] 35:
      //[2] 33:
      dateTimeRetrieved = dateTimeSplitted[0] +
          " " +
          timeSplitted[0] +
          ":" +
          timeSplitted[1] +
          ":" +
          timeSplitted[2];

      //2022-12-21 04:35:33
      return dateTimeRetrieved;
    } else
      return errorMsg;
  }
  // );
  //} catch (e) {
  // errorMsg = e.toString();
  //return e.toString();
  //}
  //return errorMsg;

}
