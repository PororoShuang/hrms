import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
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
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        List<Leaves> leaves = [];
        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          Leaves leaveModel = new Leaves();
          leaveModel.leave_id = retrievedData[++i];
          leaveModel.staff_id = retrievedData[++i];
          if (leaveModel.staff_id == userModel.employeeId) {
            leaveModel.approval_status = retrievedData[++i];
            leaveModel.approved_by = retrievedData[++i];
            leaveModel.date_created = retrievedData[++i];
            leaveModel.leave_start = retrievedData[++i];
            leaveModel.leave_end = retrievedData[++i];
            leaveModel.leave_type = retrievedData[++i];
            leaveModel.doc_file_path = retrievedData[++i];
            leaveModel.leave_reason = retrievedData[++i];
            leaveModel.response_message = retrievedData[++i];
            leaves.add(leaveModel);
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
            "leave_id": "Test7",
            "staff_id": userModel.employeeId,
            "employeeDetails": null,
            "approval_status": null,
            "approved_by": null,
            "approvedByEmployee": null,
            "date_created": leaveStart,
            "leave_start": leaveStart,
            "leave_end": leaveEnd,
            "leave_reason": leaveReason,
            "doc_filepath": "",
            "leaveType": leaveType
          }));
      if (response.statusCode != 201) {
        print(response.body);
        print("smth went wrong trying to post");
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
