class Attendance {
  String? _attendance_id;
  DateTime? _start_time;
  DateTime? _end_time;
  bool? _validity;
  bool? _check_in_valid;
  bool? _check_out_valid;
  bool? on_leave;
  DateTime? _supposed_start;
  DateTime? _supposed_end;
  get attendance_id => this._attendance_id;

  set attendance_id(value) => this._attendance_id = value;

  get start_time => this._start_time;

  set start_time(value) => this._start_time = value;

  get end_time => this._end_time;

  set end_time(value) => this._end_time = value;

  get validity => this._validity;

  set validity(value) => this._validity = value;

  get check_in_valid => this._check_in_valid;

  set check_in_valid(value) => this._check_in_valid = value;

  get check_out_valid => this._check_out_valid;

  set check_out_valid(value) => this._check_out_valid = value;

  get onleave => this.on_leave;

  set onleave(value) => this.on_leave = value;

  get supposed_start => this._supposed_start;

  set supposed_start(value) => this._supposed_start = value;

  get supposed_end => this._supposed_end;

  set supposed_end(value) => this._supposed_end = value;
}
