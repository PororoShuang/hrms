import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/compensationInformation.dart';


class CompensationApprove extends StatefulWidget{
  const CompensationApprove({super.key});
  @override
  State<CompensationApprove> createState() => _CompensationApprove();
}

class _CompensationApprove extends State<CompensationApprove> {
  List<Compensations> myCompensationList = [
    Compensations(
      date: "27/7/2022",
      category: "Lunch",
      purpose: "Outstation",
      status: "Approved",
      approvedBy: "-",
    ),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    body: ListView(
      children: myCompensationList.map((e) {
        return Card(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 40.0),
                    child: Text("Date:"),
                  ),
                  Container(
                    child: Text(e.date!),
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
                    child: Text(e.category!),
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
                    child: Text(e.purpose!),
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
                    child: Text(e.status!),
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
                    child: Text(e.approvedBy!),
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