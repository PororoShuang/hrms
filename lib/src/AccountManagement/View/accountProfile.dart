import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum GenderType { Male, Female }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _Profile();
}

class _Profile extends State<Profile> {
  List<String> itemsNationality = [
    'Select a Nationality',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4'
  ];
  String? selectedItemNationality = 'Select a Nationality';
  List<String> itemsReligion = [
    'Select a Religion',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4'
  ];
  String? selectedItemReligion = 'Select a Religion';
  GenderType? _genderType;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/logoProfile.png'))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Align(
                  alignment: Alignment(-0.8, 1.2),
                  child: Text('Gender',
                      style: TextStyle(
                          height: 2, fontSize: 20, color: Colors.black45)),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: RadioListTile<GenderType>(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          value: GenderType.Male,
                          groupValue: _genderType,
                          title: Text(GenderType.Male.name),
                          onChanged: (val) {
                            setState(() {
                              _genderType = val;
                            });
                          }),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile<GenderType>(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          value: GenderType.Female,
                          groupValue: _genderType,
                          title: Text(GenderType.Female.name),
                          onChanged: (val) {
                            setState(() {
                              _genderType = val;
                            });
                          }),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "NRIC No"),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "Email Address"),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "Date of Birth"),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "Phone Number"),
                    )),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: SizedBox(
                    width: 250,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      value: selectedItemNationality,
                      items: itemsNationality
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black45)),
                              ))
                          .toList(),
                      onChanged: (item) =>
                          setState(() => selectedItemNationality = item),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: SizedBox(
                    width: 250,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      value: selectedItemReligion,
                      items: itemsReligion
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(item,
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.black45)),
                              ))
                          .toList(),
                      onChanged: (item) =>
                          setState(() => selectedItemReligion = item),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: SizedBox(
                    height: 55,
                    width: 300,
                    child:TextButton(
                      child:Text("Save",style:TextStyle(fontSize: 19)),
                      style: TextButton.styleFrom(
                        backgroundColor:Colors.indigo[900],
                        foregroundColor:Colors.white,
                        shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                      ), onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      );
}
