import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrms/src/BenefitandCompensation/Controller/BenefitAPI.dart';
import 'package:hrms/src/BenefitandCompensation/Model/benefit_information.dart';
import 'benefitDetails.dart';

class Benefit extends StatefulWidget {
  const Benefit({super.key});

  @override
  State<Benefit> createState() => _Benefit();
}

class _Benefit extends State<Benefit> {
  @override
  void initState() {
    super.initState();
    getBenefit();
  }

  List benefitList = [];
  bool isLoading = false;

  void getBenefit() async {
    isLoading = false;
    List<Benefits> myBenefitList = [];
    myBenefitList = await BenefitApiService().getBenefit() ?? <Benefits>[];
    if (mounted) setState(() {});
    List<Benefits> benefitDetailList = [];
    for (int i = 0; i < myBenefitList.length; i++) {
      benefitDetailList.add(myBenefitList[i]);
    }
    benefitList = benefitDetailList.toList();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Benefit'),
      backgroundColor: Colors.blueGrey[900],
      centerTitle:true,
      automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context); },),
    ),
        body: benefitList == null || benefitList.isEmpty
            ? (isLoading
                ? Image.asset(
                    "assets/noDataFound.png",
                    height: 500,
                    width: 1000,
                  )
                : const Center(child: CircularProgressIndicator()))
            : ListView.builder(
                itemCount: benefitList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title:
                                    Text(benefitList[index].benefitType ?? "-"),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BenefitDetails(
                                            myBenefits: benefitList[index])),
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 3.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " ",
                                      ),
                                      Icon(
                                        Icons.density_medium,
                                        color: Colors.indigo,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
      );
}
