import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Controller/CompensationAPI.dart';
import '../Model/compensation_information.dart';


class CompensationReject extends StatefulWidget {
  const CompensationReject({super.key});

  @override
  State<CompensationReject> createState() => _CompensationReject();
}

class _CompensationReject extends State<CompensationReject> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  List compensationDescendedRejectList = [];

  void getData() async {
    List<Compensations> myCompensationsList = [];
    myCompensationsList = (await CompensationsApiService().getCompensations())!;
    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    if (mounted) setState(() {});
    List<Compensations> compensationsPendingList = [];
    for (int i = 0; i < myCompensationsList.length; i++) {
      if (myCompensationsList[i].status == "Rejected") {
        compensationsPendingList.add(myCompensationsList[i]);
      }
    }
    compensationDescendedRejectList = compensationsPendingList.toList();
  } //



  @override
  Widget build(BuildContext context) => Scaffold(
    body: compensationDescendedRejectList == null ||
        compensationDescendedRejectList.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : ListView(
      children: compensationDescendedRejectList.map((e) {
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
                    child: (Text(e.dateApplied??"-")),
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
                    child: Text(e.compensationType??"-"),
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
                    child: Text(e.compensationDesc??"-"),
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
                    child: Text(e.status??"-"),
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
                    child: Text("Reject Reason:"),
                  ),
                  Container(
                    child: Text(e.rejectReason??"-"),
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
                    child: Text("Approved By:"),
                  ),
                  Container(
                    child: Text(e.approvedBy??"-"),
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
                    child: Text("Date Completed :"),
                  ),
                  Container(
                    child: Text(e.dateCompleted??"-"),
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
                    child: Text("Receipt :"),
                  ),
                  Container(
                    child: Text(e.supportingDocuments??"-"),
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
