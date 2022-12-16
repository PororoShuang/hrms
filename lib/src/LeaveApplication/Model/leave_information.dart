class Leaves {
  String? leave_id;
  String? staff_id;
  String? approval_status;
  String? approved_by;
  String? date_created;
  String? leave_start;
  String? leave_end;
  String? leave_type;
  String? doc_file_path;
  String? leave_reason;
  String? response_message;
  String? leave_start_time;
  String? leave_end_time;

  // @override
  // String toString() {
  //   return "($approval_status,$approved_by,$date_created,$leave_start,\n$leave_end,$leave_type,$leave_reason,$response_message)";
  // }
  Leaves(
      {this.leave_start,
        this.leave_end,
        this.leave_type,
        this.leave_reason,
        this.leave_start_time,
        this.leave_end_time,
        this.date_created,
        this.approval_status});

  get leavetype => this.leave_type;

  set leavetype(value) => this.leave_type = value;
  get leaveid => this.leave_id;

  set leaveid(value) => this.leave_id = value;

  get staffid => this.staff_id;

  set staffid(value) => this.staff_id = value;

  get approvalstatus => this.approval_status;

  set approvalstatus(value) => this.approval_status = value;

  get approvedby => this.approved_by;

  set approvedby(value) => this.approved_by = value;

  get datecreated => this.date_created;

  set datecreated(value) => this.date_created = value;

  get leavestart => this.leave_start;

  set leavestart(value) => this.leave_start = value;

  get leaveend => this.leave_end;

  set leaveend(value) => this.leave_end = value;

  get docfile_path => this.doc_file_path;

  set docfile_path(value) => this.doc_file_path = value;

  get leavereason => this.leave_reason;

  set leavereason(value) => this.leave_reason = value;

  get responsemessage => this.response_message;

  set responsemessage(value) => this.response_message = value;
}
