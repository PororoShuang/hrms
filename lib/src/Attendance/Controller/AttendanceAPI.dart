import 'dart:collection';
import 'dart:convert';
import 'dart:developer';

import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';
import 'package:http/http.dart' as http;

class AttendanceApiService {
  Future<List<Attendance>?> getAttendance() async {
    try {
      //"2022-12-23 9:55:39"
      var serverDateTimeRetrieved = await getServerTime();
      List<String> splittedDateTimeServer = serverDateTimeRetrieved.split(" ");
      List<String> splitTimeServer = splittedDateTimeServer[1].split(":");
      splitTimeServer[0] = splitTimeServer[0].padLeft(2, "0");
      serverDateTimeRetrieved = splittedDateTimeServer[0] +
          " " +
          splitTimeServer[0] +
          ":" +
          splitTimeServer[1] +
          ":" +
          splitTimeServer[2];
      DateTime serverTime = DateTime.parse(serverDateTimeRetrieved);
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
            //"12/21/2022 11:52:56 PM"
            attendanceModel.start_time_ = retrievedData[++i];
            //"12/22/2022 12:57:03 PM"
            attendanceModel.end_time_ = retrievedData[++i];

            //"12/21/2022 5:22:00 PM"
            String shiftDateTime = retrievedData[++i];

            //"12/21/2022"
            String shiftDate = shiftDateTime.split(" ")[0];

            //"5:22:00PM"
            String shiftStart =
                shiftDateTime.split(" ")[1] + shiftDateTime.split(" ")[2];

            //"12/21/2022"
            attendanceModel.shift_date_ = shiftDate;
            List<String> formattedDate = shiftDate.split("/");
            shiftDate = formattedDate[2] +
                "-" +
                formattedDate[0] +
                "-" +
                formattedDate[1];
            DateTime shiftDateFormat = DateTime.parse(shiftDate);
            if (shiftDateFormat.day == serverTime.day) {
              //"5:22:00PM"
              attendanceModel.supposed_start_ = shiftStart;
              //Assign into Supposed start to substring into Date and Start Time
              String supposeEndTime = retrievedData[++i];
              supposeEndTime = supposeEndTime.substring(11);

              attendanceModel.supposed_end_ = supposeEndTime;
              attendanceModel.validity_ = retrievedData[++i];
              attendanceModel.check_in_valid_ = retrievedData[++i];
              attendanceModel.check_out_valid_ = retrievedData[++i];
              attendanceModel.on_leave_ = retrievedData[++i];
              attendanceModel.leave_id_ = retrievedData[++i];
              attendance.add(attendanceModel);
            }
          }
        }
      }
      ;
      return attendance;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Attendance>?> getHistoryAttendance() async {
    try {
      //"2022-12-22 20:32:47"
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
            //"12/21/2022 11:52:56 PM"
            attendanceModel.start_time_ = retrievedData[++i];
            //"12/22/2022 12:57:03 PM"
            attendanceModel.end_time_ = retrievedData[++i];

            //"12/21/2022 5:22:00 PM"
            String shiftDateTime = retrievedData[++i];

            //"12/21/2022"
            String shiftDate = shiftDateTime.split(" ")[0];

            //"5:22:00PM"
            String shiftStart =
                shiftDateTime.split(" ")[1] + shiftDateTime.split(" ")[2];

            //"12/21/2022"
            attendanceModel.shift_date_ = shiftDate;
            List<String> formattedDate = shiftDate.split("/");
            shiftDate = formattedDate[2] +
                "-" +
                formattedDate[0] +
                "-" +
                formattedDate[1];
            DateTime shiftDateFormat = DateTime.parse(shiftDate);
            //"5:22:00PM"
            attendanceModel.supposed_start_ = shiftStart;
            //Assign into Supposed start to substring into Date and Start Time
            String supposeEndTime = retrievedData[++i];
            supposeEndTime = supposeEndTime.substring(11);
            attendanceModel.supposed_end_ = supposeEndTime;
            attendanceModel.validity_ = retrievedData[++i];
            attendanceModel.check_in_valid_ = retrievedData[++i];
            if (((attendanceModel.check_in_valid_ != null ||
                    attendanceModel.check_in_valid_ != "") &&
                attendanceModel.check_in_valid_.toString().toLowerCase() !=
                    "false")) {
              attendanceModel.check_out_valid_ = retrievedData[++i];
              attendanceModel.on_leave_ = retrievedData[++i];
              attendanceModel.leave_id_ = retrievedData[++i];
              attendance.add(attendanceModel);
            }
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
      String? selectedLeaveId,
      String selectedShiftDate) async {
    try {
      //Log check in Time
      //Get serverTime for Start Time
      //Start Time refers to the time the employee checks in
      //serverCurrentTime = 2022-12-21 04:35:33
      var serverDateTimeRetrieved = await getServerTime();

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

      DateTime serverTime = DateTime.parse(serverDateTimeRetrieved);
      //Compare serverDT with current SupposedStartTime to know if employee is late , then set validity
      //Validity True = Not Late , False = Late
      selectedValidity = checkValidity(serverTime, selectedSupposedStart);
      if (selectedLeaveId == "") {
        selectedLeaveId = null;
      }

      Attendance attendanceModel = new Attendance();
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/AttendanceAPI');
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';
      var response = await http.put(url,
          headers: headers,
          body: jsonEncode({
            "attendance_id": selectedAttendanceId,
            "staff_id": userModel.employeeId,
            "shift_id": selectedShiftId,
            "start_time":
                serverDateTimeRetrieved, //use server time to log the check in timestamp to prevent time travel
            "end_time": null,
            "supposed_start": selectedSupposedStart,
            "suppose_end": selectedSupposedEnd,
            "validity": selectedValidity,
            "checkInValid": "True",
            "checkOutValid": selectedCheckOutValid,
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

//used to compare Server Time and Selected Supposed End Time
//Prevent employee to check out before shift ends
  Future<bool> checkSupposedEndTime(
      String shiftDate, String selectedSupposedEndTime) async {
    //get server time
    var serverDateTimeRetrieved = await getServerTime();
    List<String> serverDTRSplitted = serverDateTimeRetrieved.split(" ");
    //[0] "2022-12-22"
    //[1]: "10:59:18"
    List<String> serverTimeSplitted = serverDTRSplitted[1].split(":");
    //[0] 10
    //[1] 59
    //[2] 18
    serverTimeSplitted[0] = serverTimeSplitted[0].padLeft(2, "0");

    //[0] "2022-12-22"
    serverDateTimeRetrieved = serverDTRSplitted[0] +
        " " +
        serverTimeSplitted[0].padLeft(2, "0") +
        ":" +
        serverTimeSplitted[1].padLeft(2, "0") +
        ":" +
        serverTimeSplitted[2].padLeft(2, "0");
    DateTime serverTime = DateTime.parse(serverDateTimeRetrieved);

    selectedSupposedEndTime = formatEndDTServer(selectedSupposedEndTime);
    // List<String> selectedSETSplitted = selectedSupposedEndTime.split(":");
    // selectedSETSplitted[0] = selectedSETSplitted[0].padLeft(2, "0");

    List<String> shiftDateSplitted = shiftDate.split("/");
    shiftDate = shiftDateSplitted[2] +
        "-" +
        shiftDateSplitted[0] +
        "-" +
        shiftDateSplitted[1];

    //"2022-12-21 20:22:00"
    selectedSupposedEndTime = shiftDate + " " + selectedSupposedEndTime;

    DateTime shiftEndTime = DateTime.parse(selectedSupposedEndTime);

    //If serverTime is after ShiftEndTime, means can take attendance
    if (serverTime.compareTo(shiftEndTime) > 0 ||
        serverTime.compareTo(serverTime) == 0)
      return true;
    else
      return false;
  }

  void updateCheckOutAttendance(
      String selectedAttendanceId,
      String selectedShiftId,
      String selectedStartTime,
      String selectedSupposedStart,
      String selectedSupposedEnd,
      String selectedValidity,
      String selectedOnLeave,
      String selectedCheckInValid,
      String? selectedLeaveId,
      String selectedShiftDate,
      bool shiftEnded) async {
    if (shiftEnded == true) {
      try {
        //"2022-12-22T11:10:52"
        var serverDateTimeRetrieved = await getServerTime();
        //"2022-12-22T11:10:52"
        serverDateTimeRetrieved =
            serverDateTimeRetrieved.replaceAll(" ", "T"); //???? why

        //"12-21-2022"
        selectedShiftDate = selectedShiftDate.replaceAll("\/", "\-");

        //[0]:"12"
        //[1]:"21"
        //[2]:"2022"
        List splittedDate = selectedShiftDate.split("-");
        //Month Day Year
        //"2022-12-21"
        selectedShiftDate =
            splittedDate[2] + "-" + splittedDate[0] + "-" + splittedDate[1];

        //Selected Supposed Start Time : "7:00:00AM"
        //splittedSupposedStartTime
        //[0] 7
        //[1] 00
        //[2] 00 AM

        //selected start time ="12/21/2022 11:52:56 PM"
        List<String> splittedSST = selectedStartTime.split(" ");
        //[0]12/21/2022
        //[1]11:52:56 PM

        //[0]12-21-2022
        splittedSST[0] = splittedSST[0].replaceAll("\/", "\-");
        List<String> splittedSupposedStartDate = splittedSST[0].split("-");
        //2022
        //12
        //21
        splittedSST[0] = splittedSupposedStartDate[2] +
            "-" +
            splittedSupposedStartDate[0] +
            "-" +
            splittedSupposedStartDate[1];

        List<String> splittedSSTTime = splittedSST[1].split(":");
        //[0]11
        //[1]52
        //[2]:56 PM

        if (splittedSST[2].contains("PM")) {
          int hour24 = int.parse(splittedSSTTime[0]);
          hour24 = hour24 + 12;
          splittedSSTTime[0] = hour24.toString();
        }
        selectedStartTime = splittedSST[0] +
            " " +
            splittedSSTTime[0] +
            ":" +
            splittedSSTTime[1] +
            ":" +
            splittedSSTTime[2];
        //selectedStartTime = formatEndDTServer(selectedStartTime);

        //"17:22:00"
        selectedSupposedStart = formatStartDTServer(selectedSupposedStart);

        //"2022-12-21T23:52:56"
        selectedStartTime = selectedStartTime.replaceAll(" ", "T");
        selectedSupposedEnd = formatEndDTServer(selectedSupposedEnd);
        //"2022-12-21T17:22:00"
        selectedSupposedStart = selectedShiftDate + "T" + selectedSupposedStart;
        //"2022-12-21T20:22:00"
        selectedSupposedEnd = selectedShiftDate + "T" + selectedSupposedEnd;
        if (selectedLeaveId == "") {
          selectedLeaveId = null;
        }
        Attendance attendanceModel = new Attendance();
        var url = Uri.parse(
            'https://finalyearproject20221212223004.azurewebsites.net/api/AttendanceAPI');
        Map<String, String> headers = new HashMap();
        headers['Accept'] = 'application/json';
        headers['Content-type'] = 'application/json';
        var response = await http.put(url,
            headers: headers,
            body: jsonEncode({
              "attendance_id": selectedAttendanceId,
              "staff_id": userModel.employeeId,
              "shift_id": selectedShiftId,
              "start_time":
                  selectedStartTime, //use server time to log the check in timestamp to prevent time travel
              "end_time": serverDateTimeRetrieved,
              "supposed_start": selectedSupposedStart,
              "suppose_end": selectedSupposedEnd,
              "validity": selectedValidity,
              "checkInValid": selectedCheckInValid,
              "checkOutValid": "True",
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

  String checkValidity(DateTime serverTime, String selectedSupposedStart) {
    selectedSupposedStart = selectedSupposedStart.replaceAll("T", " ");
    DateTime DTsupposedStart =
        DateTime.parse(formatStartDTServer(selectedSupposedStart));

    if (serverTime.compareTo(DTsupposedStart) < 0 ||
        DTsupposedStart.compareTo(serverTime) == 0) {
      return "True"; //Not Late
    } else
      //Late
      return "False";
  }
}
