// import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/Attendance/constants.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Employee>?> getUsers() async {
    try {
      //var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var url = Uri.parse(
          "https://finalyearproject20221212223004.azurewebsites.net/api/EmployeeAPI");

      var response = await http.get(url);
      if (response.statusCode == 200) {
        //List Method
        List<Employee> employee = [];
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        //infoList.forEach((element) {
        for (var element in infoList) {
          var index = infoList.indexOf(element);
          Employee model = new Employee();

          List<String> test = element.split(",");
          //int index = 0;
          int i = -1;
          model.employeeId = "E00002";
          String captureId = test[++i]; //
          if (model.employeeId == captureId) {
            //model.employeeId = test[++i];
            model.employeeIdByCompany = test[++i]; //
            //model.employeeName = test[++i];
            model.userId = test[++i]; //
            model.parentCompany = test[++i]; //
            //model.company = test[++i];
            model.staffRole = test[++i]; //
            //model.role = test[++i];
            model.accPass = test[++i]; //
            model.employerId = test[++i]; //
            //model.employer = test[++i];
            model.employmentStartDate = test[++i]; //
            //model.employmentStartDate = DateTime.parse(test[++i]);
            model.typesOfWages = test[++i];
            model.wagesRate = test[++i];
            //model.wagesRate = double.parse(test[++i]);
            model.employementLetter = test[++i];
            // String bool1 = test[++i];
            // if (bool1.toLowerCase() == false)
            //   model.employementLetter = false;
            // else
            //   model.employementLetter = true;
            model.monthlyDeduction = test[++i];
            //model.isActive = test[++i];
            model.icNo = test[i++];
            model.dob = test[++i];
            model.gender = test[i++];
            model.nationality = test[i++];
            model.phoneNo = test[i++];
            model.email = test[i++];
            model.epfNo = test[i++];
            model.soscoNo = test[i++];
            model.itaxNo = test[i++];
            model.bankName = test[++i];
            model.bankNo = test[++i];

            model.religion = test[++i]; //
            model.paidLeaveHourLeft = test[++i]; //
            model.paidLeaveOnBargain = test[++i]; //
            model.sickLeaveHourLeft = test[++i]; //
            model.sickLeaveOnBargain = test[++i]; //
            model.uuid = test[++i]; //
            model.leaveUpdate = test[++i]; //

            employee.add(model);
            break;
          } else {
            continue;
          }
        }
        //);
        return employee;
        // List<Employee> storeInfo = [];
        // for (int i = 0; i < infoString.length; i++) {
        //   storeInfo.add(infoString[i]);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Employee>?> updateUser() async {}
}
// final urlapi = url;

// class testAPI with ChangeNotifier {
//   List<Attendance> attendance = [];

//   getAttendance() async {
//     final url1 = Uri.http(urlapi, 'api/AttendanceAPI');
//     final resp = await http.get(url1, headers: {
//       "Access-Control-Allow-Origin": "*",
//       "Access-Control-Allow-Credentials": "true",
//       'Content-type': 'application/json',
//       'Accept': 'application/json'
//     });
//     final response = attFromJson(resp.body);
//     attendance = response;
//     notifyListeners();
//   }
// }

