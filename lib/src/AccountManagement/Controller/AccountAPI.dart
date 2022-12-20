// import 'package:flutter/widgets.dart';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:http/http.dart' as http;
import 'package:hrms/src/Authentication/View/login_screen.dart';

Employee userModel = new Employee();
List<Employee> employee = [];

class ApiService {
  Future<List<Employee>?> getUsers() async {
    try {
      //var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      String? tempDateTiime, officialDT;
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
            tempDateTiime = test[++i];
            //officialDT = convertDateTime(tempDateTiime);
            //userModel.setEmploymentStartDate = officialDT; //
            userModel.setEmploymentStartDate = tempDateTiime; //
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
            userModel.setIcNo = test[++i];
            tempDateTiime = test[++i];
            officialDT = convertDateTime(tempDateTiime);
            userModel.setDob = officialDT;
            userModel.setGender = test[++i];
            userModel.setNationality = test[++i];
            userModel.setPhoneNo = test[++i];
            userModel.setEmail = test[++i];
            userModel.setEpfNo = test[++i];
            userModel.setSoscoNo = test[++i];
            userModel.setItaxNo = test[++i];
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
            tempDateTiime = test[++i];
            officialDT = convertDateTime(tempDateTiime);
            userModel.setLeaveUpdate = officialDT; //

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

  Future<void> updateUser(String bankName, bankNo) async {
    var url = Uri.parse(
        "https://finalyearproject20221212223004.azurewebsites.net/api/EmployeeAPI");
    Map<String, String> headers = new HashMap();
    headers['Accept'] = 'application/json';
    headers['Content-type'] = 'application/json';
    var response = await http.put(url,
        headers: headers,
        body: jsonEncode({
          "employee_id": userModel.getEmployeeId,
          "employee_id_by_company": userModel.getEmployeeIdByCompany,
          "employee_name": userModel.getEmployeeName,
          "user_id": userModel.getUserId,
          "parent_company": userModel.getParentCompany,
          "company": null,
          "staff_role ": userModel.getStaffRole,
          "role": null,
          "acc_pass ": "555",
          "employer_id ": userModel.getEmployerId,
          "employment_start_date ": userModel.getEmploymentStartDate,
          "types_of_wages ": userModel.getTypesOfWages,
          "wages_rate ": userModel.getWagesRate,
          "employement_letter ": userModel.getEmployementLetter,
          "monthly_deduction ": userModel.getMonthlyDeduction,
          "ic_no": userModel.getIcNo,
          "dob": userModel.getDob, //
          "gender ": "Female",
          "nationality ": userModel.getNationality,
          "phone_no": userModel.getPhoneNo,
          "email": userModel.getEmail,
          "epf_no": "12345",
          "sosco_no ": "258963147",
          "itax_no ": "4445256",
          "bank_name ": bankName,
          "bank_no ": bankNo,
          "asp_id ": userModel.getAspId,
          "profileImg_path ": userModel.getProfileImgPath,
          "is_active ": userModel.getIsActive,
          "religion ": userModel.getReligion,
          "sickLeaveHourLeft": userModel.getSickLeaveHourLeft,
          "paidLeaveHourLeft": userModel.getPaidLeaveHourLeft,
          "sickLeaveOnBargain": userModel.getSickLeaveOnBargain,
          "paidLeaveOnBargain": userModel.getPaidLeaveOnBargain,
          "uuid ": "",
          "leaveUpdate ": userModel.getLeaveUpdate
        }));
    //if (response.statusCode == 200) {

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
    //var response = await http.put(url, body: emp);
    // }
  }
}

String? convertDateTime(String tempdob) {
  tempdob = tempdob.replaceAll("/", "-");
  String? datedobString, timedobString;
  String convertedDT;
  List<String> dobList, timeSplit, dateSplit;
  var hour;

  dobList = tempdob.split(" "); // 12/19/2022 11:13:00 AM
  datedobString = dobList[0];
  dateSplit = datedobString.split("-");
  // if (dobList[1].isNotEmpty) {
  timedobString = dobList[1];
  timeSplit = timedobString.split(":");
  if (dobList[2].contains("PM")) {
    hour = int.parse(timeSplit[0]) + 12;
  } else
    hour = timeSplit[0];
  convertedDT = dateSplit[2] +
      "-" +
      dateSplit[1] +
      "-" +
      dateSplit[0] +
      "T" +
      hour.toString() +
      ":" +
      timeSplit[1] +
      ":" +
      timeSplit[2];
  // } else {
  //   convertedDT =
  //       dateSplit[2] + "-" + dateSplit[1] + "-" + dateSplit[0] + "T00:00:00";
  // }

  return convertedDT;
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
//}
//}
