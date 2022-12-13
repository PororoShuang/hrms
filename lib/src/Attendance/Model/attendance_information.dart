import 'dart:convert';

import 'package:hrms/src/Attendance/View/attendance.dart';

List<Attendance> attFromJson(String str) =>
    List<Attendance>.from(json.decode(str).map((x) => Attendance.fromJson(x)));
String attToJson(List<Attendance> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Attendance {
  Attendance({
    this.attendance_id_,
    this.start_time_,
    this.end_time_,
    this.validity_,
    this.check_in_valid_,
    this.check_out_valid_,
    this.on_leave,
    this.supposed_start_,
    this.supposed_end_,
  });

  String? attendance_id_;
  DateTime? start_time_;
  DateTime? end_time_;
  bool? validity_;
  bool? check_in_valid_;
  bool? check_out_valid_;
  bool? on_leave;
  DateTime? supposed_start_;
  DateTime? supposed_end_;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        attendance_id_: json["att_id"],
        start_time_: json["start time"],
        end_time_: json["end_time"],
        validity_: json["validity"],
        check_in_valid_: json["cin_valid"],
        check_out_valid_: json["cout_valid"],
        supposed_start_: json["supposed_s"],
        supposed_end_: json["supposed_e"],
      );

  Map<String, dynamic> toJson() => {
        "att_id": attendance_id_,
        "start time": start_time_,
        "end_time": end_time_,
        "validity": validity_,
        "cin_valid": check_in_valid_,
        "cout_valid": check_out_valid_,
        "supposed_s": supposed_start_,
        "supposed_e": supposed_end_,
      };
  get attendance_id => this.attendance_id_;

  set attendance_id(value) => this.attendance_id_ = value;

  get start_time => this.start_time_;

  set start_time(value) => this.start_time_ = value;

  get end_time => this.end_time_;

  set end_time(value) => this.end_time_ = value;

  get validity => this.validity_;

  set validity(value) => this.validity_ = value;

  get check_in_valid => this.check_in_valid_;

  set check_in_valid(value) => this.check_in_valid_ = value;

  get check_out_valid => this.check_out_valid_;

  set check_out_valid(value) => this.check_out_valid_ = value;

  get onleave => this.on_leave;

  set onleave(value) => this.on_leave = value;

  get supposed_start => this.supposed_start_;

  set supposed_start(value) => this.supposed_start_ = value;

  get supposed_end => this.supposed_end_;

  set supposed_end(value) => this.supposed_end_ = value;
}
