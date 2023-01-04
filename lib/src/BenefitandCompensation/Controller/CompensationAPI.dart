import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
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
          compensationsModel.comp_id = retrievedData[++i];
          compensationsModel.user_id = retrievedData[++i];
          compensationsModel.comp_type = retrievedData[++i];
          compensationsModel.comp_desc = retrievedData[++i];
          compensationsModel.date_applied = retrievedData[++i];
          compensationsModel.approved_by = retrievedData[++i];
          compensationsModel.status = retrievedData[++i];
          compensationsModel.reject_reason = retrievedData[++i];
          compensationsModel.date_completed = retrievedData[++i];
          compensationsModel.supporting_document = retrievedData[++i];
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
          compensationsModel.comp_id = retrievedData[++i];
          compensationsModel.user_id = retrievedData[++i];
          if (compensationsModel.user_id == userModel.employeeId) {
            compensationsModel.comp_type = retrievedData[++i];
            compensationsModel.comp_desc = retrievedData[++i];
            compensationsModel.date_applied = retrievedData[++i];
            compensationsModel.approved_by = retrievedData[++i];
            compensationsModel.status = retrievedData[++i];
            compensationsModel.reject_reason = retrievedData[++i];
            compensationsModel.date_completed = retrievedData[++i];
            compensationsModel.supporting_document = retrievedData[++i];
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

  Future<void> uploadClaimDetails(
      int totalCompensationLength,
      String? compensationType,
      String? compensationDesc,
     // Uint8List? receiptImage
      ) async {
   String totalCompensationLengthString = totalCompensationLength.toString().padLeft(5, "0");
   String compensationIdString = "\COM" + totalCompensationLengthString;
    String dateNow = DateTime.now().year.toString() +
        "-" +
        DateTime.now().month.toString() +
        "-" +
        DateTime.now().day.toString() +
        "T" +
        DateTime.now().hour.toString().padLeft(2, "0") +
        ":" +
        DateTime.now().minute.toString().padLeft(2, "0") +
        ":" +
        DateTime.now().second.toString().padLeft(2, "0");

    try {
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/compensationAPI');
      Map<String, String> headers = new HashMap();
      headers['Accept'] = 'application/json';
      headers['Content-type'] = 'application/json';
      var response = await http.post(url,
          headers: headers,
          body: jsonEncode(
              {
                "comp_id": compensationIdString,
                "user_id": userModel.employeeId,
                "comp_type": compensationType,
                "comp_desc": compensationDesc,
                "date_applied": dateNow,
                "approved_by": null,
                "status": "Pending",
                "reject_reason": null,
                "date_completed": dateNow,
                "supporting_document": null
              }));
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      log(e.toString());
    }
  }
}
