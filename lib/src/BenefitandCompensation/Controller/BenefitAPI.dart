import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:http/http.dart' as http;
import '../Model/benefit_information.dart';

int counter = 0;
Employee employee = new Employee();
int status = 0;

class BenefitApiService {
  Future<List<Benefits>?> getBenefit() async {
    try {
      List<Benefits> benefit = [];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/benefitAPI');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          Benefits benefitModel = new Benefits();
          benefitModel.benefitId = retrievedData[++i];
          benefitModel.benefitDesc = retrievedData[++i];
          benefitModel.benefitType = retrievedData[++i];
          benefitModel.startDate = retrievedData[++i];
          benefitModel.endDate = retrievedData[++i];
          benefitModel.days = retrievedData[++i];
          benefit.add(benefitModel);
        }
      }
      ;
      return benefit;
    } catch (e) {
      log(e.toString());
    }
  }

}

