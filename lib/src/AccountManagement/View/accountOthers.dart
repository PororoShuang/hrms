import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/AccountManagement/View/account.dart';

class OtherAccount extends StatefulWidget {
  const OtherAccount({super.key});
  @override
  State<OtherAccount> createState() => _OtherAccount();
}

class _OtherAccount extends State<OtherAccount> {
  final _formKey = GlobalKey<FormState>();
  final epfController = TextEditingController();
  final socsoController = TextEditingController();
  final iTaxController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Other Account Number'),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: (userModel.getEpfNo == "")
          ? SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 30),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: TextFormField(
                        controller: epfController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                            labelText: "EPF No"),
                        validator: Employee.validateEPF(epfController.text),
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: TextFormField(
                        controller: socsoController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                            labelText: "SOSCO No"),
                        validator: Employee.validateSOSCO(socsoController.text),
                        // SOCSO or PERKESO number is our Malaysian NRIC number (12 digits, without the dash)
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: TextFormField(
                        controller: iTaxController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                            labelText: "I-Tax No"),
                        validator: Employee.validateITax(iTaxController.text),
                      )),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 55,
                    width: 300,
                    child: TextButton(
                        child: Text("Save", style: TextStyle(fontSize: 19)),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.indigo[900],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(112)),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    'Update Other Account Infomation'),
                                content: const Text(
                                    'Are you confirm want to update others infomation?\nYou can only Update Once'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        userModel.setEpfNo = epfController.text;
                                        userModel.setSoscoNo =
                                            socsoController.text;
                                        userModel.setItaxNo =
                                            iTaxController.text;
                                        await ApiService().updateUser();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content:
                                                Text('Update Successfully'),
                                          ),
                                        );
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Account()));
                                      },
                                      child: const Text('Confirm')),
                                ],
                              ),
                            );
                          }
                        }),
                  ),
                ]),
              ),
            )
          : Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: Form(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('EPF No : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getEpfNo,
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('SOCSO No : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getSoscoNo,
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('I-Tax No : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getItaxNo,
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
}
