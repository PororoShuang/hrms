// import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/Attendance/constants.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';
import 'package:http/http.dart' as http;
import 'package:hrms/src/Authentication/View/login_screen.dart';

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
          model.employeeId = currentLoginID;
          String captureId = test[++i]; //
          if (model.employeeId == captureId) {
            model.setEmployeeId = captureId;

            //model.employeeId = test[++i];
            model.setEmployeeIdByCompany = test[++i]; //
            //model.employeeName = test[++i];
            model.setUserId = test[++i]; //
            model.setParentCompany = test[++i]; //
            //model.company = test[++i];
            model.setStaffRole = test[++i]; //
            //model.role = test[++i];
            model.setAccPass = test[++i]; //
            model.setEmployerId = test[++i]; //
            //model.employer = test[++i];
            model.setEmploymentStartDate = test[++i]; //
            //model.employmentStartDate = DateTime.parse(test[++i]);
            model.setTypesOfWages = test[++i];
            model.setWagesRate = test[++i];
            //model.wagesRate = double.parse(test[++i]);
            model.setEmployementLetter = test[++i];
            // String bool1 = test[++i];
            // if (bool1.toLowerCase() == false)
            //   model.employementLetter = false;
            // else
            //   model.employementLetter = true;
            model.setMonthlyDeduction = test[++i];
            //model.isActive = test[++i];
            model.setIcNo = test[i++];
            model.setDob = test[++i];
            model.setGender = test[i++];
            model.setNationality = test[i++];
            model.setPhoneNo = test[i++];
            model.setEmail = test[i++];
            model.setEpfNo = test[i++];
            model.setSoscoNo = test[i++];
            model.setItaxNo = test[i++];
            model.setBankName = test[++i];
            model.setBankNo = test[++i];
            model.setAspId = test[++i];
            model.setProfileImgPath = test[++i];
            model.setIsActive = test[++i];
            model.setReligion = test[++i]; //
            model.setPaidLeaveHourLeft = test[++i]; //
            model.setPaidLeaveOnBargain = test[++i]; //
            model.setSickLeaveHourLeft = test[++i]; //
            model.setSickLeaveOnBargain = test[++i]; //
            model.setUuid = test[++i]; //
            model.setLeaveUpdate = test[++i]; //

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

  Future<List<Employee>?> updateUser(Employee emp) async {
    var url = Uri.parse(
        "https://finalyearproject20221212223004.azurewebsites.net/api/EmployeeAPI");

    var response = await http.get(url);
    if (response.statusCode == 200) {
      // List<Employee> employee = [];
      // String infoString = response.body;
      // infoString = infoString.substring(2, infoString.length - 2);
      // List<String> infoList;
      // infoList = infoString.split("\",\"");

      // //infoList.forEach((element) {
      // for (var element in infoList) {
      //   Employee model = new Employee();

      //   List<String> test = element.split(",");
      //   //int index = 0;
      //   int i = -1;
      //   model.employeeId = "E00002"; //employee id from login
      //   String captureId = test[++i]; //
      //   if (model.employeeId == captureId) {
      var response = await http.put(url, body: emp);
      // }
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
}
//}
