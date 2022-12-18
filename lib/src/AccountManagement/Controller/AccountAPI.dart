// import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/Attendance/constants.dart';
import 'package:hrms/src/Attendance/Model/attendance_information.dart';
import 'package:http/http.dart' as http;
import 'package:hrms/src/Authentication/View/login_screen.dart';

Employee userModel = new Employee();
List<Employee> employee = [];

class ApiService {
  Future<List<Employee>?> getUsers() async {
    try {
      //var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);

      var url = Uri.parse(
          "https://finalyearproject20221212223004.azurewebsites.net/api/EmployeeAPI");

      var response = await http.get(url);
      if (response.statusCode == 200) {
        //List Method
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        //infoList.forEach((element) {
        for (var element in infoList) {
          var index = infoList.indexOf(element);

          List<String> test = element.split(",");
          //int index = 0;
          int i = -1;
          userModel.employeeId = currentLoginID;
          String captureId = test[++i]; //
          if (userModel.employeeId == captureId) {
            userModel.setEmployeeId = captureId;

            //model.employeeId = test[++i];
            userModel.setEmployeeIdByCompany = test[++i]; //
            userModel.employeeName = test[++i];
            userModel.setUserId = test[++i]; //
            userModel.setParentCompany = test[++i]; //
            //model.company = test[++i];
            userModel.setStaffRole = test[++i]; //
            //model.role = test[++i];
            userModel.setAccPass = test[++i]; //
            userModel.setEmployerId = test[++i]; //
            //userModel.employer = test[++i];
            userModel.setEmploymentStartDate = test[++i]; //
            //model.employmentStartDate = DateTime.parse(test[++i]);
            userModel.setTypesOfWages = test[++i];
            userModel.setWagesRate = test[++i];
            //model.wagesRate = double.parse(test[++i]);
            userModel.setEmployementLetter = test[++i];
            // String bool1 = test[++i];
            // if (bool1.toLowerCase() == false)
            //   model.employementLetter = false;
            // else
            //   model.employementLetter = true;
            userModel.setMonthlyDeduction = test[++i];
            //model.isActive = test[++i];
            userModel.setIcNo = test[i++];
            userModel.setDob = test[++i];
            userModel.setGender = test[i++];
            userModel.setNationality = test[i++];
            userModel.setPhoneNo = test[i++];
            userModel.setEmail = test[i++];
            userModel.setEpfNo = test[i++];
            userModel.setSoscoNo = test[i++];
            userModel.setItaxNo = test[i++];
            userModel.setBankName = test[++i];
            userModel.setBankNo = test[++i];
            userModel.setAspId = test[++i];
            userModel.setProfileImgPath = test[++i];
            userModel.setIsActive = test[++i];
            userModel.setReligion = test[++i]; //
            userModel.setPaidLeaveHourLeft = test[++i]; //
            userModel.setPaidLeaveOnBargain = test[++i]; //
            userModel.setSickLeaveHourLeft = test[++i]; //
            userModel.setSickLeaveOnBargain = test[++i]; //
            userModel.setUuid = test[++i]; //
            userModel.setLeaveUpdate = test[++i]; //

            employee.add(userModel);
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
