import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/View/verifyEmail.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Forgot Password'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Align(
              alignment: Alignment(-0.8, 1.2),
              child: Text('Email',
                  style: TextStyle(
                    height: 5,
                    fontSize: 20,
                  )),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your Email',
                  hintStyle:
                      TextStyle(fontSize: 19, fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 260),
            SizedBox(
              height: 55,
              width: 300,
              child: TextButton(
                child: Text("Send", style: TextStyle(fontSize: 19)),
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(112)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VerifyEmail()),
                  );
                },
              ),
            ),
          ],
        ),
      );
}
