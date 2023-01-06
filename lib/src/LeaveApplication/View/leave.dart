import 'package:flutter/material.dart';

import 'leaveApply.dart';
import 'leaveStatus.dart';

class Leave extends StatefulWidget {
  const Leave({super.key});

  @override
  State<Leave> createState() => _Leave();
}

class _Leave extends State<Leave> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave'),
        backgroundColor: Colors.blueGrey[900],
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
          Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 80),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ApplyLeave()));
                          },
                          child: Card(
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.blueGrey.shade900),
                                borderRadius: BorderRadius.circular(15.0),),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Image.asset(
                                    "assets/applyIcon.png",
                                  )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 100, 0),
                                      child: Text('Apply Leave',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,fontSize: 18,)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LeaveStatus()));
                          },
                          child: Card(
                            child: Container(
                              height: 100,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: Colors.blueGrey.shade900),
                                borderRadius: BorderRadius.circular(15.0),),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Image.asset(
                                        "assets/viewIcon.png",
                                      )),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 20, 0),
                                      child: Text('View Leaves Status',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,fontSize: 18,)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
