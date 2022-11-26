import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

enum GenderType{Male,Female}

class SignUp extends StatefulWidget{
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUp();
}
class _SignUp extends State<SignUp>{
  List<String> itemsNationality = ['Select a Nationality','Item 1','Item 2','Item 3','Item 4'];
  String? selectedItemNationality='Select a Nationality';

  List<String> itemsSupervisor = ['Select a Supervisor','Item 1','Item 2','Item 3','Item 4'];
  String? selectedItemSupervisor='Select a Supervisor';

  GenderType?_genderType;

  @override
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(
      title: Text('Registration From'),
      centerTitle:true,
      automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
        onPressed: () {
        Navigator.pop(context); },),
    ),
    body : Scrollbar(
      child: SingleChildScrollView(
          child: Column (
            children: <Widget>[
              Column(children:[
              imageProfile(),
           ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
              decoration: InputDecoration(
              border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
              )),
                  labelText:"Full Name"
  ),
  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"NRIC No"
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"Passport No (Non-Citizen Only)"
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"Date of Birth"
                    ),
                  )
              ),
              Row(
                children:[
                  Text("Gender"),
                  Expanded(
                    flex:1,
                    child: RadioListTile<GenderType>(
                      contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        value: GenderType.Male,
                        groupValue: _genderType,
                        title: Text(GenderType.Male.name),
                        onChanged: (val){
                          setState(() {
                            _genderType=val;
                          });
                        }),
                  ),
                  Expanded(
                    flex:1,
                    child: RadioListTile<GenderType>(
                        contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                        value: GenderType.Female,
                        groupValue: _genderType,
                        title: Text(GenderType.Female.name),
                        onChanged: (val){
                          setState(() {
                            _genderType=val;
                          });
                        }),
                  ),
                ],
                ),
              Container(
                  child:  Text('Nationality', style: TextStyle(height:5,fontSize:20,))),
                   SizedBox(
                     width:350,
                     child: DropdownButtonFormField<String>(
                       decoration:InputDecoration(
                       border: OutlineInputBorder(),
                   ),
                    value:selectedItemNationality,items:itemsNationality
                    .map((item)=> DropdownMenuItem<String>(
                    value:item,
                   child:Text(item,style:TextStyle(fontSize:19,fontStyle: FontStyle.italic)),
        ))
            .toList(),
          onChanged:(item)=>setState(()=> selectedItemNationality=item),
        ),
      ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"Phone Number"
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"Email Address"
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"EPF No"
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"SOSCO No"
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"I-Tax No"
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"Bank Name"
                    ),
                  )
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        labelText:"Bank Account"
                    ),
                  )
              ),
            ],
          ),
      ),
    ),
  );
}

Widget imageProfile(){
return Center(
  child: Stack(children: <Widget>[
    CircleAvatar(
      radius: 80.8,
      backgroundColor: Colors.grey,
    ),
    Positioned(
      bottom: 20.8,
      right: 20.0,
      child: InkWell(
        onTap: (){},
        child: Icon(
          Icons.camera_alt,
          color: Colors.teal,
          size: 38.0,
        ),
      )
    )
  ],),
);

}
