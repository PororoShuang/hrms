import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';

class AccountBank extends StatefulWidget {
  const AccountBank({super.key});
  @override
  State<AccountBank> createState() => _AccountBank();
}

class _AccountBank extends State<AccountBank> {
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
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: bankNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.teal,
                      )),
                      labelText: "Bank Name"),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextFormField(
                  controller: bankNoController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.teal,
                      )),
                      labelText: "Bank Account"),
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
                onPressed: () async {
                  userModel.setBankName = bankNameController.text;
                  userModel.setBankNo = bankNoController.text;
                  await ApiService().updateUser(
                      bankNameController.text, bankNoController.text);
                },
              ),
            ),
          ]),
        ),
      );
}
