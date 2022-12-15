import 'dart:developer';

import 'package:hrms/src/Attendance/constants.dart';
import 'package:hrms/src/LeaveApplication/Model/leave_information.dart';
import 'package:hrms/src/LeaveApplication/View/leave.dart';
import 'package:http/http.dart' as http;

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
        infoList.forEach((element) {
          Leaves model = new Leaves();
          List<String> retrievedData = element.split(",");
          int i = -1;
          model.leave_id = retrievedData[++i];
          model.staff_id = retrievedData[++i];
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
        });
        return leaves;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
