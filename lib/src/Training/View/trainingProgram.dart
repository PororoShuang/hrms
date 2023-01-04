import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Controller/trainingAPI.dart';
import '../Controller/trainingProgressAPI.dart';
import '../Model/trainingProgress_information.dart';
import '../Model/training_information.dart';

class TrainingProgram extends StatefulWidget {
  const TrainingProgram({super.key});

  @override
  State<TrainingProgram> createState() => _TrainingProgram();
}

class _TrainingProgram extends State<TrainingProgram> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getTrainingProgress();
      await getTrainingData();
    });
  }

  List<TrainingProgress> trainingProgressList = [];
  List<Training> trainingList = [];
  bool isLoading = false;

  Future<void> getTrainingProgress() async {
    List<TrainingProgress> myTrainingProgressList = [];
    myTrainingProgressList =
        await TrainingProgressApiService().getTrainingProgress() ??
            <TrainingProgress>[];
    if (mounted) setState(() {});
    //List<TrainingProgress> trainingList = [];
    for (int i = 0; i < myTrainingProgressList.length; i++) {
      print("training progress ${myTrainingProgressList[i].staffID}");
      trainingProgressList.add(myTrainingProgressList[i]);
    }
  }

  Future<void> getTrainingData() async {
    isLoading = false;
    List<Training> myTrainingList = [];
    myTrainingList = (await TrainingApiService().getAllTraining())!;
    if (mounted) setState(() {});
    List<Training> trainingProgramList = [];
    for (int i = 0; i < myTrainingList.length; i++) {
      for (int k = 0; k < trainingProgressList.length; k++) {
        if (trainingProgressList[k].trainingID ==
            myTrainingList[i].trainingID) {
          print(
              "trainingProgressList trainingID ${trainingProgressList[k].trainingID}");
          print(
              "myTrainingList trainingID ${myTrainingList[i].trainingID} trainingName ${myTrainingList[i].trainingName}");

          trainingProgramList.add(myTrainingList[i]);
        }
      }
    }
    trainingList = trainingProgramList;
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: trainingList == null ||
                trainingList.isEmpty ||
                trainingProgressList.isEmpty
            ? (isLoading
                ? Image.asset(
                    "assets/noDataFound.png",
                    height: 500,
                    width: 1000,
                  )
                : const Center(child: CircularProgressIndicator()))
            : ListView.builder(
                itemCount: trainingProgressList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(
                                    trainingList[index].trainingName ?? "-"),
                                subtitle: Text("Completion:" +
                                    (trainingProgressList[index].completion ??
                                        "-")),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                subtitle: Text(
                                    trainingList[index].trainingDateTime ??
                                        "-"),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
      );
}
