import 'dart:collection';
import 'dart:convert';
import 'dart:developer';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/Training/Model/trainingProgress_information.dart';
import 'package:http/http.dart' as http;

int counter = 0;
Employee employee = new Employee();
int status = 0;

class TrainingApiService{

  Future<List<TrainingProgress>?>getAllTrainingProgress()async{
    try{
      List<TrainingProgress> trainingProgress=[];
      var url = Uri.parse(
          'https://finalyearproject20221212223004.azurewebsites.net/api/TrainingProgressAPI');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        String infoString = response.body;
        infoString = infoString.substring(2, infoString.length - 2);
        List<String> infoList;
        infoList = infoString.split("\",\"");

        for (var element in infoList) {
          List<String> retrievedData = element.split(",");
          int i = -1;
          TrainingProgress trainingProgressModel = new TrainingProgress();
          trainingProgressModel.staffID=retrievedData[++i];
          trainingProgressModel.trainingID=retrievedData[++i];
          trainingProgressModel.completion=retrievedData[++i];
          trainingProgressModel.durationLeft=retrievedData[++i];
        }

      };
      return trainingProgress;
    }
    catch (e) {
      log(e.toString());
    }
  }

}