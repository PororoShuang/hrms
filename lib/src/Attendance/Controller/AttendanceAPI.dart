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

  void updateAttendance(
      String selectedAttendanceId,
      String selectedShiftId,
      String selectedStartTime,
      String selectedEndTime,
      String selectedSupposedStart,
      String selectedSupposedEnd,
      String selectedValidity,
      String selectedOnLeave,
      String selectedCheckInValid,
      String selectedCheckOutValid,
      String selectedLeaveId,
      String selectedShiftDate) async {
    try {
      selectedShiftDate = selectedShiftDate.replaceAll("\/", "\-");
      List splittedDate = selectedShiftDate.split("-");
      //Month Day Year
      selectedShiftDate =
          splittedDate[2] + "-" + splittedDate[0] + "-" + splittedDate[1];

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
          splittedEndTime[2];

      List<String> splittedStartTime = selectedStartTime.split(" ");
      if (splittedStartTime[2].contains("PM")) {
        int hourPM = int.parse(splittedStartTime[0]);
        hourPM = hourPM + 12;
        splittedStartTime[0] = hourPM.toString();
      }
      splittedStartTime = splittedStartTime[1].split(":");
      splittedStartTime[0] = splittedStartTime[0].padLeft(2, "0");
      splittedStartTime[1] = splittedStartTime[1].padLeft(2, "0");
      splittedStartTime[2] = splittedStartTime[2].padLeft(2, "0");
      selectedStartTime = splittedStartTime[0] +
          ":" +
          splittedStartTime[1] +
          ":" +
          splittedStartTime[2];

      selectedSupposedStart = selectedShiftDate + "T" + selectedStartTime;
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
            "start_time": selectedStartTime,
            "end_time": selectedEndTime,
            "supposed_start ": selectedSupposedStart,
            "suppose_end ": selectedSupposedEnd,
            "validity ": selectedValidity,
            "checkInValid ": "True",
            "checkOutValid ": attendanceModel.check_out_valid_,
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

  bool checkValidity(String supposedStart) {
    DateTime supposedStartDT = DateTime.parse(supposedStart);

    return false;
  }
}
