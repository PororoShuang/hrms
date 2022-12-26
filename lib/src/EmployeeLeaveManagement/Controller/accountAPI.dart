import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:hrms/src/Authentication/View/login_screen.dart';

import '../Model/employee_information.dart';

EmployeeInfo userModel = new EmployeeInfo();
List<EmployeeInfo> employeeInfo = [];

class ApiServiceEmployeeInfo {
  Future<List<EmployeeInfo>?> getUsers() async {
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

        print("infoList.length ${infoList.length}");

        //infoList.forEach((element) {
        for (var element in infoList) {
          EmployeeInfo userModel = new EmployeeInfo();

          var index = infoList.indexOf(element);

          List<String> test = element.split(",");
          //int index = 0;
          int i = -1;
          // userModel.employeeId = currentLoginID;
          // userModel.accPass = currentLoginPassword;
          String captureId = test[++i]; //
          //if (userModel.employeeId == captureId) {
            userModel.employeeId = captureId;
            userModel.setEmployeeIdByCompany = test[++i]; //
            userModel.employeeName = test[++i];
            userModel.setUserId = test[++i]; //
            userModel.setParentCompany = test[++i]; //
            //model.company = test[++i];
            userModel.setStaffRole = test[++i]; //
            //model.role = test[++i];
            //String capturePassword = test[++i];

              employeeInfo.add(userModel);
          print("employeeAPI getUsers success add userId ${employeeInfo[index].userId}");
          print("employeeAPI getUsers success add employeeId ${employeeInfo[index].employeeId}");
          print("employeeAPI getUsers success add ${employeeInfo[index].employeeName}");
        }

        print("employeeAPI getUsers success ${employeeInfo.length}");

        return employeeInfo;
      }
    } catch (e) {
      print("employeeAPI getUsers fail");

      log(e.toString());
    }
  }

  Future<void> updateUser() async {
    var url = Uri.parse(
        "https://finalyearproject20221212223004.azurewebsites.net/api/EmployeeAPI");
    Map<String, String> headers = new HashMap();
    headers['Accept'] = 'application/json';
    headers['Content-type'] = 'application/json';
    headers['Host'] = ' finalyearproject20221212223004.azurewebsites.net';
    var response = await http.put(url,
        headers: headers,
        body: jsonEncode({
          "employee_id": userModel.getEmployeeId,
          "employee_id_by_company": userModel.getEmployeeIdByCompany,
          "employee_name": userModel.getEmployeeName,
          "user_id": userModel.getUserId,
          "parent_company": userModel.getParentCompany,
          "company": null,
          "staff_role": userModel.getStaffRole,
          "role": null,
          "acc_pass": "555",
          "employer_id ": userModel.getEmployerId,
          "employment_start_date ": userModel.getEmploymentStartDate,
          "types_of_wages ": userModel.getTypesOfWages,
          "wages_rate ": userModel.getWagesRate,
          "employement_letter ": userModel.getEmployementLetter,
          "monthly_deduction ": userModel.getMonthlyDeduction,
          "ic_no": userModel.getIcNo,
          "dob": userModel.getDob, //
          "gender": userModel.getGender,
          "nationality": userModel.getNationality,
          //"nationality"
          "phone_no": userModel.getPhoneNo,
          "email": userModel.getEmail,
          "epf_no": userModel.getEpfNo,
          "sosco_no": userModel.getSoscoNo,
          "itax_no": userModel.getItaxNo,
          "bank_name": userModel.getBankName,
          "bank_no": userModel.getBankNo,
          "asp_id ": userModel.getAspId,
          "profileImg_path ": userModel.getProfileImgPath,
          "is_active ": userModel.getIsActive,
          "religion": userModel.getReligion,
          //"religion": "Non-Muslim",
          "sickLeaveHourLeft": userModel.getSickLeaveHourLeft,
          "paidLeaveHourLeft": userModel.getPaidLeaveHourLeft,
          "sickLeaveOnBargain": userModel.getSickLeaveOnBargain,
          "paidLeaveOnBargain": userModel.getPaidLeaveOnBargain,
          "uuid": userModel.getUuid,
          "leaveUpdate ": userModel.getLeaveUpdate
        }));
    print(response.body);
    print(response.statusCode);
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
      dateSplit[0] +
      "-" +
      dateSplit[1] +
      "T" +
      hour.toString() +
      ":" +
      timeSplit[1] +
      ":" +
      timeSplit[2];
  return convertedDT;
}

