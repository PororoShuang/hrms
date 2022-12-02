class Payroll {
  String? _payroll_id;
  double? _month_salary;
  double? _overtime_pay;
  double? kwsp_tota;
  double? zakat_total;
  get payroll_id => this._payroll_id;

  set payroll_id(value) => this._payroll_id = value;

  get month_salary => this._month_salary;

  set month_salary(value) => this._month_salary = value;

  get overtime_pay => this._overtime_pay;

  set overtime_pay(value) => this._overtime_pay = value;

  get kwsptota => this.kwsp_tota;

  set kwsptota(value) => this.kwsp_tota = value;

  get zakattotal => this.zakat_total;

  set zakattotal(value) => this.zakat_total = value;
}
