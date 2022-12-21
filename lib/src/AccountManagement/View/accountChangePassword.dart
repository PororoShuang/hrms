import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Controller/AccountAPI.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});
  @override
  State<ChangePassword> createState() => _ChangePassword();
}

class _ChangePassword extends State<ChangePassword> {
  bool _obscureText = true;
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Change Password'),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Align(
                alignment: Alignment(-0.75, 1.2),
                child: Text('Current Password',
                    style: TextStyle(height: 2, fontSize: 20))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextField(
                controller: currentPassController,
                decoration: InputDecoration(
                  hintText: 'Enter current Password',
                  hintStyle:
                      TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                obscureText: _obscureText,
              ),
            ),
            Align(
                alignment: Alignment(-0.75, 1.2),
                child: Text('Change Password',
                    style: TextStyle(height: 2, fontSize: 20))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextField(
                controller: newPassController,
                decoration: InputDecoration(
                  hintText: 'Enter new Password',
                  hintStyle:
                      TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                obscureText: _obscureText,
              ),
            ),
            Align(
                alignment: Alignment(-0.7, 1.2),
                child: Text('Confirmed Password',
                    style: TextStyle(height: 2, fontSize: 20))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextField(
                controller: confirmPassController,
                decoration: InputDecoration(
                  hintText: 'Enter new Password again',
                  hintStyle:
                      TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                obscureText: _obscureText,
              ),
            ),
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
                  if (checkCurrentPassword(currentPassController.text)) {
                    if (newPassController.text == confirmPassController.text) {
                      userModel.setAccPass = newPassController.text;
                      await ApiService().updateUser();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Successfully Change Password')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Confirm password not match with new password')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid Current Password')),
                    );
                  }
                },
              ),
            ),
          ]),
        ),
      );
}
