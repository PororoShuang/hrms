// import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/Attendance/constants.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<dynamic>?> getUsers() async {
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

        infoList.forEach((element) {
          Employee model = new Employee();

          List<String> test = element.split(",");
          int i = -1;
          model.employeeId = test[++i];
          model.employeeIdByCompany = test[++i];

          employee.add(model);
        });

        return employee;
        // List<Employee> storeInfo = [];
        // for (int i = 0; i < infoString.length; i++) {
        //   storeInfo.add(infoString[i]);
      }
    } catch (e) {
      log(e.toString());
    }
  }
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

