import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Controller/documentAPI.dart';
import '../Controller/trainingProgressAPI.dart';
import '../Model/trainingProgress_information.dart';
import '../Model/document_information.dart';

class TrainingCertificate extends StatefulWidget {
  const TrainingCertificate({super.key});

  @override
  State<TrainingCertificate> createState() => _TrainingCertificate();
}

class _TrainingCertificate extends State<TrainingCertificate> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getTrainingProgress();
      //await getTrainingData();
      await getDocument();
    });
  }

  List<TrainingProgress> trainingProgressList = [];

  // List<Training> trainingList = [];
  List<Document> documentList = [];
  bool isLoading = false;

  Future<void> getTrainingProgress() async {
    List<TrainingProgress> myTrainingProgressList = [];
    myTrainingProgressList =
        await TrainingProgressApiService().getTrainingProgress() ??
            <TrainingProgress>[];
    if (mounted) setState(() {});
    //List<TrainingProgress> trainingList = [];
    for (int i = 0; i < myTrainingProgressList.length; i++) {
      trainingProgressList.add(myTrainingProgressList[i]);
    }
  }

  Future<void> getDocument() async {
    isLoading = false;
    List<Document> myDocumentList = [];
    myDocumentList =
        await DocumentApiService().getAllDocument() ?? <Document>[];
    if (mounted) setState(() {});
    List<Document> documentCertList = [];
    for (int i = 0; i < myDocumentList.length; i++) {
      for (int k = 0; k < trainingProgressList.length; k++) {
        if (trainingProgressList[k].certID == myDocumentList[i].document_id) {
          documentCertList.add(myDocumentList[i]);
        }
      }
    }
    documentList = documentCertList;
    isLoading = true;
  }

  XFile? image;
  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myCertificate() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: documentList == null ||
                documentList.isEmpty ||
                trainingProgressList.isEmpty
            ? (isLoading
                ? Image.asset(
                    "assets/noDataFound.png",
                    height: 500,
                    width: 1000,
                  )
                : const Center(child: CircularProgressIndicator()))
            : ListView.builder(
                itemCount: documentList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: new Text(
                                  documentList[index].document_name ?? "-"),
                              subtitle: new Text("Expired:" +
                                  (documentList[index].expiry_date ?? "-")),
                            ),
                          ),
                          TextButton.icon(
                            // <-- TextButton
                            onPressed: () async {
                              await launchUrlString(
                                "https://finalyearproject20221212223004.azurewebsites.net/" +
                                    (documentList[index].document_path ?? "-"),
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            icon: Icon(
                              Icons.download,
                              size: 24.0,
                              color: Colors.indigo[900],
                            ),
                            label: Text(''),
                          ),
                        ]),
                        // TextButton(
                        //   child: Text("View Certificate"),
                        //   onPressed: () async {
                        //     await launchUrlString(
                        //       "https://finalyearproject20221212223004.azurewebsites.net/" +
                        //           (documentList[index].document_path ??
                        //               "-"),
                        //       mode: LaunchMode.externalApplication,
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  );
                }),
      );
}
