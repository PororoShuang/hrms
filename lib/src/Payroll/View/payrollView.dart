import 'package:flutter/material.dart';
import 'package:hrms/src/Payroll/Controller/PayrollApi.dart';
import 'package:hrms/src/Payroll/Model/payroll_information.dart';

class PayrollView extends StatefulWidget {
  const PayrollView({super.key});

  @override
  State<PayrollView> createState() => _PayrollView();
}

class _PayrollView extends State<PayrollView> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  late List<Payrolls>? myPayrollList = [];
  bool isLoading = false;

  void getData() async {
    isLoading = false;
    myPayrollList = (await PayrollApiService().getPayroll());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {   isLoading = true;}));
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Payroll'),
          backgroundColor: Colors.blueGrey[900],
          centerTitle: true,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: myPayrollList == null || myPayrollList!.isEmpty
            ? (isLoading
            ? Image.asset(
          "assets/noDataFound.png",
          height: 500,
          width: 1000,
        )
            : const Center(child: CircularProgressIndicator()))
            : ListView(
                children: myPayrollList!.map((e) {
                  return Card(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("Date Created :"),
                            ),
                            Container(
                              child:
                                  Text(e.date_created.toString().split(" ")[0]),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("Month Salary :"),
                            ),
                            Container(
                              child: Text(e.month_salary),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("Overtime Pay :"),
                            ),
                            Container(
                              //child:Text("${DateFormat('yyyy-MM-dd kk:mm').format(e.shiftTime!)}")
                              //child: Text("${e.shiftTime!=null?e.shiftTime:"9.00"}"),
                              //"${DateFormat('yyyy-MM-dd kk:mm').format(e.shiftTime!)}"
                              child: e.overtime_pay != null
                                  ?
                                  // Text(
                                  //     "${DateFormat("HH:mm:ss").format(e.shiftTime!)}")
                                  Text(e.overtime_pay.toString())
                                  : Text("-"),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("Total KWSP :"),
                            ),
                            Container(
                              child: e.kwsp_total != null
                                  ?
                                  // Text(
                                  //     "${DateFormat('yyyy-MM-dd').format(e.shiftDate!)}")
                                  Text(e.kwsp_total.toString())
                                  : Text("-"),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 40.0),
                              child: Text("Total Zakat :"),
                            ),
                            Container(
                              child: e.zakat_total != null
                                  ?
                                  // Text(
                                  //     "${DateFormat('HH:mm:ss').format(e.start_time_!)}")
                                  Text((e.zakat_total.toString()))
                                  : Text("-"),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
      );
}
