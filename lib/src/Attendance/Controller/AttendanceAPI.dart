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
}
