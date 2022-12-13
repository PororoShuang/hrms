// import 'package:flutter/widgets.dart';
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
          "https://finalyearproject20221212223004.azurewebsites.net/api/EmployeeAPI/");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        //List<Employee> model = attFromJson(response.body);

        //List Method
        Employee model = new Employee();
        List infoString = response.body.split(',');
        List<Employee> storeInfo = [];
        for (int i = 0; i < infoString.length; i++) {
          storeInfo.add(infoString[i]);
        }
        return storeInfo;
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

