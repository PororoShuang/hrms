class Compensations{
 String? comp_id;
 String? user_id;
 String? comp_type;
 String? comp_desc;
 String? date_applied;
 String? approved_by;
 String? status;
 String? reject_reason;
 String? supporting_document;
 String? date_completed;

 Compensations({
   this.comp_id,
   this.user_id,
   this.comp_type,
   this.comp_desc,
   this.date_applied,
   this.status,
   this.supporting_document,
});

 get compensation_ID => this.comp_id;

 set compensation_ID(value) => this.comp_id=value;

 get user_ID => this.user_id;

 set user_ID(value) => this.user_id=value;

 get compensation_type => this.comp_type;

 set compensation_type(value) => this.comp_type=value;

 get compensation_desc => this.comp_desc;

 set compensation_desc(value) => this.comp_desc=value;

 get dateApplied => this.date_applied;

 set dateApplied(value) => this.date_applied=value;

 get approvedBy => this.approved_by;

 set approvedBy(value) => this.approved_by=value;

 get compensation_status => this.status;

 set compensation_status(value) => this.status=value;

 get rejectReason => this.reject_reason;

 set rejectReason(value) => this.reject_reason=value;

 get supportingDocument => this.supporting_document;

 set supportingDocument(value) => this.supporting_document=value;

 get dateCompleted => this.date_completed;

 set dateCompleted(value) => this.date_completed=value;


}