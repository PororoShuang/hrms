import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AttendanceRegistration extends StatefulWidget{
  const AttendanceRegistration({super.key});
  @override
  State<AttendanceRegistration> createState() => _AttendanceRegistration();
}

class _AttendanceRegistration extends State<AttendanceRegistration> {
  List<String> itemsShift = ['Select a shift','Item 1','Item 2','Item 3','Item 4'];
  String? selectedItemShift='Select a shift';

  List<String> items = ['Select a method','Item 1','Item 2','Item 3','Item 4'];
  String? selectedItem='Select a method';

    @override
    Widget build(BuildContext context)=> Scaffold(
      body: SingleChildScrollView(
        child: Column(
            children:<Widget>[
              Column(children: [
                Align(alignment: Alignment(-0.8,1.2),
                    child:  Text('Select Shift', style: TextStyle(height:5,fontSize:20,))),
                SizedBox(
                  width:350,
                  child: DropdownButtonFormField<String>(
                    decoration:InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    value:selectedItemShift,items:itemsShift
                      .map((item)=> DropdownMenuItem<String>(
                    value:item,
                    child:Text(item,style:TextStyle(fontSize:19,fontStyle: FontStyle.italic)),
                  ))
                      .toList(),
                    onChanged:(item)=>setState(()=> selectedItemShift=item),
                  ),
                ),
                Align(alignment: Alignment(-0.6,1.2),
                    child:  Text('Select Check In/Out Method', style: TextStyle(height:3,fontSize:20,))),
                SizedBox(
                  width:350,
                  child: DropdownButtonFormField<String>(
                    decoration:InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    value:selectedItem,items:items
                      .map((item)=> DropdownMenuItem<String>(
                    value:item,
                    child:Text(item,style:TextStyle(fontSize:19,fontStyle: FontStyle.italic)),
                  ))
                      .toList(),
                    onChanged:(item)=>setState(()=> selectedItem=item),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Expanded(
                      flex:2,
                        child:  SizedBox(
                          height: 55,
                          width: 300,
                          child:TextButton(
                            child:Text("Check In",style:TextStyle(fontSize: 19)),
                            style: TextButton.styleFrom(
                              backgroundColor:Colors.green,
                              foregroundColor:Colors.white,
                              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                            ), onPressed: () {},
                          ),
                        ),
                    ),
                    Expanded(
                      flex:2,
                        child: SizedBox(
                          height: 55,
                          width: 300,
                          child:TextButton(
                            child:Text("Check Out",style:TextStyle(fontSize: 19)),
                            style: TextButton.styleFrom(
                              backgroundColor:Colors.red,
                              foregroundColor:Colors.white,
                              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                            ), onPressed: () {},
                          ),
                        ),
                    ),
                  ],
                )
              ],)
            ]
        ),
      ),
    );

}