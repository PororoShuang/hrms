class Shifts {
  String? _shift_id;
  DateTime? _shift_start;
  DateTime? _shift_end;
  bool? _is_overtime;
  String? _parent_shift;
  String? _qr_code;
  get shift_id => this._shift_id;

  set shift_id(value) => this._shift_id = value;

  get shift_start => this._shift_start;

  set shift_start(value) => this._shift_start = value;

  get shift_end => this._shift_end;

  set shift_end(value) => this._shift_end = value;

  get is_overtime => this._is_overtime;

  set is_overtime(value) => this._is_overtime = value;

  get parent_shift => this._parent_shift;

  set parent_shift(value) => this._parent_shift = value;

  get qr_code => this._qr_code;

  set qr_code(value) => this._qr_code = value;
}
