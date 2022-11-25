import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:barcode_scan2/gen/protos/protos.pb.dart';
import 'package:flutter/material.dart';

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  var qrResult = "Not yet Scanned";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan"),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "RESULT",
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                qrResult,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                // padding: EdgeInsets.all(15.0),
                child: Text("SCAN QR CODE"),
                onPressed: () async {
                  var scaning = await BarcodeScanner.scan();
                  setState(() {
                    qrResult = scaning.rawContent;
                    //TakeAttendanceCode!
                  });
                },
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20.0)),
              )
            ],
          )),
    );
  }
}
