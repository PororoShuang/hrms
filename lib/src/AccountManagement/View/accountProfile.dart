import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Controller/deviceUUID.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import '../Controller/AccountAPI.dart';

enum GenderType { Male, Female }

//Employee employee = new Employee();

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool _isVisible = true;
  String countryValue = " ";

  final icController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Employee emp = Employee();
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
    'Muslim',
    'Non-Muslim',
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
                Visibility(
                  // visible: _isVisible,
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      child: TextFormField(
                        controller: icController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                            labelText: "NRIC No"),
                        //labelText: userModel.icNo),
                      )),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      controller: emailController,
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
                      controller: dateOfBirthController,
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
                      controller: phoneController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "Phone Number"),
                    )),
                // Container(
                //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                //   child: SizedBox(
                //     width: 250,
                //     child: DropdownButtonFormField<String>(
                //       decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //       ),
                //       value: selectedItemNationality,
                //       items: itemsNationality
                //           .map((item) => DropdownMenuItem<String>(
                //                 value: item,
                //                 child: Text(item,
                //                     style: TextStyle(
                //                         fontSize: 19,
                //                         fontStyle: FontStyle.italic,
                //                         color: Colors.black45)),
                //               ))
                //           .toList(),
                //       onChanged: (item) =>
                //           setState(() => selectedItemNationality = item),
                //     ),
                //   ),
                // ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: SizedBox(
                    width: 250,
                    child: Column(children: [
                      ///Adding CSC Picker Widget in app
                      CSCPicker(
                        ///Enable disable state dropdown [OPTIONAL PARAMETER]
                        showStates: false,

                        /// Enable disable city drop down [OPTIONAL PARAMETER]
                        showCities: false,

                        ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                        flagState: CountryFlag.DISABLE,

                        ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)

                        dropdownDecoration: BoxDecoration(
                            //borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            //Padding = 4.0,
                            color: Colors.white70,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),

                        // ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                        // disabledDropdownDecoration: BoxDecoration(
                        //     borderRadius: BorderRadius.all(Radius.circular(10)),
                        //     color: Colors.grey.shade300,
                        //     border: Border.all(
                        //         color: Colors.grey.shade300, width: 1)),

                        ///placeholders for dropdown search field
                        countrySearchPlaceholder: "Country",

                        ///labels for dropdown
                        countryDropdownLabel: countryValue,

                        ///Default Country
                        defaultCountry: DefaultCountry.Malaysia,

                        ///Disable country dropdown (Note: use it with default country)
                        //disableCountry: true,

                        ///selected item style [OPTIONAL PARAMETER]
                        // selectedItemStyle: TextStyle(
                        //   color: Colors.black,
                        //   fontSize: 14,
                        // ),

                        ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                        // dropdownHeadingStyle: TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 17,
                        //     fontWeight: FontWeight.bold),

                        ///DropdownDialog Item style [OPTIONAL PARAMETER]
                        // dropdownItemStyle: TextStyle(
                        //   color: Colors.black,
                        //   fontSize: 14,
                        // ),

                        ///Dialog box radius [OPTIONAL PARAMETER]
                        //dropdownDialogRadius: 10.0,

                        ///Search bar radius [OPTIONAL PARAMETER]
                        //searchBarRadius: 10.0,

                        ///triggers once country selected in dropdown
                        onCountryChanged: (value) {
                          setState(() {
                            ///store value in country variable
                            countryValue = value.toString();
                          });
                        },
                      ),
                    ]
                        // child: DropdownButtonFormField<String>(
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(),
                        //   ),
                        //   value: selectedItemNationality,
                        //   items: itemsNationality
                        //       .map((item) => DropdownMenuItem<String>(
                        //             value: item,
                        //             child: Text(item,
                        //                 style: TextStyle(
                        //                     fontSize: 19,
                        //                     fontStyle: FontStyle.italic,
                        //                     color: Colors.black45)),
                        //           ))
                        //       .toList(),
                        //   onChanged: (item) =>
                        //       setState(() => selectedItemNationality = item),
                        // ),
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
                    child: TextButton(
                      child: Text("Save", style: TextStyle(fontSize: 19)),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.indigo[900],
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(112)),
                      ),
                      onPressed: () async {
                        userModel.setIcNo = icController.text;
                        userModel.setPhoneNo = phoneController.text;
                        userModel.setEmail = emailController.text;
                        userModel.setNationality = countryValue;
                        userModel.setReligion = selectedItemReligion;
                        dateOfBirthController.text =
                            dateOfBirthController.text.replaceAll("/", "-");
                        userModel.setDob =
                            "${dateOfBirthController.text}T00:00:00";
                        //await ApiService().updateUser();
                        showToast();
                      },
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
