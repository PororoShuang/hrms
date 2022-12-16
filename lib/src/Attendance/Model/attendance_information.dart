import 'dart:convert';

import 'package:hrms/src/Attendance/View/attendance.dart';

// List<Attendance> attFromJson(String str) =>
//     List<Attendance>.from(json.decode(str).map((x) => Attendance.fromJson(x)));
// String attToJson(List<Attendance> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Attendance {
  Attendance({
    this.attendance_id_,
    this.staff_id_,
    this.shift_id_,
    this.start_time_,
    this.end_time_,
    this.validity_,
    this.on_leave_,
    this.leave_id_,
    this.supposed_end_,
    this.supposed_start_,
    this.status,
    this.shiftTime,
    this.shiftDate,
  });

  String? attendance_id_;
  String? staff_id_;
  String? shift_id_;
  DateTime? start_time_;
  DateTime? end_time_;
  bool? validity_;
  bool? on_leave_;
  String? leave_id_;
  DateTime? supposed_start_;
  DateTime? supposed_end_;
  String? status;
  DateTime? shiftTime;
  DateTime? shiftDate;

  get attendanceid_ => this.attendance_id_;

  set attendanceid_(value) => this.attendance_id_ = value;

  get staffid_ => this.staff_id_;

  set staffid_(value) => this.staff_id_ = value;

  get shiftid_ => this.shift_id_;

  set shiftid_(value) => this.shift_id_ = value;

  get starttime_ => this.start_time_;

  set starttime_(value) => this.start_time_ = value;

  get endtime_ => this.end_time_;

  set endtime_(value) => this.end_time_ = value;

  get validity => this.validity_;

  set validity(value) => this.validity_ = value;

  get onleave_ => this.on_leave_;

  set onleave_(value) => this.on_leave_ = value;

  get leaveid_ => this.leave_id_;

  set leaveid_(value) => this.leave_id_ = value;

  get supposedstart_ => this.supposed_start_;

  set supposedstart_(value) => this.supposed_start_ = value;

  get supposedend_ => this.supposed_end_;

  set supposedend_(value) => this.supposed_end_ = value;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        attendance_id_: json["att_id"],
        staff_id_: json["staff id"],
        shift_id_: json["shift id"],
        start_time_: json["start time"],
        end_time_: json["end_time"],
        validity_: json["validity"],
        on_leave_: json["on leave"],
        leave_id_: json["leave id"],
        supposed_end_: json["supposed_e"],
        supposed_start_: json["supposed_s"],
      );

  Map<String, dynamic> toJson() => {
        "att_id": attendance_id_,
        "staff id": staff_id_,
        "shift id": shift_id_,
        "start time": start_time_,
        "end_time": end_time_,
        "validity": validity_,
        "on leave": on_leave_,
        "leave id": leave_id_,
        "supposed_e": supposed_end_,
        "supposed_s": supposed_start_,
      };
}
