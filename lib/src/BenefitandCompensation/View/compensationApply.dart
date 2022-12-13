import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplyClaims extends StatefulWidget {
  const ApplyClaims({super.key});

  @override
  State<ApplyClaims> createState() => _ApplyClaims();
}

class _ApplyClaims extends State<ApplyClaims> {
  List<String> items = [
    'Select a expenses',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4'
  ];
  String? selectedItem = 'Select a expenses';

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Align(
                  alignment: Alignment(-0.65, 1.2),
                  child: Text('Category of expenses',
                      style: TextStyle(
                        height: 3,
                        fontSize: 20,
                      ))),
              SizedBox(
                width: 350,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: selectedItem,
                  items: items
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                        style: TextStyle(
                            fontSize: 19,
                            fontStyle: FontStyle.italic)),
                  ))
                      .toList(),
                  onChanged: (item) => setState(() => selectedItem = item),
                ),
              ),
            ],
          ),
          Align(
              alignment: Alignment(-0.8, 1.2),
              child: Text('Purpose',
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
                  ))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Align(
              alignment: Alignment(-0.8, 1.2),
              child: Text('Amount',
                  style: TextStyle(
                    height: 2,
                    fontSize: 20,
                  ))),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              Container(
                child: const Padding(
                  padding: EdgeInsets.all(38.0), child: Text('Upload Receipt',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                ),
              ),
              Container(
                child:IconButton(
                  icon: const Icon(Icons.upload_rounded),
                  onPressed: () {
                    setState(() {
                    });
                  },

                ),

              ),
            ],

          ),

          SizedBox(height: 30),
          SizedBox(
            height: 55,
            width: 300,
            child:TextButton(
              child:Text("Submit",style:TextStyle(fontSize: 19)),
              style: TextButton.styleFrom(
                backgroundColor:Colors.indigo[900],
                foregroundColor:Colors.white,
                shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
              ), onPressed: () {},
            ),
          ),
        ],
      ),
    ),
  );
}
