import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Model/employee.dart';
import '../Controller/AccountAPI.dart';

class AccountDisplay extends StatefulWidget {
  const AccountDisplay({super.key});

  @override
  State<AccountDisplay> createState() => _AccountDisplay();
}

class _AccountDisplay extends State<AccountDisplay> {
  @override
  void initState() {
    super.initState();
    getUsers();
  }

  List employeeList = [];

  void getUsers() async {
    List<Employee> myEmployeeList = [];
    myEmployeeList = (await ApiService().getUsers())!;
    List<Employee> empList = [];
    for (int i = 0; i < myEmployeeList.length; i++) {
        empList.add(myEmployeeList[i]);
    }
    employeeList = empList.reversed.toList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: employeeList == null || employeeList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                children: employeeList.map((e) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("Name:"),
                            ),
                            Container(
                              child: Text(e.name!),
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
                              child: Text("Email:"),
                            ),
                            Container(
                              child: Text(e.email!),
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
