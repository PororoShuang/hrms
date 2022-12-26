import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/EmployeeLeaveManagement/Model/employeeLeave_information.dart';
import 'package:http/http.dart' as http;

int counter = 0;
Employee employee = new Employee();
int status = 0;

class EmployeeLeaveApiService {
  Future<List<EmployeeLeaves>?> getTotalLeave() async {
    try {
      List<EmployeeLeaves> leaves = [];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/LeaveAPI');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          EmployeeLeaves leaveModel = new EmployeeLeaves();
          leaveModel.leave_id = retrievedData[++i];
          leaveModel.staff_id = retrievedData[++i];
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
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<EmployeeLeaves>?> getLeave() async {
    try {
      List<EmployeeLeaves> leaves = [];

      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/LeaveAPI');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          EmployeeLeaves leaveModel = new EmployeeLeaves();
          leaveModel.leave_id = retrievedData[++i];
          leaveModel.staff_id = retrievedData[++i];
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
        ;
        return leaves;
      }
    } catch (e) {
      log(e.toString());
    }
  }

//"staff_id": employee.employeeId,
  //employeeDetails is the staff id who approves the leave, remain as null as we are only applying leave
  Future<void> approveOrRejectLeave(String? leaveId,
      String? staffId,
      String? leaveType,
      String? leaveStart,
      String? leaveEnd,
      String? leaveReason,
      String? responseMessage,
      String? approvalStatus,) async {
    try {
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/Staff/LeaveApprove/Decide/FinalYearProject.Models.Leave');
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';

      var response = await http.post(url,
          headers: headers,
          body: jsonEncode({
            "leave_id": leaveId,
            "staff_id": staffId,
            "leaveType": leaveType,
            "leave_start": leaveStart,
            "leave_end": leaveEnd,
            "leave_reason": leaveReason,
            "response_message": responseMessage,
            "approval_status": approvalStatus,
          },

          ));
      print(response.statusCode);
      print(response.isRedirect);

      print(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
