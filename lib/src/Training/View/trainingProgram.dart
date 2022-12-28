import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Controller/trainingAPI.dart';
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
    getTraining();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await getTrainingProgress();
    //   await getData();
    // });
  }

  List trainingProgressList = [];

  //List trainingList = [];

  void getTraining() async {
    late List<Training> myTrainingList = [];
    myTrainingList = (await TrainingApiService().getAllTraining())!;
    if (mounted) setState(() {});
    List<Training> trainingList = [];
    for (int i = 0; i < myTrainingList.length; i++) {
      trainingList.add(myTrainingList[i]);
    }
    trainingProgressList = trainingList.toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: trainingProgressList == null || trainingProgressList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: trainingProgressList.map((e) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("ID:"),
                            ),
                            Container(
                              child: Text(e.trainingID??"-"),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
      );
}
