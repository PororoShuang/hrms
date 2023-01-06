import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hrms/src/BenefitandCompensation/Controller/CompensationAPI.dart';
import 'package:hrms/src/BenefitandCompensation/View/compensationStatus.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/compensation_information.dart';

class ApplyClaims extends StatefulWidget {
  const ApplyClaims({super.key});

  @override
  State<ApplyClaims> createState() => _ApplyClaims();
}

class _ApplyClaims extends State<ApplyClaims> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<Compensations> myCompensationList = [];

  void getData() async {
    myCompensationList =
        (await CompensationsApiService().getAllCompensations())!;
    if (mounted) setState(() {});
  }

  List<String> itemsType = [
    'Select a expenses',
    'Mileage',
    'Petro Allowance',
    'Parking Allowance',
    'Meal Allowance',
    'Medical Claims',
    'Others (Please specify in purpose)'
  ];
  String? selectedItem = 'Select a expenses';

  XFile? image;
  final ImagePicker picker = ImagePicker();
  TextEditingController purpose = new TextEditingController();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void showToastSubmitted() {
    Fluttertoast.showToast(
        msg: 'Claim Submitted',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.teal,
        textColor: Colors.white);
  }

  //Could implement in future as enhancement
  // void myReceipt() {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           shape:
  //               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  //           title: Text('Please choose media to select'),
  //           content: Container(
  //             height: MediaQuery.of(context).size.height / 6,
  //             child: Column(
  //               children: [
  //                 ElevatedButton(
  //                   //if user click this button, user can upload image from gallery
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     getImage(ImageSource.gallery);
  //                   },
  //                   child: Row(
  //                     children: [
  //                       Icon(Icons.image),
  //                       Text('From Gallery'),
  //                     ],
  //                   ),
  //                 ),
  //                 ElevatedButton(
  //                   //if user click this button. user can upload image from camera
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                     getImage(ImageSource.camera);
  //                   },
  //                   child: Row(
  //                     children: [
  //                       Icon(Icons.camera),
  //                       Text('From Camera'),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Apply Claims'),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Align(
                      alignment: Alignment(-0.65, 1.2),
                      child: Text('Category of expenses',
                          style: TextStyle(
                            height: 3,
                            fontSize: 20,
                          ))),
                  SizedBox(
                    width: 350,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      value: selectedItem,
                      items: itemsType
                          .map((item) => new DropdownMenuItem<String>(
                              value: item,
                              child: new SizedBox(
                                width: 200.0,
                                child: Text(item,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontStyle: FontStyle.italic)),
                              )))
                          .toList(),
                      onChanged: (item) => setState(() => selectedItem = item),
                    ),
                  ),
                ],
              ),
              Align(
                  alignment: Alignment(-0.8, 1.2),
                  child: Text('Purpose',
                      style: TextStyle(
                        height: 2,
                        fontSize: 20,
                      ))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: new SizedBox(
                  width: 350.0,
                  child: TextField(
                    controller: purpose,
                    maxLines: 3,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              //Could implement in future as enhancement-upload receipt
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Container(
              //       child: const Padding(
              //         padding: EdgeInsets.all(38.0),
              //         child: Text('Upload Receipt',
              //             style: TextStyle(
              //               fontSize: 20,
              //             )),
              //       ),
              //     ),
              //     Container(
              //       child: IconButton(
              //         icon: const Icon(Icons.upload_rounded),
              //         onPressed: () {
              //           //myReceipt();
              //           setState(() {});
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // Column(
              //   children: [
              //     SizedBox(
              //       height: 10,
              //     ), //if image not null show the image
              //     //if image null show text
              //     image != null
              //         ? Container(
              //             alignment: Alignment.centerLeft,
              //             padding: const EdgeInsets.symmetric(horizontal: 50),
              //             child: ClipRRect(
              //               borderRadius: BorderRadius.circular(8),
              //               child: Image.file(
              //                 //to show image, you type like this.
              //                 File(image!.path),
              //                 fit: BoxFit.cover,
              //                 //width: MediaQuery.of(context).size.width,
              //                 width: 150,
              //                 height: 250,
              //               ),
              //             ),
              //           )
              //         : Text(
              //             "No Image",
              //             style: TextStyle(fontSize: 20),
              //           ),
              //   ],
              // ),
              SizedBox(height: 30),
              SizedBox(
                height: 55,
                width: 300,
                child: TextButton(
                  child: Text("Submit", style: TextStyle(fontSize: 19)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.indigo[900],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(112)),
                  ),
                  onPressed: () async {
                    if (purpose == null || purpose.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text('Please enter the purpose'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'))
                          ],
                        ),
                      );
                    } else if (selectedItem == "Select a expenses") {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text('Please select a category of expenses'),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('OK'))
                          ],
                        ),
                      );
                    } else {
                      CompensationsApiService().uploadClaimDetails(
                        myCompensationList.length + 1,
                        selectedItem,
                        purpose.text,
                        //await image?.readAsBytes(),
                      );
                      showToastSubmitted();
                      Future.delayed(Duration(milliseconds: 600), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CompensationStatus()));
                      });
                    }
                  },
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      );
}
