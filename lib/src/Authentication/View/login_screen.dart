// import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Controller/deviceUUID.dart';
import 'package:hrms/src/AccountManagement/View/account.dart';
import 'package:hrms/src/home.dart';
import 'package:hrms/src/navBar.dart';
import '../Widget/staffID_field.dart';
import '../Widget/forgot_password_button.dart';
import '../Widget/login_button.dart';
import '../Widget/password_field.dart';
import 'loading_screen.dart';
import 'package:hrms/src/AccountManagement/Controller/AccountAPI.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';

String? currentLoginID, currentLoginPassword;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController idController;
  late TextEditingController passwordController;
  double _elementsOpacity = 1;
  bool loadingBallAppear = false;
  double loadingBallSize = 1;

  //late List<Employee> _userModel = [];

  @override
  void initState() {
    idController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                TweenAnimationBuilder<double>(
                  duration: Duration(milliseconds: 300),
                  tween: Tween(begin: 1, end: _elementsOpacity),
                  builder: (_, value, __) => Opacity(
                    opacity: value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/excalicLogo.png'))),
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Welcome,",
                          style: TextStyle(color: Colors.black, fontSize: 35),
                        ),
                        Text(
                          "Sign in to continue",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.7),
                              fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      StaffIDField(
                          fadeEmail: _elementsOpacity == 0,
                          emailController: idController),
                      SizedBox(height: 40),
                      PasswordField(
                          fadePassword: _elementsOpacity == 0,
                          passwordController: passwordController),
                      ForgotPasswordButton(
                        elementsOpacity: _elementsOpacity,
                        onTap: () {
                          setState(() {
                            _elementsOpacity = 0;
                          });
                        },
                        onAnimatinoEnd: () async {
                          await Future.delayed(Duration(milliseconds: 500));
                          setState(() {
                            loadingBallAppear = true;
                          });
                        },
                      ),
                      SizedBox(height: 20),
                      LoginButton(
                        elementsOpacity: _elementsOpacity,
                        onTap: () async {
                          String? deviceInfo = await GetUniqueId.getDeviceId();
                          currentLoginID = idController.text;
                          currentLoginPassword = passwordController.text;
                          //_userModel = (await ApiService().getUsers())!;

                          (await ApiService().getUsers());

                          if (userModel.getEmployeeId != currentLoginID ||
                              userModel.getAccPass != currentLoginPassword) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Invalid ID or Password')),
                            );
                            setState(() {
                              _elementsOpacity = 1;
                            });
                          } else {
                            setState(() {
                              print("gotStaffRole ${userModel.staffRole}");
                              _elementsOpacity = 0;

                              if (userModel.getUuid == "") {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Account()));

                              }
                              if (deviceInfo == userModel.getUuid) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Welcome ${userModel.employeeName}')),
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomNavigation(
                                            staffRole: userModel.staffRole)));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'Do Not Use Others Device to Login!'),
                                  ),
                                );
                                setState(() {
                                  _elementsOpacity = 1;
                                });
                             }
                            });
                          }

                          // setState(() {
                          //   _elementsOpacity = 0;
                          // });
                        },
                        onAnimatinoEnd: () async {
                          await Future.delayed(Duration(milliseconds: 500));
                          setState(() {
                            loadingBallAppear = true;
                          });
                        },
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
