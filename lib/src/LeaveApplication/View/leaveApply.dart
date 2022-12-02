import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeave();
}

class _ApplyLeave extends State<ApplyLeave> {
  List<String> itemsType = [
    'Select a type',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4'
  ];
  String? selectedItemType = 'Select a type';

  DateTime date = DateTime(2022, 12, 2);
  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);

  @override
  Widget build(BuildContext context){
    final hours = time.hour.toString().padLeft(2,'0');
    final minutes = time.minute.toString().padLeft(2,'0');

    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Leave'),
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                  children: [
                    Text('Date From : ',
                        style: TextStyle(
                            height: 2, fontSize: 20, color: Colors.black)),
                    Text(
                      '${date.year}/${date.month}/${date.day}',
                      style: TextStyle(
                          height: 2, fontSize: 20, color: Colors.black),
                    ),
                    IconButton(
                      icon: const Icon(Icons.date_range),
                      color: Colors.green,
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        //if 'Cancel' return null
                        if (newDate == null) return;
                        //if 'ok' date time
                        setState(() {
                          date = newDate;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                  children: [
                    Text('Date To : ',
                        style: TextStyle(
                            height: 2, fontSize: 20, color: Colors.black)),
                    Text(
                      '${date.year}/${date.month}/${date.day}',
                      style: TextStyle(
                          height: 2, fontSize: 20, color: Colors.black),
                    ),
                    IconButton(
                      icon: const Icon(Icons.date_range),
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        //if 'Cancel' return null
                        if (newDate == null) return;
                        //if 'ok' date time
                        setState(() {
                          date = newDate;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                child: Row(
                  children: [
                    Text('Leave Type :',
                        style: TextStyle(
                          height: 2,
                          fontSize: 20,
                        )),
                    SizedBox(
                      width: 230,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: selectedItemType,
                        items: itemsType
                            .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item,
                              style: TextStyle(
                                  fontSize: 19,
                                  fontStyle: FontStyle.italic)),
                        ))
                            .toList(),
                        onChanged: (item) =>
                            setState(() => selectedItemType = item),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 2),
                child: Row(
                  children: [
                    Text('Reasons : ',
                        style: TextStyle(
                          height: 1,
                          fontSize: 20,
                        )),
                    SizedBox(
                        width: 250,
                        child: TextFormField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.teal,
                                )),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                  children: [
                    Text('Start Time : ',
                        style: TextStyle(
                            height: 2, fontSize: 20, color: Colors.black)),
                    Text('$hours:$minutes', style: TextStyle(
                        height: 2, fontSize: 20, color: Colors.black)),
                    IconButton(
                      icon: const Icon(Icons.access_time_filled_sharp),
                      color: Colors.green,
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: time,

                        );
                        //if 'Cancel' return null
                        if (newTime == null) return;
                        //if 'ok' date time
                        setState(() {
                          time = newTime;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                  children: [
                    Text('End Time : ',
                        style: TextStyle(
                            height: 2, fontSize: 20, color: Colors.black)),
                    Text('$hours:$minutes', style: TextStyle(
                        height: 2, fontSize: 20, color: Colors.black)),
                    IconButton(
                      icon: const Icon(Icons.access_time_filled_sharp),
                      color: Colors.black,
                      onPressed: () async {
                        TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: time,

                        );
                        //if 'Cancel' return null
                        if (newTime == null) return;
                        //if 'ok' date time
                        setState(() {
                          time = newTime;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Row(
                  children: [
                    Text('Date Submitted : ',
                        style: TextStyle(
                            height: 2, fontSize: 20, color: Colors.black)),
                    Text(
                      '${date.year}/${date.month}/${date.day}',
                      style: TextStyle(
                          height: 2, fontSize: 20, color: Colors.black),
                    ),
                    IconButton(
                      icon: const Icon(Icons.date_range),
                      color: Colors.black,
                      onPressed: () async {
                        DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        //if 'Cancel' return null
                        if (newDate == null) return;
                        //if 'ok' date time
                        setState(() {
                          date = newDate;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              SizedBox(
                height: 55,
                width: 300,
                child:TextButton(
                  child:Text("Submit",style:TextStyle(fontSize: 19)),
                  style: TextButton.styleFrom(
                    backgroundColor:Theme.of(context).primaryColor,
                    foregroundColor:Colors.white,
                    shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                  ), onPressed: () { },
                ),
              ),
            ],
          )
        ],
      ),
    );

  }
}
