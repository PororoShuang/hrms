import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import '../Controller/AccountAPI.dart';

class CallEmpAPI extends StatefulWidget {
  const CallEmpAPI({Key? key}) : super(key: key);

  @override
  _callEmpAPIState createState() => _callEmpAPIState();
}

class _callEmpAPIState extends State<CallEmpAPI> {
  //late List<Employee>? _userModel = [];
  //late String? _userModel = "";
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              // itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![0].email.toString()),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
