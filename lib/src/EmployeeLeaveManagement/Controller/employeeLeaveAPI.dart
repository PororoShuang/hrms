import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/LeaveApplication/Model/leave_information.dart';
import 'package:http/http.dart' as http;

int counter = 0;
Employee employee = new Employee();
int status = 0;

class EmployeeLeaveApiService {
  Future<List<Leaves>?> getTotalLeave() async {
    try {
      List<Leaves> leaves = [];
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
          Leaves leaveModel = new Leaves();
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

  Future<List<Leaves>?> getLeave() async {
    try {
      List<Leaves> leaves = [];

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
          Leaves leaveModel = new Leaves();
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
  Future<void> approveOrRejectLeave(
    String? leaveId,
    String? staffId,
    String? leaveType,
    String? leaveStart,
    String? leaveEnd,
    String? leaveReason,
    String? approvalStatus,
    String? responseMessage,
    String? doc_file_path,
  ) async {
    try {
      if (doc_file_path == "") {
        doc_file_path = null;
      }

      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/LeaveAPI');
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';
      String dateNow = DateTime.now().year.toString() +
          "-" +
          DateTime.now().month.toString() +
          "-" +
          DateTime.now().day.toString() +
          "T" +
          DateTime.now().hour.toString().padLeft(2, "0") +
          ":" +
          DateTime.now().minute.toString().padLeft(2, "0") +
          ":" +
          DateTime.now().second.toString().padLeft(2, "0");

      var response = await http.put(url,
          headers: headers,
          body: jsonEncode(
            {
              "leave_id": leaveId,
              "staff_id": staffId,
              "employeeDetails": null,
              "leaveType": leaveType,
              "leave_start": leaveStart,
              "leave_end": leaveEnd,
              "leave_reason": leaveReason,
              "approval_status": approvalStatus,
              "response_message": responseMessage,
              "approved_by": userModel.employeeId,
              "doc_filepath": doc_file_path,
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
