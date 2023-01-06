import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Controller/CompensationAPI.dart';
import '../Model/compensation_information.dart';

class CompensationPending extends StatefulWidget {
  const CompensationPending({super.key});

  @override
  State<CompensationPending> createState() => _CompensationPending();
}

class _CompensationPending extends State<CompensationPending> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List<Compensations> compensationDescendedPendingList = [];
  bool isLoading = false;

  void getData() async {
    isLoading = false;
    List<Compensations> myCompensationsList = [];
    myCompensationsList = (await CompensationsApiService().getCompensations())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (mounted) setState(() {});
    List<Compensations> compensationsPendingList = [];
    for (int i = 0; i < myCompensationsList.length; i++) {
      if (myCompensationsList[i].status == "Pending") {
        compensationsPendingList.add(myCompensationsList[i]);
      }
    }
    compensationDescendedPendingList = compensationsPendingList.toList();
    isLoading = true;
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
      body: compensationDescendedPendingList == null ||
              compensationDescendedPendingList.isEmpty
          ? (isLoading
              ? Image.asset(
                  "assets/noDataFound.png",
                  height: 500,
                  width: 1000,
                )
              : const Center(child: CircularProgressIndicator()))
          : ListView.builder(
              itemCount: compensationDescendedPendingList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text("Date Applied:"),
                          ),
                          Container(
                            child: (Text(compensationDescendedPendingList[index]
                                    .date_applied ??
                                "-")),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text("Category of expenses:"),
                          ),
                          Container(
                            child: Text(compensationDescendedPendingList[index]
                                    .comp_type ??
                                "-"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text("Purpose:"),
                          ),
                          Container(
                            child: Text(compensationDescendedPendingList[index]
                                    .comp_desc ??
                                "-"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text("Status:"),
                          ),
                          Container(
                            child: Text(compensationDescendedPendingList[index]
                                    .status ??
                                "-"),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       padding: EdgeInsets.only(left: 40.0),
                      //       child: Text("Receipt :"),
                      //     ),
                      //     TextButton.icon(
                      //       // <-- TextButton
                      //       onPressed: () async {
                      //         await launchUrlString(
                      //           "https://finalyearproject20221212223004.azurewebsites.net/" +
                      //               (compensationDescendedPendingList[index]
                      //                       .supporting_document ??
                      //                   "-"),
                      //           mode: LaunchMode.externalApplication,
                      //         );
                      //       },
                      //       icon: Icon(
                      //         Icons.download,
                      //         size: 24.0,
                      //         color: Colors.indigo[900],
                      //       ),
                      //       label: Text(''),
                      //     ),
                      //     SizedBox(
                      //       height: 30,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                );
              }));
}
