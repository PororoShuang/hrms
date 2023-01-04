import 'package:flutter/material.dart';
import 'package:hrms/src/BenefitandCompensation/View/benefit.dart';
import 'compensationApply.dart';
import 'compensationStatus.dart';


class Compensation extends StatefulWidget {
  const Compensation({super.key});
  @override
  State<Compensation> createState() => _Compensation();
}

class _Compensation extends State<Compensation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Benefit And Compensation'),
        backgroundColor: Colors.blueGrey[900],
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
                      MaterialPageRoute(builder: (context) => const ApplyClaims()));},
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children:[
                        ListTile(
                          title: Text('Apply Compensation Claims'),),
                      ],
                    ),),
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const CompensationStatus()));},
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            ListTile(
                              title: Text('View Compensation Status'),),
                          ],
                        ),),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Column(
                  children: [
                    GestureDetector(
                      onTap:(){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Benefit()));},
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:[
                            ListTile(
                              title: Text('View Benefit'),),
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



