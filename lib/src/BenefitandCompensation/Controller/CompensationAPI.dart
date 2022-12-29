import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:http/http.dart' as http;
import '../Model/compensation_information.dart';

int counter = 0;
Employee employee = new Employee();
int status = 0;

class CompensationsApiService {
  Future<List<Compensations>?> getAllCompensations() async {
    try {
      List<Compensations> compensations = [];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/compensationAPI');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          Compensations compensationsModel = new Compensations();
          compensationsModel.compensationId = retrievedData[++i];
          compensationsModel.userId = retrievedData[++i];
          compensationsModel.compensationType = retrievedData[++i];
          compensationsModel.compensationDesc = retrievedData[++i];
          compensationsModel.dateApplied = retrievedData[++i];
          compensationsModel.approvedBy = retrievedData[++i];
          compensationsModel.status = retrievedData[++i];
          compensationsModel.rejectReason = retrievedData[++i];
          compensationsModel.dateCompleted = retrievedData[++i];
          compensationsModel.supportingDocuments = retrievedData[++i];
          compensations.add(compensationsModel);
        }
      }
      ;
      return compensations;
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Compensations>?> getCompensations() async {
    try {
      List<Compensations> compensations = [];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/compensationAPI');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          Compensations compensationsModel = new Compensations();
          compensationsModel.compensationId = retrievedData[++i];
          compensationsModel.userId = retrievedData[++i];
          if(compensationsModel.userId == userModel.employeeId){
          compensationsModel.compensationType = retrievedData[++i];
          compensationsModel.compensationDesc = retrievedData[++i];
          compensationsModel.dateApplied = retrievedData[++i];
          compensationsModel.approvedBy = retrievedData[++i];
          compensationsModel.status = retrievedData[++i];
          compensationsModel.rejectReason = retrievedData[++i];
          compensationsModel.dateCompleted = retrievedData[++i];
          compensationsModel.supportingDocuments = retrievedData[++i];
          compensations.add(compensationsModel);
          }
        }
      }
      ;
      return compensations;
    } catch (e) {
      log(e.toString());
    }
  }

}

