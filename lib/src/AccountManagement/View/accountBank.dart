import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/AccountManagement/View/account.dart';

class AccountBank extends StatefulWidget {
  const AccountBank({super.key});
  @override
  State<AccountBank> createState() => _AccountBank();
}

class _AccountBank extends State<AccountBank> {
  final _formKey = GlobalKey<FormState>();
  final bankNameController = TextEditingController();
  final bankNoController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Account Bank'),
        backgroundColor: Colors.blueGrey[900],
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: (userModel.getBankName == "")
          ? SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(children: <Widget>[
                  SizedBox(height: 30),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: TextFormField(
                        controller: bankNameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                            labelText: "Bank Name"),
                        validator:
                            Employee.validateName(bankNameController.text),
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: TextFormField(
                        controller: bankNoController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                            labelText: "Bank Account"),
                        validator:
                            Employee.validateBankAcc(bankNoController.text),
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
                                title: const Text('Update Bank Infomation'),
                                content: const Text(
                                    'Are you confirm want to update bank infomation?\nYou can only Update Once'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                      onPressed: () async {
                                        userModel.setBankName =
                                            bankNameController.text;
                                        userModel.setBankNo =
                                            bankNoController.text;
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
                            Text('Bank Name : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getBankName,
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
                            Text('Bank Number : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getBankNo,
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
