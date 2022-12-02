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
        centerTitle:true,
        automaticallyImplyLeading: true,
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); },),
      ),
      body: Column(
        children:<Widget>[
          Column(children: [
            SizedBox(height: 20),
            Column(
              children: [
                 GestureDetector(
                    onTap:(){Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const ApplyLeave()));},
                    child: Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children:[
                          ListTile(
                            title: Text('Apply Leaves'),),
                        ],
                      ),),
                  ),
                SizedBox(height: 20),
                Column(
                  children: [
                    GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LeaveStatus()));},
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            ListTile(
                              title: Text('View Leaves Status'),),
                          ],
                        ),),
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



