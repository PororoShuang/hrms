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
      await getTraining();
      await getTrainingData();
    });
  }

  List trainingProgressList = [];
  List trainingList = [];

  Future<void> getTraining() async {
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
    List<Training> myTrainingList = [];
    myTrainingList = (await TrainingApiService().getAllTraining())!;
    if (mounted) setState(() {});
    List<Training> trainingProgramList = [];
    for (int i = 0; i < myTrainingList.length; i++) {
      for (int k = 0; k < trainingProgressList.length; k++) {
        if (trainingProgressList[k].staffID ==
            myTrainingList[i].staffID) {
          myTrainingList[i].trainingName = trainingProgressList[k].trainingName;
        }
        //myTrainingList[i].trainingID = trainingProgressList[k].trainingID;
        //trainingProgramList.add(myTrainingList[i]);
      }

      trainingProgramList.add(myTrainingList[i]);
    }
    trainingList = trainingProgramList.toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: trainingList == null ||
                trainingList.isEmpty ||
                trainingProgressList.isEmpty
            ? const Center(child: CircularProgressIndicator())
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
                                        trainingProgressList[index]
                                            .completion ??
                                    "-"),
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
