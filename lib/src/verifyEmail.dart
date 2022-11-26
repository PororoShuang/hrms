import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'createNewPassword.dart';


class VerifyEmail extends StatefulWidget{
  const VerifyEmail({super.key});
  @override
  State<VerifyEmail> createState() => _VerifyEmail();
}
class _VerifyEmail extends State<VerifyEmail>{
  @override
  Widget build(BuildContext context)=>Scaffold(
  appBar: AppBar(
  title: Text('Verify Your Email'),
  centerTitle:true,
  automaticallyImplyLeading: true,
  leading: IconButton(icon:Icon(Icons.arrow_back),
  onPressed: () {
    Navigator.pop(context);},),
  ),
    body: Column(
          children:<Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //padding
              children:[
            SizedBox(height:360),
            SizedBox(
              height: 64,
              width:60,
              child:AspectRatio(
                aspectRatio: 3/2,
                child: TextFormField(
                  onChanged: (value){
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  style:Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign:TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      counter: Offstage(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color:Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      )
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 64,
              width:60,
              child:AspectRatio(
                aspectRatio: 0.7,
                child: TextFormField(
                  onChanged: (value){
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  style:Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign:TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      counter: Offstage(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color:Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      )
                  ),
                ),
              ),

            ),
            SizedBox(
              height: 64,
              width:60,
              child:AspectRatio(
                aspectRatio: 0.7,
                child: TextFormField(
                  onChanged: (value){
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  style:Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign:TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      counter: Offstage(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color:Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      )
                  ),
                ),
              ),

            ),
            SizedBox(
              height: 64,
              width:60,
              child:AspectRatio(
                aspectRatio: 0.7,
                child: TextFormField(
                  onChanged: (value){
                    if(value.length==1){
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  style:Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  textAlign:TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                      counter: Offstage(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2,color:Colors.black12),
                        borderRadius: BorderRadius.circular(12),
                      )
                  ),
                ),
              ),
            ),
            ],
            ),
            SizedBox(height: 30),
            SizedBox(
              height: 55,
              child: Text(
                "Resend Code",
                    style:TextStyle(
                  fontSize:18,
                fontWeight: FontWeight.bold,
                color:Colors.black,
              ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 55,
              width: 300,
              child:TextButton(
                child:Text("Verify",style:TextStyle(fontSize: 19)),
                style: TextButton.styleFrom(
                  backgroundColor:Theme.of(context).primaryColor,
                  foregroundColor:Colors.white,
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(112)),
                ), onPressed: () {  Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CreateNewPassword()),);},
              ),
            ),
          ],
    ),
  );
}