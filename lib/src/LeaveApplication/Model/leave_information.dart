class Leave {
  String? _leave_id;
  String? _approval_status;
  DateTime? _date_created;
  DateTime? _leave_start;
  DateTime? _leave_end;
  String? _leave_reason;
  String? _response_message;
  String? get leave_id => this._leave_id;

  set leave_id(String? value) => this._leave_id = value;

  get approval_status => this._approval_status;

  set approval_status(value) => this._approval_status = value;

  get date_created => this._date_created;

  set date_created(value) => this._date_created = value;

  get leave_start => this._leave_start;

  set leave_start(value) => this._leave_start = value;

  get leave_end => this._leave_end;

  set leave_end(value) => this._leave_end = value;

  get leave_reason => this._leave_reason;

  set leave_reason(value) => this._leave_reason = value;

  get response_message => this._response_message;

  set response_message(value) => this._response_message = value;
}
