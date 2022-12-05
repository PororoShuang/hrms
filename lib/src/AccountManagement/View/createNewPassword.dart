import 'package:flutter/material.dart';

import 'login.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});
  @override
  State<CreateNewPassword> createState() => _CreateNewPassword();
}

class _CreateNewPassword extends State<CreateNewPassword> {
  bool _obscureText1 = true;
  bool _obscureText2 = true;
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Create New Password'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 60),
            Align(
                alignment: Alignment(-0.8, 1.2),
                child: Text('New Password',
                    style: TextStyle(height: 2, fontSize: 20))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter 8 digit new password',
                  hintStyle:
                      TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText1 = !_obscureText1;
                      });
                    },
                    child: Icon(_obscureText1
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                obscureText: _obscureText1,
              ),
            ),
            Align(
                alignment: Alignment(-0.8, 1.2),
                child: Text('Confirm Password',
                    style: TextStyle(height: 2, fontSize: 20))),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter new password again',
                  hintStyle:
                      TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText2 = !_obscureText2;
                      });
                    },
                    child: Icon(_obscureText2
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                ),
                obscureText: _obscureText2,
              ),
            ),
            SizedBox(height: 150),
            SizedBox(
              height: 55,
              width: 300,
              child: TextButton(
                child: Text("Save", style: TextStyle(fontSize: 19)),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(112)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
              ),
            ),
          ],
        ),
      );
}
