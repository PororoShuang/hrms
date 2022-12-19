import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/LeaveApplication/Model/leave_information.dart';
import 'package:http/http.dart' as http;

int counter = 0;
Employee employee = new Employee();

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
          if (model.staff_id == employee.employeeId) {
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

//"staff_id": employee.employeeId,
  //employeeDetails is the staff id who approves the leave, remain as null as we are only applying leave
  void postLeave(String? leaveStart, String? leaveEnd, String? leaveType,
      String? leaveReason) async {
    try {
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/LeaveAPI');
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';
      var response = await http.post(url,
          headers: headers,
          body: jsonEncode({
            "leave_id": "Test5",
            "staff_id": "E00004",
            "employeeDetails": null,
            "approval_status": null,
            "approved_by": null,
            "approvedByEmployee": null,
            "date_created": "2022-12-19T11:13:00",
            "leave_start": "2022-12-19T11:30:00",
            "leave_end": "2022-12-19T12:30:00",
            "leave_reason": "Test post",
            "doc_filepath": "",
            "leaveType": "Paid"
          }));
      if (response.statusCode != 201) {
        print(response.body);
        print("smth went wrong trying to post");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  // void postLeave(dateToString, dateFromString, startTimeString, endTimeString,
  //     leaveType, leaveReason) async {
  //   try {
  //     var url = Uri.parse(
  //         'https://finalyearproject20221212223004.azurewebsites.net/api/LeaveAPI');
  //     var response = await http.post(url, body: {
  //       "leave_id": "E0004-L00006",
  //       "staff_id": "E00001",
  //       "employeeDetails": "",
  //       "approval_status": "",
  //       "approved_by": "E0001",
  //       "date_created": "2022-12-20T12:00:00",
  //       "leave_start": "2022-12-20T12:00:00",
  //       "leave_end": "2022-12-20T12:00:00",
  //       "leave_type": "Sick",
  //       "doc_filepath": "",
  //       "leave_reason": "Test post",
  //       "response_message": "post data manually"
  //     });
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

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
