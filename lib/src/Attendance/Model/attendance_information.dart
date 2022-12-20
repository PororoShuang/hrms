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
}
