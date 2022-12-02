import 'package:flutter/material.dart';
import 'package:hrms/src/navBar.dart';
import '../../AccountManagement/View/forgotPassword.dart';
import '../../AccountManagement/View/signUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  List<String> items = [
    'Select a company',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4'
  ];
  String? selectedItem = 'Select a company';
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  Align(
                      alignment: Alignment(-0.8, 1.2),
                      child: Text('Company Name',
                          style: TextStyle(
                            height: 5,
                            fontSize: 20,
                          ))),
                  SizedBox(
                    width: 350,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      value: selectedItem,
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontStyle: FontStyle.italic)),
                              ))
                          .toList(),
                      onChanged: (item) => setState(() => selectedItem = item),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment(-0.8, 1.2),
                child: Text('Employee ID',
                    style: TextStyle(
                      height: 2,
                      fontSize: 20,
                    )),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your Employee ID',
                    hintStyle:
                        TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment(-0.8, 1.2),
                  child: Text('Password',
                      style: TextStyle(height: 2, fontSize: 20))),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    hintStyle:
                        TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
                    border: OutlineInputBorder(),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(_obscureText
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  obscureText: _obscureText,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPassword()),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context).primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 55,
                width: 300,
                child: TextButton(
                  child: Text("Register", style: TextStyle(fontSize: 19)),
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(112)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 55,
                width: 300,
                child: TextButton(
                  child: Text("Log In", style: TextStyle(fontSize: 19)),
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(112)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BottomNavigation()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}
