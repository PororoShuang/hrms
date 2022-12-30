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

  void getData() async {
    myPayrollList = (await PayrollApiService().getPayroll());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
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
                              child: Text("Month Salary : RM "),
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
                              child: Text("Overtime Pay : RM "),
                            ),
                            Container(
                              //child:Text("${DateFormat('yyyy-MM-dd kk:mm').format(e.shiftTime!)}")
                              //child: Text("${e.shiftTime!=null?e.shiftTime:"9.00"}"),
                              //"${DateFormat('yyyy-MM-dd kk:mm').format(e.shiftTime!)}"
                              child: e.overtime_pay != null
                                  ?
                                  // Text(
                                  //     "${DateFormat("HH:mm:ss").format(e.shiftTime!)}")
                                  Text(e.overtime_pay.toString() + " / hour")
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
                              child: Text("Total KWSP : RM"),
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
                              child: Text("Total Zakat : RM "),
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
