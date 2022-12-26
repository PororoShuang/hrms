import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/Training/View/trainingCertificate.dart';
import 'package:hrms/src/Training/View/trainingProgram.dart';


class Training extends StatefulWidget{
  const Training({super.key});
  @override
  State<Training> createState() => _Training();
}

class _Training extends State<Training>
    with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState(){
    super.initState();
    controller=TabController(length: 2, vsync: this);
  }

  @override
  void dispose(){
    controller.dispose();

    super.dispose();}


  @override
  Widget build(BuildContext context)=> Scaffold(
    appBar: AppBar(
      title: Text('Training'),
      backgroundColor: Colors.blueGrey[900],
      centerTitle:true,
      automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); },),
      bottom: TabBar(
        controller: controller,
        tabs: [
          Tab(text:'Program'),
          Tab(text:'Certificate'),
        ],
      ),
    ),
    body: TabBarView(
      controller: controller,
      children: [
        TrainingProgram(),
        TrainingCertificate(),
      ],
    ),

  );

}