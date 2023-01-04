class Document{
  String? document_id;
  String? owner_id;
  String? document_name;
  String? date_created;
  String? expiry_date;
  String? notify_date;
  String? document_path;

  Document({
    this.document_id,
    this.owner_id,
    this.document_name,
    this.date_created,
    this.expiry_date,
    this.notify_date,
    this.document_path
});

  get documentId => this.document_id;

  set documentId(value) => this.document_id=value;

  get ownerId => this.owner_id;

  set ownerId(value) => this.owner_id=value;

  get documentName => this.document_name;

  set documentName(value) => this.document_name=value;

  get dateCreated => this.date_created;

  set dateCreated(value) => this.date_created=value;

  get expiryDate => this.expiry_date;

  set expiryDate(value) => this.expiry_date=value;

  get notifyDate => this.notify_date;

  set notifyDate(value) => this.notify_date=value;

  get documentPath => this.document_path;

  set documentPath(value) => this.document_path=value;

}