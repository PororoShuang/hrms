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

        for (var element in infoList) {
          var index = infoList.indexOf(element);

          List<String> test = element.split(",");
          int i = -1;
          userModel.employeeId = currentLoginID;
          userModel.accPass = currentLoginPassword;
          String captureId = test[++i]; //
          if (userModel.employeeId == captureId) {
            userModel.setEmployeeId = captureId;

            userModel.setEmployeeIdByCompany = test[++i]; //
            userModel.employeeName = test[++i];
            userModel.setUserId = test[++i]; //
            userModel.setParentCompany = test[++i]; //
            userModel.setStaffRole = test[++i]; //
            String capturePassword = test[++i];
            if (userModel.accPass == capturePassword) {
              userModel.setAccPass = capturePassword;
              userModel.setEmployerId = test[++i]; //
              tempDateTiime = test[++i];
              if (tempDateTiime == "") {
                officialDT = tempDateTiime;
              } else {
                officialDT = convertDateTime(tempDateTiime);
              }
              userModel.setEmploymentStartDate = officialDT; //
              userModel.setTypesOfWages = test[++i];
              userModel.setWagesRate = test[++i];
              userModel.setEmployementLetter = test[++i];
              userModel.setMonthlyDeduction = test[++i];
              userModel.setIcNo = test[++i];
              tempDateTiime = test[++i];
              if (tempDateTiime == "") {
                officialDT = tempDateTiime;
              } else {
                officialDT = convertDateTime(tempDateTiime);
              }
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
              if (tempDateTiime == "") {
                officialDT = tempDateTiime;
              } else {
                officialDT = convertDateTime(tempDateTiime);
              }
              userModel.setLeaveUpdate = officialDT; //
              employee.add(userModel);
              break;
            } else {
              userModel.setAccPass = capturePassword;
              break;
            }
          } else {
            continue;
          }
        }
        return employee;
      }
    } catch (e) {
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
          "acc_pass": userModel.getAccPass,
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

String? convertDateTime(String tempdt) {
  tempdt = tempdt.replaceAll("/", "-");
  String? dateString, timeString;
  String convertedDT;
  List<String> dtList, timeSplit, dateSplit;
  var hour;

  dtList = tempdt.split(" "); // 12/19/2022 11:13:00 AM
  dateString = dtList[0];
  dateSplit = dateString.split("-");
  timeString = dtList[1];
  timeSplit = timeString.split(":");
  if (dtList[2].contains("PM")) {
    hour = int.parse(timeSplit[0]) + 12;
  } else
    hour = timeSplit[0];
  convertedDT = dateSplit[2].padLeft(2, "0") +
      "-" +
      dateSplit[0].padLeft(2, "0") +
      "-" +
      dateSplit[1].padLeft(2, "0") +
      "T" +
      hour.toString().padLeft(2, "0") +
      ":" +
      timeSplit[1].padLeft(2, "0") +
      ":" +
      timeSplit[2].padLeft(2, "0");

  return convertedDT;
}

String splitDT(String DT) {
  List<String> dobList;
  dobList = userModel.getDob.toString().split("T");
  return dobList[0];
}

bool checkCurrentPassword(String currPassword) {
  if (currPassword == userModel.getAccPass) {
    return true;
  } else {
    return false;
  }
}
