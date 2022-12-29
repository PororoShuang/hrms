import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/Model/employee.dart';
import 'package:hrms/src/AccountManagement/View/account.dart';
import 'package:image/image.dart';
import '../../navBar.dart';
import '../Controller/AccountAPI.dart';
import 'package:hrms/src/AccountManagement/Controller/deviceUUID.dart';

enum GenderType { Male, Female }

//Employee employee = new Employee();

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  String countryValue = " ";
  final icController = TextEditingController();
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

  List<String> dobList = [];
  DateTime dateOfBirth = DateTime.now();
  String? dateOfBirthString;
  String? formattedDob;
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
      body: (userModel.getUuid == "")
          ? Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: Form(
                key: _formKey,
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
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
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
                                      image: AssetImage(
                                          'assets/logoProfile.png'))),
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
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
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
                                height: 2,
                                fontSize: 20,
                                color: Colors.black45)),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: RadioListTile<GenderType>(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
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
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
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
                        visible: _isVisible,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          child: Text(
                            "Please select gender!",
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                      ),
                      Visibility(
                        // visible: _isVisible,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 5),
                            child: TextFormField(
                              controller: icController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                    color: Colors.teal,
                                  )),
                                  labelText: "NRIC No"),
                              validator: Employee.validateIC(icController.text),
                            )),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.teal,
                                )),
                                labelText: "Email Address"),
                            validator:
                                Employee.validateEmail(emailController.text),
                          )),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('Date Of Birth : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              '${dateOfBirth.year}/${dateOfBirth.month}/${dateOfBirth.day}',
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                            IconButton(
                              icon: const Icon(Icons.date_range),
                              onPressed: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: dateOfBirth,
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100),
                                );
                                //if 'Cancel' return null
                                if (newDate == null) return;
                                //if 'ok' date time
                                setState(() {
                                  dateOfBirth = newDate;

                                  dateOfBirthString =
                                      dateOfBirth.year.toString() +
                                          "-" +
                                          dateOfBirth.month
                                              .toString()
                                              .padLeft(2, "0") +
                                          "-" +
                                          dateOfBirth.day
                                              .toString()
                                              .padLeft(2, "0");
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                          child: TextFormField(
                            controller: phoneController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.teal,
                                )),
                                labelText: "Phone Number"),
                            validator: Employee.validatePhoneNumber(
                                phoneController.text),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                                      color: Colors.black45, width: 1)),

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
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        child: SizedBox(
                          height: 55,
                          width: 300,
                          child: TextButton(
                              child:
                                  Text("Save", style: TextStyle(fontSize: 19)),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.indigo[900],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(112)),
                              ),
                              onPressed: () {
                                if (_genderType == null) {
                                  setState(() {
                                    _isVisible = true;
                                  });
                                } else {
                                  setState(() {
                                    _isVisible = false;
                                  });
                                }
                                if (_formKey.currentState!.validate()) {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text(
                                          'Update Profile Infomation'),
                                      content: const Text(
                                          'Are you confirm want to update profile infomation?\nYou can only update once'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                            onPressed: () async {
                                              // If the form is valid, display a snackbar. In the real world,
                                              // you'd often call a server or save the information in a database.
                                              String gender = _genderType
                                                  .toString()
                                                  .substring(11);
                                              userModel.setGender = gender;
                                              userModel.setIcNo =
                                                  icController.text;
                                              userModel.setPhoneNo =
                                                  phoneController.text;
                                              userModel.setEmail =
                                                  emailController.text;
                                              userModel.setNationality =
                                                  countryValue;
                                              userModel.setReligion =
                                                  selectedItemReligion;
                                              userModel.setDob =
                                                  "${dateOfBirthString}T00:00:00";
                                              userModel.setUuid =
                                                  await GetUniqueId
                                                      .getDeviceId();
                                              await ApiService().updateUser();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      'Update Successfully'),
                                                ),
                                              );
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Account()));
                                              //return;
                                            },
                                            child: const Text('Confirm')),
                                      ],
                                    ),
                                  );
                                }
                              }),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            )
/////////////////////////////////////////////////////////
          : Container(
              padding: EdgeInsets.only(left: 16, top: 25, right: 16),
              child: Form(
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
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
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
                                      image: AssetImage(
                                          'assets/logoProfile.png'))),
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
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
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
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('Gender : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getGender,
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('NRIC : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getIcNo,
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('Email : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getEmail,
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('Date Of Birth : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              splitDoB(userModel.getDob),
                              // '${dateOfBirth.year}/${dateOfBirth.month}/${dateOfBirth.day}',
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('Phone Number : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getPhoneNo,
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('Nationality : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getNationality,
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 1),
                        child: Row(
                          children: [
                            Text('Religion : ',
                                style: TextStyle(
                                    height: 1,
                                    fontSize: 18,
                                    color: Colors.black45)),
                            Text(
                              userModel.getReligion,
                              style: TextStyle(
                                  height: 1, fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ));
}
