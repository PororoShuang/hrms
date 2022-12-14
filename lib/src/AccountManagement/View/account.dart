import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../Authentication/View/login_screen.dart';
import 'accountChangePassword.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import '../../AccountManagement/Controller/testAPI.dart';

class Account extends StatefulWidget {
  const Account({super.key});
  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account> {
  late List<Employee>? _userModel = []; //
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    //_userModel = (await ApiService().getUsers());
    _userModel = (await ApiService().getUsers())!;

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  } //

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  bool _isEnableEmail = false;
  bool _isEnablePhoneNo = false;
  bool _isEnableAddress = false;
  Employee model = new Employee();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: Text('Account'),
            backgroundColor: Colors.blueGrey[900],
            centerTitle: true,
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.logout_rounded),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              )
            ]),
        body: _userModel == null || _userModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(children: <Widget>[
                  SizedBox(height: 5),
                  imageProfile(),
                  Text('Name'),
                  Text('Supervisor:'),
                  Align(
                      alignment: Alignment(-0.8, 1.2),
                      child: Text('Email',
                          style: TextStyle(height: 2, fontSize: 20))),
                  Row(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        width: 300,
                        child: TextField(
                          controller: emailController,
                          enabled: _isEnableEmail,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                            //labelText: _userModel![0].getEmail,
                            labelText: "Email",
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              _isEnableEmail = true;
                            });
                          })
                    ],
                  ),
                  Align(
                      alignment: Alignment(-0.8, 1.2),
                      child: Text('Phone Number',
                          style: TextStyle(height: 2, fontSize: 20))),
                  Row(
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        width: 300,
                        child: TextField(
                          controller: phoneNoController,
                          enabled: _isEnablePhoneNo,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                            labelText: _userModel![0].phoneNo.toString(),
                          ),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            setState(() {
                              _isEnablePhoneNo = true;
                            });
                          })
                    ],
                  ),
                  // Align(
                  //     alignment: Alignment(-0.8, 1.2),
                  //     child:
                  //         Text('Address', style: TextStyle(height: 2, fontSize: 20))),
                  // Row(
                  //   children: <Widget>[
                  //     Container(
                  //       padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  //       width: 300,
                  //       child: TextField(
                  //         controller: _controller,
                  //         enabled: _isEnableAddress,
                  //         decoration: InputDecoration(
                  //           border: OutlineInputBorder(
                  //               borderSide: BorderSide(
                  //             color: Colors.teal,
                  //           )),
                  //           labelText: "Address",
                  //         ),
                  //       ),
                  //     ),
                  //     IconButton(
                  //         icon: Icon(Icons.edit),
                  //         onPressed: () {
                  //           setState(() {
                  //             _isEnableAddress = true;
                  //           });
                  //         })
                  //   ],
                  // ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 55,
                    width: 300,
                    child: TextButton(
                      child: Text("Change Password",
                          style: TextStyle(fontSize: 19)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(112)),
                      ),
                      onPressed: () {
                        model.setEmail = emailController.text;
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const ChangePassword()));
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                ]),
              ),
      );
}

Widget imageProfile() {
  return Center(
    child: Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 40.4,
          backgroundColor: Colors.grey,
        ),
      ],
    ),
  );
}
