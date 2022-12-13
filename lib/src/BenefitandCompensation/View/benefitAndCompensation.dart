import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'benefit.dart';
import 'compensationApply.dart';

class BenefitAndCompensation extends StatefulWidget{
  const BenefitAndCompensation({super.key});
  @override
  State<BenefitAndCompensation> createState() => _BenefitAndCompensation();
}

class _BenefitAndCompensation extends State<BenefitAndCompensation>
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
  Widget build(BuildContext context)=>Scaffold(
    appBar: AppBar(
      title: Text('Benefit And Compensation'),
      backgroundColor: Colors.blueGrey[900],
      centerTitle: true,
      bottom: TabBar(
        controller: controller,
        tabs: [
          Tab(text:'Benefit'),
          Tab(text:'Apply Claims'),
        ],
      ),
    ),
    body: TabBarView(
      controller: controller,
      children: [
        Benefit(),
        ApplyClaims(),
      ],
    ),
  );
}