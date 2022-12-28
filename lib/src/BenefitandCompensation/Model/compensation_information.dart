class Compensations{
 String? compensationId;
 String? userId;
 String? compensationType;
 String? compensationDesc;
 String? dateApplied;
 String? approvedBy;
 String? status;
 String? rejectReason;
 String? supportingDocuments;
 String? dateCompleted;

 Compensations({
   this.compensationId,
   this.userId,
   this.compensationType,
   this.compensationDesc,
   this.dateApplied,
   this.approvedBy,
   this.status,
   this.rejectReason,
   this.supportingDocuments,
   this.dateCompleted
});

 get compensation_ID => this.compensationId;

 set compensation_ID(value) => this.compensationId=value;

 get user_ID => this.userId;

 set user_ID(value) => this.userId=value;

 get compensation_type => this.compensationType;

 set compensation_type(value) => this.compensationType=value;

 get compensation_desc => this.compensationDesc;

 set compensation_desc(value) => this.compensationDesc=value;

 get date_applied => this.dateApplied;

 set date_applied(value) => this.dateApplied=value;

 get approved_by => this.approvedBy;

 set approved_by(value) => this.approvedBy=value;

 get compensation_status => this.status;

 set compensation_status(value) => this.status=value;

 get reject_reason => this.rejectReason;

 set reject_reason(value) => this.rejectReason=value;

 get supporting_documents => this.supportingDocuments;

 set supporting_documents(value) => this.supportingDocuments=value;

 get date_completed => this.dateCompleted;

 set date_completed(value) => this.dateCompleted=value;


}