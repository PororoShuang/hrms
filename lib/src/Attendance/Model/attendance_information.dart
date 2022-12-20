import 'dart:convert';

import 'package:hrms/src/Attendance/View/attendance.dart';

class Attendance {
  Attendance({
    this.attendance_id_,
    this.staff_id_,
    this.shift_id_,
    this.shift_date_,
    this.start_time_,
    this.end_time_,
    this.validity_,
    this.on_leave_,
    this.leave_id_,
    this.supposed_end_,
    this.supposed_start_,
    this.check_in_valid_,
    this.check_out_valid_,
  });

  String? attendance_id_;
  String? staff_id_;
  String? shift_id_;
  String? shift_date_;
  String? start_time_;
  String? end_time_;
  String? supposed_start_;
  String? supposed_end_;
  String? validity_;
  String? on_leave_;
  String? leave_id_;
  String? check_in_valid_;
  String? check_out_valid_;
  String? get attendanceid_ => this.attendance_id_;

  set attendanceid_(String? value) => this.attendance_id_ = value;

  get staffid_ => this.staff_id_;

  set staffid_(value) => this.staff_id_ = value;

  get shiftid_ => this.shift_id_;

  set shiftid_(value) => this.shift_id_ = value;

  get shiftdate_ => this.shift_date_;

  set shiftdate_(value) => this.shift_date_ = value;

  get starttime_ => this.start_time_;

  set starttime_(value) => this.start_time_ = value;

  get endtime_ => this.end_time_;

  set endtime_(value) => this.end_time_ = value;

  get supposedstart_ => this.supposed_start_;

  set supposedstart_(value) => this.supposed_start_ = value;

  get supposedend_ => this.supposed_end_;

  set supposedend_(value) => this.supposed_end_ = value;

  get validity => this.validity_;

  set validity(value) => this.validity_ = value;

  get onleave_ => this.on_leave_;

  set onleave_(value) => this.on_leave_ = value;

  get leaveid_ => this.leave_id_;

  set leaveid_(value) => this.leave_id_ = value;

  get checkin_valid_ => this.check_in_valid_;

  set checkin_valid_(value) => this.check_in_valid_ = value;

  get checkout_valid_ => this.check_out_valid_;

  set checkout_valid_(value) => this.check_out_valid_ = value;
}
