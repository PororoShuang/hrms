import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/AccountManagement/View/login.dart';
import 'package:csc_picker/csc_picker.dart';

enum GenderType { Male, Female }

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  String countryValue = " ";
  TextEditingController nameController = TextEditingController();
  // List<String> itemsNationality = [
  //   'Select a Nationality',
  //   'Item 1',
  //   'Item 2',
  //   'Item 3',
  //   'Item 4'
  // ];
  String? selectedItemNationality = 'Select a Nationality';

  List<String> itemsSupervisor = [
    'Select a Supervisor Name',
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4'
  ];
  String? selectedItemSupervisor = 'Select a Supervisor Name';

  GenderType? _genderType;
  bool value = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Registration From'),
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  children: [
                    imageProfile(),
                  ],
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "Full Name"),
                    )),
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
                          labelText: "Passport No (Non-Citizen Only)"),
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
                  child: SizedBox(
                    width: 350,
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
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),

                        ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                        disabledDropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.grey.shade300,
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1)),

                        ///placeholders for dropdown search field
                        countrySearchPlaceholder: "Country",

                        ///labels for dropdown
                        countryDropdownLabel: countryValue,

                        ///Default Country
                        defaultCountry: DefaultCountry.Malaysia,

                        ///Disable country dropdown (Note: use it with default country)
                        //disableCountry: true,

                        ///selected item style [OPTIONAL PARAMETER]
                        selectedItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),

                        ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                        dropdownHeadingStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),

                        ///DropdownDialog Item style [OPTIONAL PARAMETER]
                        dropdownItemStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),

                        ///Dialog box radius [OPTIONAL PARAMETER]
                        dropdownDialogRadius: 10.0,

                        ///Search bar radius [OPTIONAL PARAMETER]
                        searchBarRadius: 10.0,

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
                          labelText: "EPF No"),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "SOSCO No"),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "I-Tax No"),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "Bank Name"),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                          labelText: "Bank Account"),
                    )),
                Container(
                  child: SizedBox(
                    width: 350,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      value: selectedItemSupervisor,
                      items: itemsSupervisor
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
                          setState(() => selectedItemSupervisor = item),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: buildCheckBox(),
                ),
                Container(
                  child: buildCheckBox2(),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 55,
                  width: 300,
                  child: TextButton(
                    child: Text("Submit", style: TextStyle(fontSize: 19)),
                    style: TextButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(112)),
                    ),
                    onPressed: () {
                      Text(nameController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20)
              ],
            ),
          ),
        ),
      );
  Widget buildCheckBox() => ListTile(
        leading: Checkbox(
          value: value,
          onChanged: (value) {
            setState(() {
              this.value = value!;
            });
          },
        ),
        title: Text(
            ''
            'Hereby declare that all the information that I have provided in this form '
            'is correct, true and complete and I am fully responsible.',
            style: TextStyle(fontSize: 15, color: Colors.black45)),
      );
  Widget buildCheckBox2() => ListTile(
        leading: Checkbox(
          value: value,
          onChanged: (value) {
            setState(() {
              this.value = value!;
            });
          },
        ),
        title: Text(
            ''
            'Terms and Conditions',
            style: TextStyle(fontSize: 15, color: Colors.black45)),
      );
}

Widget imageProfile() {
  return Center(
    child: Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80.8,
          backgroundColor: Colors.grey,
        ),
        Positioned(
            bottom: 20.8,
            right: 20.0,
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 38.0,
              ),
            ))
      ],
    ),
  );
}
