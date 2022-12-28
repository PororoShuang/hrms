import 'dart:developer';

import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/Payroll/Model/payroll_information.dart';
import 'package:hrms/src/Payroll/View/payroll.dart';
import 'package:http/http.dart' as http;

class PayrollApiService {
  Future<List<Payrolls>?> getPayroll() async {
    try {
      List<Payrolls> payrolls = [];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/PayrollAPI');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          Payrolls payrollModel = new Payrolls();
          payrollModel.payroll_id = retrievedData[++i];
          String capturedStaffId = retrievedData[++i];
          if (capturedStaffId == userModel.employeeId) {
            payrollModel.date_created = retrievedData[++i];
            payrollModel.month_salary = retrievedData[++i];
            payrollModel.overtime_pay = retrievedData[++i];
            payrollModel.kwsp_total = retrievedData[++i];
            payrollModel.zakat_total = retrievedData[++i];
            payrolls.add(payrollModel);
          }
        }
      }
      ;
      return payrolls;
    } catch (e) {
      log(e.toString());
    }
  }
}
