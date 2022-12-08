import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/Training/View/trainingUploadCertificate.dart';


class TrainingCertificate extends StatefulWidget{
  const TrainingCertificate({super.key});
  @override
  State<TrainingCertificate> createState() => _TrainingCertificate();
}

class _TrainingCertificate extends State<TrainingCertificate> {
  @override
  Widget build(BuildContext context)=> Scaffold(
      body: Column(
          children:[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.00),
                child: Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const ListTile(
                          title: Text('Technical Training'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('View Certificate'),
                              onPressed: () {
                               // showAlertDialog(context);
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton(
                              child: const Text('Upload Certificate'),
                              onPressed: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => const TrainingUploadCertificate()),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(10.00),
            child: Center(
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      title: Text('Training'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('View Certificate'),
                          onPressed: () {
                            // showAlertDialog(context);
                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Upload Certificate'),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TrainingUploadCertificate()));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]));
}