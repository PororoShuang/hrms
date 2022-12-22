import 'package:flutter/material.dart';
import 'package:hrms/src/Payroll/Controller/PayrollApi.dart';
import 'package:hrms/src/Payroll/View/payroll.dart';
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

  late List<Payrolls> myPayrollList = [];

  void getData() async {
    myPayrollList = (await PayrollApiService().getPayroll())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  } //

  @override
  Widget build(BuildContext context) => Scaffold(
        body: myPayrollList == null || myPayrollList!.isEmpty
            ? const Center(child: CircularProgressIndicator())
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
                              child: Text("Month Salary :"),
                            ),
                            Container(
                              //Validity True = Not Late , False = Late
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
