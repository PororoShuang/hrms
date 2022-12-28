class Payrolls {
  String? _payroll_id;
  String? _date_created;
  String? _month_salary;
  String? _overtime_pay;
  String? kwsp_total;
  String? zakat_total;
  get payroll_id => this._payroll_id;

  set payroll_id(value) => this._payroll_id = value;

  get date_created => this._date_created;

  set date_created(value) => this._date_created = value;

  get month_salary => this._month_salary;

  set month_salary(value) => this._month_salary = value;

  get overtime_pay => this._overtime_pay;

  set overtime_pay(value) => this._overtime_pay = value;

  get kwsptotal => this.kwsp_total;

  set kwsptotal(value) => this.kwsp_total = value;

  get zakattotal => this.zakat_total;

  set zakattotal(value) => this.zakat_total = value;
}
