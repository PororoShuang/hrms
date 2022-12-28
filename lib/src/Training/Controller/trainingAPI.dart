import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:http/http.dart' as http;
import '../Model/training_information.dart';

int counter = 0;
Employee employee = new Employee();
int status = 0;

class TrainingApiService {
  Future<List<Training>?> getAllTraining() async {
    try {
      List<Training> training = [];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/TrainingAPI');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          Training trainingModel = new Training();
          trainingModel.trainingID = retrievedData[++i];
          trainingModel.trainingName = retrievedData[++i];
          trainingModel.trainingDateTime = retrievedData[++i];
          trainingModel.duration = retrievedData[++i];
          training.add(trainingModel);
        }
      };
      print(response.body);
      print(response.statusCode);
      print("get training success ${training.length}");
      return training;
    } catch (e) {
      print("get training fail");
      log(e.toString());
    }
  }
}
