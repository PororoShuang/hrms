import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Login.dart';
import 'accountChangePassword.dart';


class Account extends StatefulWidget{
  const Account({super.key});
  @override
  State<Account> createState() => _Account();
}

class _Account extends State<Account> {
  TextEditingController _controller = TextEditingController();

  bool _isEnableEmail = false;
  bool _isEnablePhoneNo = false;
  bool _isEnableAddress = false;

  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
        title: Text('Account'),
        centerTitle:true,
        automaticallyImplyLeading: false,
        actions:<Widget>[
          IconButton(
            icon: Icon(Icons.logout_rounded),
            onPressed: (){Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Login()));
            },)
        ]
    ),
    body: SingleChildScrollView(
      child: Column(
          children:<Widget>[
            imageProfile(),
            Text('Name'),
            Text('Supervisor:'),
            Align(alignment: Alignment(-0.8,1.2),
                child:  Text('Email' ,style: TextStyle(height:2,fontSize:20))),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  width: 350,
                  child: TextField(
                    controller: _controller,
                    enabled: _isEnableEmail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                      labelText:"Email",
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        _isEnableEmail = true;
                      });
                    })
              ],
            ),
            Align(alignment: Alignment(-0.8,1.2),
                child:  Text('Phone Number' ,style: TextStyle(height:2,fontSize:20))),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  width: 350,
                  child: TextField(
                    controller: _controller,
                    enabled: _isEnablePhoneNo,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                      labelText:"Phone Number",
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        _isEnablePhoneNo = true;
                      });
                    })
              ],
            ),
            Align(alignment: Alignment(-0.8,1.2),
                child:  Text('Address' ,style: TextStyle(height:2,fontSize:20))),
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  width: 350,
                  child: TextField(
                    controller: _controller,
                    enabled: _isEnableAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.teal,
                          )),
                      labelText:"Address",
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      setState(() {
                        _isEnableAddress = true;
                      });
                    })
              ],
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 55,
              width: 300,
              child:TextButton(
                child:Text("Change Password",style:TextStyle(fontSize: 19)),
                style: TextButton.styleFrom(
                  backgroundColor:Theme.of(context).primaryColor,
                  foregroundColor:Colors.white,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                ), onPressed: () {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ChangePassword()));},
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 55,
              width: 300,
              child:TextButton(
                child:Text("Save",style:TextStyle(fontSize: 19)),
                style: TextButton.styleFrom(
                  backgroundColor:Theme.of(context).primaryColor,
                  foregroundColor:Colors.white,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                ), onPressed: () {},
              ),
            ),
          ]
      ),
    ),
  );
}

Widget imageProfile(){
  return Center(
    child: Stack(children: <Widget>[
      CircleAvatar(
        radius: 40.4,
        backgroundColor: Colors.grey,
      ),
    ],),
  );

}