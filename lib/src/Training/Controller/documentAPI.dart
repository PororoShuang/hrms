import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:http/http.dart' as http;
import '../Model/document_information.dart';

int counter = 0;
Employee employee = new Employee();
int status = 0;

class DocumentApiService {
  Future<List<Document>?> getAllDocument() async {
    try {
      List<Document> document = [];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/documentAPI');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          Document documentModel = new Document();
          documentModel.document_id = retrievedData[++i];
          documentModel.owner_id = retrievedData[++i];
          documentModel.document_name = retrievedData[++i];
          documentModel.date_created = retrievedData[++i];
          documentModel.expiry_date = retrievedData[++i];
          documentModel.notify_date = retrievedData[++i];
          documentModel.document_path = retrievedData[++i];
          document.add(documentModel);
        }
      }
      ;
      print(response.body);
      print(response.statusCode);
      print("get document success ${document.length}");
      return document;
    } catch (e) {
      print("get document fail");
      log(e.toString());
    }
  }

  Future<List<Document>?> getDocument() async {
    try {
      List<Document> document = [];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/documentAPI');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          Document documentModel = new Document();
          documentModel.document_id = retrievedData[++i];
          documentModel.owner_id = retrievedData[++i];
          if (documentModel.owner_id == userModel.employeeId) {
            documentModel.document_name = retrievedData[++i];
            documentModel.date_created = retrievedData[++i];
            documentModel.expiry_date = retrievedData[++i];
            documentModel.notify_date = retrievedData[++i];
            documentModel.document_path = retrievedData[++i];
          }
          document.add(documentModel);
        }
      }
      ;
      print(response.body);
      print(response.statusCode);
      print("get document success ${document.length}");
    } catch (e) {
      print("get document fail");
      log(e.toString());
    }
  }
}
