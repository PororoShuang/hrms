import 'dart:developer';

import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/Attendance/constants.dart';
import 'package:hrms/src/LeaveApplication/Model/leave_information.dart';
import 'package:hrms/src/LeaveApplication/View/leave.dart';
import 'package:http/http.dart' as http;

int counter = 0;

class LeaveApiService {
  Future<List<Leaves>?> getLeave() async {
    try {
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/LeaveAPI');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Leaves> leaves = [];
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");
        for (var element in infoList) {
          Leaves model = new Leaves();
          List<String> retrievedData = element.split(",");
          int i = -1;
          model.leave_id = retrievedData[++i];
          model.staff_id = retrievedData[++i];
          if (model.staff_id == "E00004") {
            model.approval_status = retrievedData[++i];
            model.approved_by = retrievedData[++i];
            model.date_created = retrievedData[++i];
            model.leave_start = retrievedData[++i];
            model.leave_end = retrievedData[++i];
            model.leave_type = retrievedData[++i];
            model.doc_file_path = retrievedData[++i];
            model.leave_reason = retrievedData[++i];
            model.response_message = retrievedData[++i];
            leaves.add(model);
          }
        }
        ;
        return leaves;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Employee employee = new Employee();
  void postLeave(dateToString, dateFromString, startTimeString, endTimeString,
      leaveType, leaveReason) async {
    var url = Uri.parse(
        'https://finalyearproject20221212223004.azurewebsites.net/api/LeaveAPI');

    // var urlTime = Uri.parse(
    //     'https://finalyearproject20221212223004.azurewebsites.net/api/DateTimeAPI');

    // var responseDateTime = await http.get(urlTime);
    // if (responseDateTime.statusCode == 200) {
    //   serverDateTime = responseDateTime.body.toString();
    // }
    var response = await http.post(url, body: [
      {
        //employee.employeeId, //staff id
        'E00001-L00005', // leave id 1
        'E00001', // staff id 2
        'approved', //approval status 3
        'E00002', //approved by 4
        '20/12/2022 6:00:00 PM', //leave start 5
        '20/12/2022 6:30:00 PM', //leave end 6
        leaveType, //leave type 7
        'doc file path', //doc file path 8
        leaveReason, //leave reason 9
        'response message', //response message 10
      }
    ]);
  }

  // void postAttendance() async {
  //   var url = Uri.parse(
  //       'https://finalyearproject20221212223004.azurewebsites.net/api/AttendanceAPI');

  //   var response = await http.post(url, body: {

  //     "E00001",
  //     "S00001",
  //     "14/12/2022 12:00:00 PM",
  //     "14/12/2022 12:10:00 PM",
  //     false,
  //     false
  //   });
  // }
}
